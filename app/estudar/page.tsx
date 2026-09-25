import Link from "next/link";
import { sql } from "@/lib/db";

export const dynamic = "force-dynamic";

type DayRow = {
  id: number; week: number; day_number: number; title: string;
  total: number; done: number;
};

export default async function Estudar() {
  const days = (await sql`
    select d.id, d.week, d.day_number, d.title,
      count(distinct b.id)::int total,
      count(distinct bc.block_id)::int done
    from days d
    join blocks b on b.day_id = d.id
    left join block_completions bc on bc.block_id = b.id
    group by d.id, d.week, d.day_number, d.title
    order by d.week, d.day_number
  `) as DayRow[];

  return (
    <main>
      <h1 className="mb-6 text-2xl font-bold">Trilha de estudo</h1>
      {days.length === 0 && (
        <p className="text-sm">
          Nenhum dia cadastrado ainda. Rode <code>db/seed.sql</code> no Neon para carregar o Dia 1.
        </p>
      )}
      <ul className="space-y-3">
        {days.map((d) => {
          const complete = d.total > 0 && d.done === d.total;
          return (
            <li key={d.id}>
              <Link
                href={`/estudar/${d.id}`}
                className="flex items-center justify-between gap-4 border-l-4 border-[var(--teal)] bg-white px-4 py-3 hover:bg-[var(--paper)]"
              >
                <div>
                  <p className="text-xs">Semana {d.week} · Dia {d.day_number}</p>
                  <p className="font-medium">{d.title}</p>
                </div>
                <span className={`text-sm ${complete ? "font-bold text-[var(--teal)]" : ""}`}>
                  {complete ? "Concluído" : `${d.done}/${d.total} blocos`}
                </span>
              </Link>
            </li>
          );
        })}
      </ul>
    </main>
  );
}
