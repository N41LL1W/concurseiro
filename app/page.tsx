import { sql } from "@/lib/db";
import { SUBJECTS, WEEK_GOAL_H, TARGET_PCT } from "@/lib/plan";
import { markReviewed } from "./actions";

export const dynamic = "force-dynamic";

type Hours = { subject: string; m: number };
type Qs = { subject: string; t: number; c: number };
type Due = { id: number; subject: string; note: string; reviewed: number };

export default async function Painel() {
  const [hours, qs, due] = (await Promise.all([
    sql`select subject, sum(m)::int m from (
          select subject, minutes m from sessions
            where day >= date_trunc('week', current_date)
          union all
          select b.subject, bc.minutes m from block_completions bc
            join blocks b on b.id = bc.block_id
            where bc.day >= date_trunc('week', current_date)
        ) x group by subject`,
    sql`select subject, sum(t)::int t, sum(c)::int c from (
          select subject, total t, correct c from question_logs
          union all
          select q.subject, count(*)::int t, count(*) filter (where a.correct)::int c
            from answers a join questions q on q.id = a.question_id group by q.subject
        ) x group by subject`,
    sql`select id, subject, note, reviewed from errors
        where reviewed < 3 and current_date >=
          created + (case reviewed when 0 then 1 when 1 then 7 else 30 end)
        order by created`,
  ])) as [Hours[], Qs[], Due[]];

  const h = Object.fromEntries(hours.map((x) => [x.subject, x.m]));
  const q = Object.fromEntries(qs.map((x) => [x.subject, x]));
  const totalMin = hours.reduce((a, x) => a + x.m, 0);
  const tT = qs.reduce((a, x) => a + x.t, 0);
  const tC = qs.reduce((a, x) => a + x.c, 0);
  const pct = (c: number, t: number) => (t ? Math.round((c / t) * 100) : null);

  return (
    <main className="space-y-10">
      <section className="grid gap-6 sm:grid-cols-3">
        <Stat label="Horas nesta semana" value={`${(totalMin / 60).toFixed(1)} / ${WEEK_GOAL_H}h`} />
        <Stat label="Questões resolvidas" value={String(tT)} />
        <Stat label={`Acertos (meta ${TARGET_PCT}%)`} value={pct(tC, tT) === null ? "—" : `${pct(tC, tT)}%`} />
      </section>

      <section>
        <h2 className="mb-3 text-lg font-bold">Desempenho por matéria</h2>
        <div className="overflow-x-auto">
          <table className="w-full min-w-[560px] text-left text-sm">
            <thead className="border-b border-[var(--line)] text-xs">
              <tr><th className="py-2">Matéria</th><th>Horas na semana</th><th>Questões</th><th>Acertos</th></tr>
            </thead>
            <tbody>
              {Object.entries(SUBJECTS).map(([name, goal]) => {
                const hh = (h[name] ?? 0) / 60;
                const r = q[name];
                const p = r ? pct(r.c, r.t) : null;
                return (
                  <tr key={name} className="border-b border-[var(--line)]">
                    <td className="py-3 font-medium">{name}</td>
                    <td>
                      <div className="h-2 w-32 rounded bg-[var(--line)]">
                        <div className="h-2 rounded bg-[var(--teal)]" style={{ width: `${Math.min(100, (hh / goal) * 100)}%` }} />
                      </div>
                      <span className="text-xs">{hh.toFixed(1)} de {goal}h</span>
                    </td>
                    <td>{r?.t ?? 0}</td>
                    <td className={p !== null && p < TARGET_PCT ? "font-bold text-[var(--amber)]" : ""}>
                      {p === null ? "—" : `${p}% (${r.c}/${r.t})`}
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </section>

      <section>
        <h2 className="mb-3 text-lg font-bold">Revisões de hoje ({due.length})</h2>
        {due.length === 0 && <p className="text-sm">Nada para revisar. Registre erros em “Registrar estudo”.</p>}
        <ul className="space-y-2">
          {due.map((e) => (
            <li key={e.id} className="flex items-center justify-between gap-4 border-l-4 border-[var(--teal)] bg-white px-4 py-3">
              <div><p className="text-xs">{e.subject} · revisão {["24h", "7 dias", "30 dias"][e.reviewed]}</p><p>{e.note}</p></div>
              <form action={markReviewed}>
                <input type="hidden" name="id" value={e.id} />
                <button className="rounded bg-[var(--ink)] px-3 py-1.5 text-sm text-white">Marcar revisada</button>
              </form>
            </li>
          ))}
        </ul>
      </section>
    </main>
  );
}

function Stat({ label, value }: { label: string; value: string }) {
  return (
    <div className="border-t-2 border-[var(--ink)] pt-2">
      <p className="text-3xl font-bold">{value}</p>
      <p className="text-sm">{label}</p>
    </div>
  );
}
