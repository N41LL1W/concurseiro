import Link from "next/link";
import { sql } from "@/lib/db";
import { getDays, type DayRow } from "@/lib/queries";
import { SUBJECTS, WEEK_GOAL_H, TARGET_PCT } from "@/lib/plan";
import { fmtH } from "@/lib/ui";
import { markReviewed } from "./actions";
import SubjectChip from "@/components/SubjectChip";
import Ring from "@/components/Ring";

export const dynamic = "force-dynamic";
type Row = { subject: string; m?: number; t?: number; c?: number };
type Due = { id: number; subject: string; note: string; reviewed: number };
const pct = (c: number, t: number) => (t ? Math.round((c / t) * 100) : null);
const tone = (p: number | null) => (p === null ? "text-muted" : p >= TARGET_PCT ? "text-ok" : p >= 50 ? "text-warn" : "text-bad");

export default async function Painel() {
  const [hours, qs, due, days, daily, active, today] = (await Promise.all([
    sql`select subject, sum(m)::int m from (
          select subject, minutes m from sessions where day >= date_trunc('week', current_date)
          union all select b.subject, bc.minutes from block_completions bc join blocks b on b.id = bc.block_id where bc.day >= date_trunc('week', current_date)
        ) x group by subject`,
    sql`select subject, sum(t)::int t, sum(c)::int c from (
          select subject, total t, correct c from question_logs
          union all select q.subject, count(*)::int, (count(*) filter (where a.correct))::int from answers a join questions q on q.id = a.question_id group by q.subject
        ) x group by subject`,
    sql`select id, subject, note, reviewed from errors where reviewed < 3 and current_date >= created + (case reviewed when 0 then 1 when 1 then 7 else 30 end) order by created limit 8`,
    getDays(),
    sql`select to_char(g, 'YYYY-MM-DD') as day, coalesce(sum(m), 0)::int as m
        from generate_series(current_date - 6, current_date, interval '1 day') g
        left join (select day, minutes m from sessions union all select day, minutes from block_completions) x on x.day = g::date
        group by g order by g`,
    sql`select distinct to_char(day, 'YYYY-MM-DD') as day from (select day from sessions union all select day from block_completions union all select day from answers) x where day >= current_date - 90`,
    sql`select to_char(current_date, 'YYYY-MM-DD') as t`,
  ])) as unknown as [Row[], Row[], Due[], DayRow[], { day: string; m: number }[], { day: string }[], { t: string }[]];

  const h = Object.fromEntries(hours.map((x) => [x.subject, x.m ?? 0]));
  const q = Object.fromEntries(qs.map((x) => [x.subject, x]));
  const totalMin = hours.reduce((a, x) => a + (x.m ?? 0), 0);
  const tT = qs.reduce((a, x) => a + (x.t ?? 0), 0), tC = qs.reduce((a, x) => a + (x.c ?? 0), 0);
  const acc = pct(tC, tT);

  const set = new Set(active.map((a) => a.day));
  const step = (s: string) => new Date(Date.parse(s + "T00:00:00Z") - 864e5).toISOString().slice(0, 10);
  let cur = today[0].t, streak = 0;
  if (!set.has(cur)) cur = step(cur);
  while (set.has(cur)) { streak++; cur = step(cur); }

  const next = days.find((d) => d.done < d.total);
  const maxM = Math.max(30, ...daily.map((d) => d.m));
  const dateStr = new Date().toLocaleDateString("pt-BR", { weekday: "long", day: "numeric", month: "long", timeZone: "America/Sao_Paulo" });
  const wd = (s: string) => "DSTQQSS"[new Date(s + "T12:00:00Z").getUTCDay()];

  return (
    <div className="space-y-6">
      <header>
        <p className="text-sm font-semibold capitalize text-muted">{dateStr}</p>
        <h1 className="text-2xl font-extrabold tracking-tight sm:text-3xl">Seu painel de estudos</h1>
      </header>

      {next ? (
        <section className="rounded-2xl bg-brand p-5 text-brand-ink sm:p-6">
          <p className="text-xs font-bold uppercase tracking-wide opacity-80">Continue de onde parou</p>
          <h2 className="mt-1 text-xl font-extrabold leading-snug sm:text-2xl">Semana {next.week} · Dia {next.day_number}</h2>
          <p className="mt-1 max-w-2xl text-sm opacity-90">{next.title}</p>
          <div className="mt-4 flex flex-wrap items-center gap-4">
            <div className="h-2 w-full max-w-xs overflow-hidden rounded-full bg-black/20"><div className="h-full rounded-full bg-white" style={{ width: `${(next.done / next.total) * 100}%` }} /></div>
            <span className="text-sm font-bold">{next.done}/{next.total} blocos</span>
          </div>
          <Link href={`/estudar/${next.id}`} className="mt-4 inline-flex min-h-11 items-center rounded-xl bg-white px-5 text-sm font-extrabold text-[#0b4f49] transition hover:brightness-95">{next.done ? "Continuar" : "Começar"} →</Link>
        </section>
      ) : (
        <section className="card p-5 text-sm text-muted">{days.length ? "Você concluiu todos os dias cadastrados. 🎉" : "Nenhum dia cadastrado ainda. Rode os arquivos db/diaN_v2.sql no Neon para carregar o conteúdo."}</section>
      )}

      <section aria-label="Resumo" className="grid grid-cols-2 gap-3 md:grid-cols-4">
        <Kpi label="Sequência" value={`${streak} ${streak === 1 ? "dia" : "dias"}`} hint={streak ? "estudando seguido" : "estude hoje!"} />
        <Kpi label="Horas na semana" value={fmtH(totalMin)} hint={`meta ${WEEK_GOAL_H}h`} />
        <Kpi label="Questões" value={String(tT)} hint="respondidas" />
        <Kpi label="Acertos" value={acc === null ? "—" : `${acc}%`} hint={`meta ${TARGET_PCT}%`} valueClass={tone(acc)} />
      </section>

      <section className="card p-4 sm:p-5">
        <h2 className="mb-4 text-sm font-extrabold">Últimos 7 dias <span className="font-medium text-muted">· minutos estudados</span></h2>
        <div className="flex h-32 items-end gap-2 sm:gap-3">
          {daily.map((d) => (
            <div key={d.day} className="flex h-full flex-1 flex-col items-center gap-1.5" title={`${d.m} min`}>
              <span className="text-[10px] font-bold text-muted">{d.m || ""}</span>
              <div className="flex w-full flex-1 items-end"><div className={`w-full rounded-t-lg ${d.day === today[0].t ? "bg-brand" : "bg-brand/40"}`} style={{ height: `${Math.max(d.m ? 6 : 2, (d.m / maxM) * 100)}%` }} /></div>
              <span className="text-[11px] font-bold text-muted">{wd(d.day)}</span>
            </div>
          ))}
        </div>
      </section>

      <section>
        <h2 className="mb-3 text-sm font-extrabold">Desempenho por matéria</h2>
        <div className="grid gap-3 sm:grid-cols-2">
          {Object.entries(SUBJECTS).map(([name, goal]) => {
            const r = q[name], p = r ? pct(r.c ?? 0, r.t ?? 0) : null, hh = (h[name] ?? 0) / 60;
            return (
              <div key={name} className="card flex items-center gap-4 p-4">
                <Ring pct={p ?? 0} label={p === null ? "—" : `${p}%`} />
                <div className="min-w-0 flex-1">
                  <div className="flex flex-wrap items-center gap-2"><SubjectChip name={name} />{p !== null && p < TARGET_PCT && (r?.t ?? 0) >= 5 && <span className="text-[11px] font-bold text-bad">reforçar</span>}</div>
                  <p className="mt-1.5 text-xs text-muted">{r?.t ?? 0} questões · {r ? `${r.c}/${r.t} acertos` : "sem dados"}</p>
                  <div className="mt-2 flex items-center gap-2"><div className="h-1.5 flex-1 overflow-hidden rounded-full bg-line"><div className="h-full rounded-full bg-brand" style={{ width: `${Math.min(100, (hh / goal) * 100)}%` }} /></div><span className="text-[11px] font-semibold text-muted">{hh.toFixed(1).replace(".", ",")}/{goal}h</span></div>
                </div>
              </div>
            );
          })}
        </div>
      </section>

      <section>
        <div className="mb-3 flex items-center justify-between"><h2 className="text-sm font-extrabold">Revisões de hoje <span className="text-muted">({due.length})</span></h2><Link href="/erros" className="text-xs font-bold text-brand">Ver caderno →</Link></div>
        {due.length === 0 ? <p className="card p-4 text-sm text-muted">Nada para revisar agora. Erros em questões entram aqui automaticamente.</p> : (
          <ul className="space-y-2">
            {due.map((e) => (
              <li key={e.id} className="card flex items-start justify-between gap-3 p-4">
                <div className="min-w-0"><div className="flex flex-wrap items-center gap-2"><SubjectChip name={e.subject} /><span className="text-[11px] font-bold text-muted">revisão {["24h", "7 dias", "30 dias"][e.reviewed]}</span></div><p className="mt-2 text-sm leading-relaxed">{e.note}</p></div>
                <form action={markReviewed}><input type="hidden" name="id" value={e.id} /><button className="btn btn-soft shrink-0 !px-3 text-xs">Revisada ✓</button></form>
              </li>
            ))}
          </ul>
        )}
      </section>
    </div>
  );
}
function Kpi({ label, value, hint, valueClass = "" }: { label: string; value: string; hint: string; valueClass?: string }) {
  return (<div className="card p-4"><p className="text-xs font-bold text-muted">{label}</p><p className={`mt-1 text-2xl font-extrabold tracking-tight ${valueClass}`}>{value}</p><p className="text-[11px] text-muted">{hint}</p></div>);
}
