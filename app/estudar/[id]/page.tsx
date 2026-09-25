import { notFound } from "next/navigation";
import Link from "next/link";
import { sql } from "@/lib/db";
import { completeBlock, submitAnswer } from "../../actions";

export const dynamic = "force-dynamic";

type Block = {
  id: number; order_index: number; subject: string;
  kind: "teoria" | "exercicios" | "revisao"; title: string; minutes: number;
  content: string | null;
};
type Question = {
  id: number; block_id: number; order_index: number; subject: string;
  statement: string; options: Record<string, string>; correct_option: string;
  explanation: string | null; chosen: string | null; confidence: number | null; correct: boolean | null;
};

const OPTION_KEYS = ["A", "B", "C", "D", "E"] as const;
const btn = "rounded bg-[var(--teal)] px-4 py-2 text-sm font-medium text-white";

export default async function Dia({ params }: { params: Promise<{ id: string }> }) {
  const dayId = Number((await params).id);
  if (!Number.isFinite(dayId)) notFound();

  const dayRows = await sql`select id, week, day_number, title from days where id = ${dayId}`;
  const day = dayRows[0] as { id: number; week: number; day_number: number; title: string } | undefined;
  if (!day) notFound();

  const blocks = (await sql`
    select id, order_index, subject, kind, title, minutes, content
    from blocks where day_id = ${dayId} order by order_index
  `) as Block[];
  const blockIds = blocks.map((b) => b.id);

  const completions = blockIds.length
    ? ((await sql`select block_id from block_completions where block_id = any(${blockIds})`) as { block_id: number }[])
    : [];
  const doneSet = new Set(completions.map((c) => c.block_id));

  const exerciseBlockIds = blocks.filter((b) => b.kind === "exercicios").map((b) => b.id);
  const questions = exerciseBlockIds.length
    ? ((await sql`
        select q.id, q.block_id, q.order_index, q.subject, q.statement, q.options,
               q.correct_option, q.explanation, a.chosen, a.confidence, a.correct
        from questions q
        left join lateral (
          select chosen, confidence, correct from answers
          where question_id = q.id order by created_at desc limit 1
        ) a on true
        where q.block_id = any(${exerciseBlockIds})
        order by q.order_index
      `) as Question[])
    : [];
  const byBlock = new Map<number, Question[]>();
  for (const q of questions) byBlock.set(q.block_id, [...(byBlock.get(q.block_id) ?? []), q]);

  return (
    <main className="space-y-8">
      <div>
        <Link href="/estudar" className="text-sm underline-offset-4 hover:underline">← Trilha de estudo</Link>
        <p className="mt-2 text-xs">Semana {day.week} · Dia {day.day_number}</p>
        <h1 className="text-2xl font-bold">{day.title}</h1>
      </div>

      {blocks.map((block) => (
        <section key={block.id} className="border-t-2 border-[var(--ink)] pt-4">
          <p className="text-xs">{block.subject} · {block.minutes} min</p>
          <h2 className="mb-3 text-lg font-bold">{block.title}</h2>

          {block.kind !== "exercicios" && (
            <>
              {block.content && (
                <p className="mb-4 whitespace-pre-wrap text-sm leading-relaxed">{block.content}</p>
              )}
              {doneSet.has(block.id) ? (
                <p className="text-sm font-bold text-[var(--teal)]">✓ Concluído</p>
              ) : (
                <form action={completeBlock}>
                  <input type="hidden" name="blockId" value={block.id} />
                  <input type="hidden" name="minutes" value={block.minutes} />
                  <button className={btn}>Marcar como concluído</button>
                </form>
              )}
            </>
          )}

          {block.kind === "exercicios" &&
            (byBlock.get(block.id) ?? []).map((q, i) => (
              <div key={q.id} className="border-t border-[var(--line)] py-4">
                <p className="mb-2 text-sm font-medium">{i + 1}. {q.statement}</p>
                {q.chosen ? (
                  <div className="space-y-1 text-sm">
                    <p>
                      Sua resposta: <b>{q.chosen}</b> —{" "}
                      {q.correct ? (
                        <span className="font-bold text-[var(--teal)]">correta</span>
                      ) : (
                        <span className="font-bold text-[var(--amber)]">incorreta (certa: {q.correct_option})</span>
                      )}
                    </p>
                    {q.explanation && <p className="text-xs">{q.explanation}</p>}
                  </div>
                ) : (
                  <form action={submitAnswer} className="space-y-2 text-sm">
                    <input type="hidden" name="questionId" value={q.id} />
                    {OPTION_KEYS.filter((k) => k in q.options).map((k) => (
                      <label key={k} className="flex gap-2">
                        <input type="radio" name="chosen" value={k} required />
                        <span>{k}) {q.options[k]}</span>
                      </label>
                    ))}
                    <label className="flex items-center gap-2 text-xs">
                      Confiança
                      <input
                        type="number" name="confidence" min={0} max={100} defaultValue={80}
                        className="w-16 rounded border border-[var(--line)] px-2 py-1"
                      />
                      %
                    </label>
                    <button className={btn}>Responder</button>
                  </form>
                )}
              </div>
            ))}
        </section>
      ))}
    </main>
  );
}
