"use server";
import { revalidatePath } from "next/cache";
import { sql } from "@/lib/db";
import type { AnswerResult } from "@/lib/types";

const s = (f: FormData, k: string) => String(f.get(k) ?? "");
const n = (f: FormData, k: string) => Number(f.get(k) ?? 0);
const refresh = () => { revalidatePath("/"); revalidatePath("/estudar", "layout"); revalidatePath("/tjsp"); revalidatePath("/erros"); };

export async function addSession(f: FormData) {
  await sql`insert into sessions (day, subject, kind, minutes) values (${s(f, "day")}, ${s(f, "subject")}, ${s(f, "kind")}, ${n(f, "minutes")})`;
  refresh();
}
export async function addQuestions(f: FormData) {
  const total = n(f, "total"), correct = Math.min(n(f, "correct"), total);
  await sql`insert into question_logs (day, subject, total, correct) values (${s(f, "day")}, ${s(f, "subject")}, ${total}, ${correct})`;
  refresh();
}
export async function addError(f: FormData) {
  await sql`insert into errors (subject, note) values (${s(f, "subject")}, ${s(f, "note")})`;
  refresh();
}
export async function markReviewed(f: FormData) {
  await sql`update errors set reviewed = reviewed + 1 where id = ${n(f, "id")}`;
  refresh();
}
export async function completeBlock(f: FormData) {
  await sql`insert into block_completions (block_id, minutes) values (${n(f, "blockId")}, ${n(f, "minutes")}) on conflict (block_id, day) do nothing`;
  refresh();
}
export async function submitAnswer(_prev: AnswerResult | null, f: FormData): Promise<AnswerResult | null> {
  const questionId = n(f, "questionId"), chosen = s(f, "chosen");
  const confidence = n(f, "confidence") || 75;
  if (!chosen) return null;
  const rows = await sql`select subject, correct_option, explanation from questions where id = ${questionId}`;
  const q = rows[0] as { subject: string; correct_option: string; explanation: string | null } | undefined;
  if (!q) return null;
  const correct = chosen === q.correct_option;
  await sql`insert into answers (question_id, chosen, confidence, correct) values (${questionId}, ${chosen}, ${confidence}, ${correct})`;
  if (!correct) await sql`insert into errors (subject, note, question_id) values (${q.subject}, ${q.explanation ?? "Revisar questão."}, ${questionId})`;
  refresh();
  return { chosen, correct, correctOption: q.correct_option, explanation: q.explanation };
}
export async function resetBlock(f: FormData) {
  const blockId = n(f, "blockId");
  await sql`delete from errors where question_id in (select id from questions where block_id = ${blockId})`;
  await sql`delete from answers where question_id in (select id from questions where block_id = ${blockId})`;
  refresh();
}