import { SUBJECTS } from "@/lib/plan";
import { addSession, addQuestions, addError } from "../actions";
import { ActionForm } from "@/components/Forms";
export const metadata = { title: "Registrar" };

const Subject = () => (<select name="subject" className="field" required aria-label="Matéria">{Object.keys(SUBJECTS).map((s) => <option key={s}>{s}</option>)}</select>);
export default function Registrar() {
  const day = new Date().toLocaleDateString("sv-SE", { timeZone: "America/Sao_Paulo" });
  return (
    <div className="space-y-6">
      <header><h1 className="text-2xl font-extrabold tracking-tight sm:text-3xl">Registrar estudo</h1><p className="text-sm text-muted">Para o que você estudou fora do app: vídeos, leitura avulsa, lei seca, simulados externos.</p></header>
      <div className="grid gap-4 md:grid-cols-3">
        <section className="card p-4 sm:p-5"><h2 className="mb-3 text-sm font-extrabold">Sessão de estudo</h2>
          <ActionForm action={addSession} submitLabel="Salvar sessão">
            <input type="date" name="day" defaultValue={day} className="field" aria-label="Data" /><Subject />
            <select name="kind" className="field" aria-label="Tipo"><option value="teoria">Teoria</option><option value="questoes">Questões</option><option value="revisao">Revisão</option></select>
            <input type="number" inputMode="numeric" name="minutes" min={1} placeholder="Minutos" className="field" required />
          </ActionForm></section>
        <section className="card p-4 sm:p-5"><h2 className="mb-3 text-sm font-extrabold">Questões resolvidas</h2>
          <ActionForm action={addQuestions} submitLabel="Salvar questões">
            <input type="date" name="day" defaultValue={day} className="field" aria-label="Data" /><Subject />
            <input type="number" inputMode="numeric" name="total" min={1} placeholder="Total de questões" className="field" required />
            <input type="number" inputMode="numeric" name="correct" min={0} placeholder="Acertos" className="field" required />
          </ActionForm></section>
        <section className="card p-4 sm:p-5"><h2 className="mb-3 text-sm font-extrabold">Caderno de erros</h2>
          <ActionForm action={addError} submitLabel="Salvar erro">
            <Subject /><textarea name="note" rows={5} placeholder="Escreva a regra em uma ou duas linhas" className="field" required />
          </ActionForm></section>
      </div>
    </div>
  );
}
