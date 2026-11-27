import { notFound } from "next/navigation";
import Link from "next/link";
import { sql } from "@/lib/db";
import { KIND_LABEL, fmtH } from "@/lib/ui";
import SubjectChip from "@/components/SubjectChip";
import Prose from "@/components/Prose";
import Question from "@/components/Question";
import { CompleteForm, ResetForm } from "@/components/Forms";

export const dynamic = "force-dynamic";
type Block = { id: number; subject: string; kind: "teoria" | "exercicios" | "revisao"; title: string; minutes: number; content: string | null };
type Q = { id: number; block_id: number; statement: string; options: Record<string, string>; correct_option: string; explanation: string | null; chosen: string | null; correct: boolean | null };

export default async function Dia({ params }: { params: Promise<{ id: string }> }) {
  const dayId = Number((await params).id);
  if (!Number.isFinite(dayId)) notFound();
  const day = (await sql`select id, week, day_number, title, track from days where id = ${dayId}`)[0] as { id: number; week: number; day_number: number; title: string; track: string } | undefined;
  if (!day) notFound();
  const isTjsp = day.track === "tjsp";

  const blocks = (await sql`select id, subject, kind, title, minutes, content from blocks where day_id = ${dayId} order by order_index`) as Block[];
  const ids = blocks.map((b) => b.id), exIds = blocks.filter((b) => b.kind === "exercicios").map((b) => b.id);
  const done = new Set(((await sql`select block_id from block_completions where block_id = any(${ids})`) as { block_id: number }[]).map((c) => c.block_id));
  const qs = exIds.length ? ((await sql`
    select q.id, q.block_id, q.statement, q.options, q.correct_option, q.explanation, a.chosen, a.correct
    from questions q
    left join lateral (select chosen, correct from answers where question_id = q.id order by created_at desc limit 1) a on true
    where q.block_id = any(${exIds}) order by q.block_id, q.order_index`) as Q[]) : [];
  const order = (await sql`select id from days where track = ${day.track} order by week, day_number`) as { id: number }[];
  const pos = order.findIndex((d) => d.id === dayId), prev = order[pos - 1], nextDay = order[pos + 1];

  const byBlock = new Map<number, Q[]>();
  for (const q of qs) byBlock.set(q.block_id, [...(byBlock.get(q.block_id) ?? []), q]);
  const isDone = (b: Block) => b.kind === "exercicios" ? (byBlock.get(b.id) ?? []).length > 0 && (byBlock.get(b.id) ?? []).every((q) => q.chosen) : done.has(b.id);
  const nDone = blocks.filter(isDone).length;
  const rotulo = isTjsp ? `Bloco ${day.week - 100} · Módulo ${day.day_number}` : `Semana ${day.week} · Dia ${day.day_number}`;

  return (
    <div className="space-y-5">
      <header>
        <Link href={isTjsp ? "/tjsp" : "/estudar"} className="text-sm font-bold text-brand">← {isTjsp ? "Curso TJSP" : "Trilha de estudo"}</Link>
        <p className="mt-2 text-xs font-bold text-muted">{rotulo} · {fmtH(blocks.reduce((a, b) => a + b.minutes, 0))}</p>
        <h1 className="text-xl font-extrabold leading-snug tracking-tight sm:text-2xl">{day.title}</h1>
        <div className="mt-3 flex items-center gap-3"><div className="h-2 flex-1 overflow-hidden rounded-full bg-line"><div className="h-full rounded-full bg-brand transition-all" style={{ width: `${(nDone / blocks.length) * 100}%` }} /></div><span className="text-xs font-bold text-muted">{nDone}/{blocks.length}</span></div>
      </header>

      <nav aria-label="Blocos do dia" className="sticky top-0 z-30 -mx-4 flex gap-2 overflow-x-auto bg-bg/90 px-4 py-2 backdrop-blur md:-mx-10 md:px-10">
        {blocks.map((b, i) => (
          <a key={b.id} href={`#b-${b.id}`} className={`flex shrink-0 items-center gap-1.5 rounded-full border px-3 py-1.5 text-xs font-bold ${isDone(b) ? "border-ok text-ok" : "border-line text-muted"}`}>
            <span>{isDone(b) ? "✓" : i + 1}</span>{KIND_LABEL[b.kind]}
          </a>
        ))}
      </nav>

      {blocks.map((b, i) => {
        const bq = byBlock.get(b.id) ?? [], ok = isDone(b), isPassage = !!b.content && /^Texto-base/i.test(b.content);
        const passage = isPassage ? b.content!.replace(/^Texto-base[^:]*:\s*/i, "").replace(/^["“]|["”]$/g, "") : null;
        const hits = bq.filter((q) => q.correct).length;
        return (
          <section key={b.id} id={`b-${b.id}`} className="scroll-mt-16">
            <details open={b.kind === "exercicios" || !ok} className="card">
              <summary className="flex cursor-pointer list-none items-center gap-3 p-4">
                <span className={`grid h-8 w-8 shrink-0 place-items-center rounded-full text-sm font-extrabold ${ok ? "bg-ok-soft text-ok" : "bg-surface2 text-muted"}`}>{ok ? "✓" : i + 1}</span>
                <div className="min-w-0 flex-1"><p className="text-sm font-extrabold leading-snug">{b.title}</p><div className="mt-1 flex flex-wrap items-center gap-2"><SubjectChip name={b.subject} /><span className="text-[11px] font-bold text-muted">{KIND_LABEL[b.kind]} · {b.minutes} min</span></div></div>
              </summary>
              <div className="space-y-4 border-t border-line p-4 sm:p-5">
                {b.kind === "exercicios" ? (
                  <>
                    {passage && (
                      <figure className="rounded-xl border-l-4 border-brand bg-surface2 p-4">
                        <figcaption className="mb-1 text-[11px] font-extrabold uppercase tracking-wide text-brand">Texto-base — leia antes de responder</figcaption>
                        <blockquote className="text-[15px] leading-relaxed">{passage}</blockquote>
                      </figure>
                    )}
                    {b.content && !isPassage && <p className="text-sm text-muted">{b.content}</p>}
                    {bq.map((q, k) => (
                      <Question key={q.id} id={q.id} index={k + 1} total={bq.length} statement={q.statement} options={q.options}
                        initial={q.chosen ? { chosen: q.chosen, correct: !!q.correct, correctOption: q.correct_option, explanation: q.explanation } : null} />
                    ))}
                    {ok && (
                      <div className="card flex flex-wrap items-center justify-between gap-3 bg-brand-soft p-4">
                        <p className="text-sm font-extrabold">Resultado: {hits}/{bq.length} acertos ({Math.round((hits / bq.length) * 100)}%)</p>
                        <ResetForm blockId={b.id} />
                      </div>
                    )}
                  </>
                ) : (
                  <>
                    {b.content && <Prose text={b.content} />}
                    {ok ? <p className="text-sm font-extrabold text-ok">✓ Concluído</p> : <CompleteForm blockId={b.id} minutes={b.minutes} />}
                  </>
                )}
              </div>
            </details>
          </section>
        );
      })}

      <footer className="flex items-center justify-between gap-3 pt-2">
        {prev ? <Link href={`/estudar/${prev.id}`} className="btn btn-soft">← Anterior</Link> : <span />}
        {nextDay ? <Link href={`/estudar/${nextDay.id}`} className="btn">Próximo →</Link> : <span />}
      </footer>
    </div>
  );
}