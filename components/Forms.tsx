"use client";
import { useActionState, useEffect, useRef } from "react";
import { useFormStatus } from "react-dom";
import { completeBlock, resetBlock } from "@/app/actions";
function Submit({ children, pendingText }: { children: React.ReactNode; pendingText: string }) {
  const { pending } = useFormStatus();
  return <button className="btn" disabled={pending}>{pending ? pendingText : children}</button>;
}
export function CompleteForm({ blockId, minutes }: { blockId: number; minutes: number }) {
  return (
    <form action={completeBlock}>
      <input type="hidden" name="blockId" value={blockId} /><input type="hidden" name="minutes" value={minutes} />
      <Submit pendingText="Salvando…">Marcar como concluído</Submit>
    </form>
  );
}
export function ResetForm({ blockId }: { blockId: number }) {
  return (
    <form action={resetBlock} onSubmit={(e) => { if (!confirm("Refazer este bloco? Suas respostas e os erros gerados por ele serão apagados.")) e.preventDefault(); }}>
      <input type="hidden" name="blockId" value={blockId} />
      <button className="btn btn-soft">Refazer bloco</button>
    </form>
  );
}
export function ActionForm({ action, children, submitLabel }: { action: (f: FormData) => Promise<void>; children: React.ReactNode; submitLabel: string }) {
  const ref = useRef<HTMLFormElement>(null);
  const [state, run, pending] = useActionState(async (_p: number | null, f: FormData) => { await action(f); return Date.now(); }, null);
  useEffect(() => { if (state) ref.current?.reset(); }, [state]);
  return (
    <form ref={ref} action={run} className="space-y-3">
      {children}
      <div className="flex items-center gap-3">
        <button className="btn" disabled={pending}>{pending ? "Salvando…" : submitLabel}</button>
        {state && !pending && <span className="text-sm font-semibold text-ok" role="status">Salvo ✓</span>}
      </div>
    </form>
  );
}
