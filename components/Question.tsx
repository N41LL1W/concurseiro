"use client";
import { useActionState, useState } from "react";
import { submitAnswer } from "@/app/actions";
import type { AnswerResult } from "@/lib/types";
const KEYS = ["A", "B", "C", "D", "E"];
export default function Question({ id, index, total, statement, options, initial }: {
  id: number; index: number; total: number; statement: string; options: Record<string, string>; initial: AnswerResult | null;
}) {
  const [res, action, pending] = useActionState(submitAnswer, initial);
  const [sel, setSel] = useState<string | null>(null);
  const [conf, setConf] = useState(75);
  return (
    <form action={action} className="card p-4 sm:p-5">
      <input type="hidden" name="questionId" value={id} />
      <input type="hidden" name="chosen" value={sel ?? ""} />
      <input type="hidden" name="confidence" value={conf} />
      <div className="flex items-center justify-between text-xs font-bold text-muted">
        <span>Questão {index} de {total}</span>
        {res && <span className={res.correct ? "text-ok" : "text-bad"}>{res.correct ? "Acertou" : "Errou"}</span>}
      </div>
      <p className="mt-2 text-[15px] leading-relaxed">{statement}</p>
      <div className="mt-4 grid gap-2" role="radiogroup" aria-label="Alternativas">
        {KEYS.filter((k) => k in options).map((k) => {
          let cls = "border-line hover:border-brand";
          if (res) cls = k === res.correctOption ? "border-ok bg-ok-soft" : k === res.chosen ? "border-bad bg-bad-soft" : "border-line opacity-60";
          else if (sel === k) cls = "border-brand bg-brand-soft";
          return (
            <button key={k} type="button" role="radio" aria-checked={sel === k} disabled={!!res || pending} onClick={() => setSel(k)}
              className={`flex min-h-12 w-full items-start gap-3 rounded-xl border px-3 py-3 text-left text-sm transition ${cls}`}>
              <span className="grid h-6 w-6 shrink-0 place-items-center rounded-full border border-current text-xs font-bold">{k}</span>
              <span className="pt-0.5">{options[k]}</span>
            </button>
          );
        })}
      </div>
      {!res ? (
        <div className="mt-4 flex flex-wrap items-center justify-between gap-3">
          <div className="flex items-center gap-1.5 text-xs text-muted" role="group" aria-label="Confiança na resposta">
            <span className="mr-1 font-semibold">Confiança</span>
            {[50, 75, 100].map((v) => (
              <button key={v} type="button" aria-pressed={conf === v} onClick={() => setConf(v)}
                className={`min-h-9 rounded-lg border px-2.5 font-bold ${conf === v ? "border-brand bg-brand-soft text-brand" : "border-line"}`}>{v}%</button>
            ))}
          </div>
          <button className="btn" disabled={!sel || pending}>{pending ? "Enviando…" : "Responder"}</button>
        </div>
      ) : (
        <div className={`mt-4 rounded-xl p-3.5 text-sm ${res.correct ? "bg-ok-soft" : "bg-bad-soft"}`}>
          <p className="font-bold">{res.correct ? "✓ Correto" : `✗ Incorreto — gabarito: ${res.correctOption}`}</p>
          {res.explanation && <p className="mt-1 text-[13px] leading-relaxed">{res.explanation}</p>}
          {!res.correct && <p className="mt-2 text-xs text-muted">Salvo no caderno de erros, com revisão em 24h, 7 e 30 dias.</p>}
        </div>
      )}
    </form>
  );
}
