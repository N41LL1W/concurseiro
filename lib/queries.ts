import { sql } from "./db";
export type DayRow = { id: number; week: number; day_number: number; title: string; total: number; done: number; minutes: number; subjects: string[] | null };
// Teoria/revisão = tem conclusão; exercícios = todas as questões respondidas.
export async function getDays(): Promise<DayRow[]> {
  return (await sql`
    select t.id, t.week, t.day_number, t.title,
      count(*)::int total, (count(*) filter (where t.done))::int done, sum(t.minutes)::int minutes,
      array_agg(distinct t.subject) filter (where t.subject <> 'Revisão/Simulados') subjects
    from (
      select d.id, d.week, d.day_number, d.title, b.minutes, b.subject,
        case when b.kind = 'exercicios' then
          (select count(*) from questions q where q.block_id = b.id) > 0 and
          (select count(*) from questions q where q.block_id = b.id) =
          (select count(distinct a.question_id) from answers a join questions q on q.id = a.question_id where q.block_id = b.id)
        else exists (select 1 from block_completions c where c.block_id = b.id) end as done
      from days d join blocks b on b.day_id = d.id
    ) t
    group by t.id, t.week, t.day_number, t.title
    order by t.week, t.day_number`) as DayRow[];
}
