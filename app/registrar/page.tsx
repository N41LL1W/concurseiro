import { SUBJECTS } from "@/lib/plan";
import { addSession, addQuestions, addError } from "../actions";

const field = "w-full rounded border border-[var(--line)] bg-white px-3 py-2 text-sm";
const btn = "rounded bg-[var(--teal)] px-4 py-2 text-sm font-medium text-white";

const Subject = () => (
  <select name="subject" className={field} required>
    {Object.keys(SUBJECTS).map((s) => <option key={s}>{s}</option>)}
  </select>
);

export default function Registrar() {
  const day = new Date().toISOString().slice(0, 10);
  return (
    <main className="grid gap-10 md:grid-cols-3">
      <form action={addSession} className="space-y-3">
        <h2 className="font-bold">Sessão de estudo</h2>
        <input type="date" name="day" defaultValue={day} className={field} />
        <Subject />
        <select name="kind" className={field}>
          <option value="teoria">Teoria</option><option value="questoes">Questões</option><option value="revisao">Revisão</option>
        </select>
        <input type="number" name="minutes" min={1} placeholder="Minutos" className={field} required />
        <button className={btn}>Salvar sessão</button>
      </form>

      <form action={addQuestions} className="space-y-3">
        <h2 className="font-bold">Questões resolvidas</h2>
        <input type="date" name="day" defaultValue={day} className={field} />
        <Subject />
        <input type="number" name="total" min={1} placeholder="Total de questões" className={field} required />
        <input type="number" name="correct" min={0} placeholder="Acertos" className={field} required />
        <button className={btn}>Salvar questões</button>
      </form>

      <form action={addError} className="space-y-3">
        <h2 className="font-bold">Caderno de erros</h2>
        <Subject />
        <textarea name="note" rows={4} placeholder="Regra em uma ou duas linhas" className={field} required />
        <button className={btn}>Salvar erro</button>
      </form>
    </main>
  );
}
