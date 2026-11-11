import Link from "next/link";
import { getDays } from "@/lib/queries";
import { fmtH } from "@/lib/ui";
import SubjectChip from "@/components/SubjectChip";
import Ring from "@/components/Ring";
export const dynamic = "force-dynamic";
export const metadata = { title: "Estudar" };

export default async function Estudar() {
  const days = await getDays();
  const next = days.find((d) => d.done < d.total)?.id;
  const weeks = Array.from(new Set(days.map((d) => d.week)));
  return (
    <div className="space-y-6">
      <header>
        <h1 className="text-2xl font-extrabold tracking-tight sm:text-3xl">Trilha de estudo</h1>
        <p className="text-sm text-muted">{days.filter((d) => d.done === d.total).length} de {days.length} dias concluídos</p>
      </header>
      {days.length === 0 && <p className="card p-5 text-sm text-muted">Nenhum dia cadastrado. Rode <code>db/dia1_v2.sql</code> (e os seguintes) no SQL Editor do Neon.</p>}
      {weeks.map((w) => (
        <section key={w}>
          <h2 className="mb-2 text-xs font-extrabold uppercase tracking-wide text-muted">Semana {w}</h2>
          <ul className="grid gap-3 sm:grid-cols-2">
            {days.filter((d) => d.week === w).map((d) => {
              const complete = d.done === d.total;
              return (
                <li key={d.id}>
                  <Link href={`/estudar/${d.id}`} className={`card flex h-full gap-4 p-4 transition hover:border-brand ${d.id === next ? "ring-2 ring-brand" : ""}`}>
                    <Ring pct={(d.done / d.total) * 100} label={complete ? "✓" : `${d.done}/${d.total}`} />
                    <div className="min-w-0 flex-1">
                      <div className="flex flex-wrap items-center gap-x-2 gap-y-1 text-xs font-bold text-muted">
                        <span>Dia {d.day_number}</span><span>·</span><span>{fmtH(d.minutes)}</span>
                        {d.id === next && <span className="rounded-full bg-brand px-2 py-0.5 text-[10px] text-brand-ink">PRÓXIMO</span>}
                        {complete && <span className="text-ok">Concluído</span>}
                        {!complete && d.done > 0 && <span className="text-warn">Em andamento</span>}
                      </div>
                      <p className="mt-1 text-sm font-bold leading-snug">{d.title}</p>
                      <div className="mt-2 flex flex-wrap gap-1.5">{(d.subjects ?? []).slice(0, 4).map((s) => <SubjectChip key={s} name={s} />)}</div>
                    </div>
                  </Link>
                </li>
              );
            })}
          </ul>
        </section>
      ))}
    </div>
  );
}
