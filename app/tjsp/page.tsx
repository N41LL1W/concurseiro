import Link from "next/link";
import { getDays } from "@/lib/queries";
import { BLOCOS, TITULOS } from "@/lib/tjsp-plano";
import { fmtH } from "@/lib/ui";
import Ring from "@/components/Ring";

export const dynamic = "force-dynamic";
export const metadata = { title: "TJSP" };

export default async function Tjsp() {
  const days = await getDays("tjsp");
  const byMod = new Map(days.map((d) => [d.day_number, d]));
  const concluidos = days.filter((d) => d.done === d.total).length;
  const next = days.find((d) => d.done < d.total)?.id;
  return (
    <div className="space-y-6">
      <header>
        <h1 className="text-2xl font-extrabold tracking-tight sm:text-3xl">TJSP — curso completo</h1>
        <p className="text-sm text-muted">{days.length} de {TITULOS.length} módulos disponíveis · {concluidos} concluídos</p>
      </header>
      {BLOCOS.map((b) => (
        <section key={b.n}>
          <h2 className="text-xs font-extrabold uppercase tracking-wide text-muted">Bloco {["I", "II", "III"][b.n - 1]} — {b.titulo}</h2>
          <p className="mb-2 text-xs text-muted">{b.info}</p>
          <ul className="grid gap-3 sm:grid-cols-2">
            {Array.from({ length: b.ate - b.de + 1 }, (_, i) => b.de + i).map((n) => {
              const d = byMod.get(n);
              if (!d) {
                return (
                  <li key={n} className="card flex items-center gap-3 p-4 opacity-55">
                    <span className="grid h-10 w-10 shrink-0 place-items-center rounded-full bg-surface2 text-xs font-extrabold text-muted">{n}</span>
                    <div className="min-w-0"><p className="text-sm font-semibold leading-snug">{TITULOS[n - 1]}</p><p className="text-[11px] font-bold text-muted">Em breve</p></div>
                  </li>
                );
              }
              const complete = d.done === d.total;
              return (
                <li key={n}>
                  <Link href={`/estudar/${d.id}`} className={`card flex h-full gap-4 p-4 transition hover:border-brand ${d.id === next ? "ring-2 ring-brand" : ""}`}>
                    <Ring pct={(d.done / d.total) * 100} label={complete ? "✓" : `${d.done}/${d.total}`} />
                    <div className="min-w-0 flex-1">
                      <div className="flex flex-wrap items-center gap-x-2 gap-y-1 text-xs font-bold text-muted">
                        <span>Módulo {n}</span><span>·</span><span>{fmtH(d.minutes)}</span>
                        {d.id === next && <span className="rounded-full bg-brand px-2 py-0.5 text-[10px] text-brand-ink">PRÓXIMO</span>}
                        {complete && <span className="text-ok">Concluído</span>}
                        {!complete && d.done > 0 && <span className="text-warn">Em andamento</span>}
                      </div>
                      <p className="mt-1 text-sm font-bold leading-snug">{d.title}</p>
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