const isHeading = (l: string) => l.length <= 90 && l.length >= 3 && !/[a-zà-ÿ]/.test(l) && /[A-ZÀ-Ý]{3}/.test(l);
const CALLOUT = /^(Pegadinha|Pegadinhas|Macete|Atenção|Regra de ouro|REGRA DE OURO|Dica|Importante|Cuidado)\b[^:]{0,40}:/;
export default function Prose({ text }: { text: string }) {
  const lines = text.split("\n").map((l) => l.trim()).filter(Boolean);
  return (
    <div className="space-y-2.5 text-[15px] leading-relaxed">
      {lines.map((l, i) => {
        if (isHeading(l)) return <h3 key={i} className="pt-3 text-[13px] font-extrabold uppercase tracking-wide text-brand">{l}</h3>;
        if (CALLOUT.test(l)) {
          const idx = l.indexOf(":");
          return <p key={i} className="rounded-xl border-l-4 border-warn bg-warn-soft px-3.5 py-2.5 text-[14px]"><strong className="text-warn">{l.slice(0, idx)}:</strong>{l.slice(idx + 1)}</p>;
        }
        if (/^[-•]\s/.test(l)) return <p key={i} className="pl-4 -indent-3">• {l.replace(/^[-•]\s/, "")}</p>;
        const m = l.match(/^([A-ZÀ-Ý][^:.]{1,38}):\s(.+)$/s);
        return m ? <p key={i}><strong>{m[1]}:</strong> {m[2]}</p> : <p key={i}>{l}</p>;
      })}
    </div>
  );
}
