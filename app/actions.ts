"use server";
import { revalidatePath } from "next/cache";
import { sql } from "@/lib/db";

const s = (f: FormData, k: string) => String(f.get(k) ?? "");
const n = (f: FormData, k: string) => Number(f.get(k) ?? 0);

// --- registro manual (fora do conteúdo do app) ---
export async function addSession(f: FormData) {
  await sql`insert into sessions (day, subject, kind, minutes)
    values (${s(f, "day")}, ${s(f, "subject")}, ${s(f, "kind")}, ${n(f, "minutes")})`;
  revalidatePath("/");
}
export async function addQuestions(f: FormData) {
  await sql`insert into question_logs (day, subject, total, correct)
    values (${s(f, "day")}, ${s(f, "subject")}, ${n(f, "total")}, ${n(f, "correct")})`;
  revalidatePath("/");
}
export async function addError(f: FormData) {
  await sql`insert into errors (subject, note) values (${s(f, "subject")}, ${s(f, "note")})`;
  revalidatePath("/");
}
export async function markReviewed(f: FormData) {
  await sql`update errors set reviewed = reviewed + 1 where id = ${n(f, "id")}`;
  revalidatePath("/");
}

// --- estudo pelo conteúdo do app ---
export async function completeBlock(f: FormData) {
  const blockId = n(f, "blockId");
  const minutes = n(f, "minutes");
  await sql`insert into block_completions (block_id, minutes) values (${blockId}, ${minutes})
    on conflict (block_id, day) do nothing`;
  revalidatePath("/estudar");
  revalidatePath("/");
}

export async function submitAnswer(f: FormData) {
  const questionId = n(f, "questionId");
  const chosen = s(f, "chosen");
  const confidence = n(f, "confidence") || 80;
  if (!chosen) return;

  const rows = await sql`select subject, correct_option, explanation from questions where id = ${questionId}`;
  const q = rows[0] as { subject: string; correct_option: string; explanation: string | null } | undefined;
  if (!q) return;

  const correct = chosen === q.correct_option;
  await sql`insert into answers (question_id, chosen, confidence, correct)
    values (${questionId}, ${chosen}, ${confidence}, ${correct})`;

  if (!correct) {
    await sql`insert into errors (subject, note, question_id)
      values (${q.subject}, ${q.explanation ?? "Revisar questão."}, ${questionId})`;
  }
  revalidatePath("/estudar");
  revalidatePath("/");
}
