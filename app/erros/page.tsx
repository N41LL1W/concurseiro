import Link from "next/link";
import { sql } from "@/lib/db";
import { SUBJECTS } from "@/lib/plan";
import { markReviewed } from "../actions";
import SubjectChip from "@/components/SubjectChip";
export const dynamic = "force-dynamic";
export const metadata = { title: "Caderno de erros" };
type E = { id: number; subject: string; note: string; reviewed: number; created: string; due: boolean; statement: string | null };

export default async function Erros({ searchParams }: { searchParams: Promise<{ materia?: string }> }) {
  const materia = (await searchParams).materia ?? "";
  const rows = (await sql`
    select e.id, e.subject, e.note, e.reviewed, to_char(e.created, 'DD/MM/YYYY') created, q.statement,
      (e.reviewed < 3 and current_date >= e.created + (case e.reviewed when 0 then 1 when 1 then 7 else 30 end)) as due
    from errors e left join questions q on q.id = e.question_id
    where (${materia} = '' or e.subject = ${materia})
    order by due desc, e.created desc, e.id desc limit 200`) as E[];
  const dueN = rows.filter((r) => r.due).length;
  return (
    <div className="space-y-5">
      <header><h1 className="text-2xl font-extrabold tracking-tight sm:text-3xl">Caderno de erros</h1><p className="text-sm text-muted">{rows.length} anotações · {dueN} para revisar hoje (ciclos de 24h, 7 e 30 dias)</p></header>
      <nav aria-label="Filtrar por matéria" className="-mx-4 flex gap-2 overflow-x-auto px-4 pb-1 md:mx-0 md:flex-wrap md:px-0">
        {["", ...Object.keys(SUBJECTS)].map((m) => (
          <Link key={m} href={m ? `/erros?materia=${encodeURIComponent(m)}` : "/erros"} className={`shrink-0 rounded-full border px-3 py-1.5 text-xs font-bold ${m === materia ? "border-brand bg-brand-soft text-brand" : "border-line text-muted"}`}>{m || "Todas"}</Link>
        ))}
      </nav>
      {rows.length === 0 && <p className="card p-5 text-sm text-muted">Nenhum erro por aqui. Quando você errar uma questão, ela aparece automaticamente.</p>}
      <ul className="space-y-2">
        {rows.map((e) => (
          <li key={e.id} className={`card p-4 ${e.due ? "border-warn" : ""}`}>
            <div className="flex flex-wrap items-center gap-2"><SubjectChip name={e.subject} /><span className="text-[11px] font-bold text-muted">{e.created}</span>
              <span className="text-[11px] font-bold text-muted">· {e.reviewed >= 3 ? "ciclo completo ✓" : `${e.reviewed}/3 revisões`}</span>{e.due && <span className="rounded-full bg-warn-soft px-2 py-0.5 text-[10px] font-extrabold text-warn">REVISAR HOJE</span>}</div>
            {e.statement && <p className="mt-2 text-xs italic text-muted">“{e.statement.length > 140 ? e.statement.slice(0, 140) + "…" : e.statement}”</p>}
            <p className="mt-2 text-sm leading-relaxed">{e.note}</p>
            {e.due && <form action={markReviewed} className="mt-3"><input type="hidden" name="id" value={e.id} /><button className="btn btn-soft !min-h-10 text-xs">Marcar como revisada ✓</button></form>}
          </li>
        ))}
      </ul>
    </div>
  );
}
