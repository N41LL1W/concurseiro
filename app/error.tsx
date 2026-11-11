"use client";
export default function Erro({ reset }: { error: Error; reset: () => void }) {
  return (
    <div className="card mx-auto mt-10 max-w-md space-y-3 p-6 text-center">
      <p className="text-lg font-extrabold">Não foi possível carregar</p>
      <p className="text-sm text-muted">Verifique se a variável <code>DATABASE_URL</code> está configurada e se o <code>db/schema.sql</code> foi executado no banco.</p>
      <button className="btn" onClick={reset}>Tentar de novo</button>
    </div>
  );
}
