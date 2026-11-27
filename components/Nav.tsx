"use client";
import Link from "next/link";
import { usePathname } from "next/navigation";
const items = [
  { href: "/", label: "Painel", d: "M3 11.5L12 4l9 7.5M5.5 10v9.5h5v-5h3v5h5V10" },
  { href: "/estudar", label: "Estudar", d: "M4 5.5A2.5 2.5 0 016.5 3H20v15H6.5A2.5 2.5 0 004 20.5v-15zM4 20.5A2.5 2.5 0 006.5 18H20" },
  { href: "/tjsp", label: "TJSP", d: "M12 3v18M6 21h12M5 7h14M5 7l-3 7a3 3 0 006 0L5 7zm14 0l-3 7a3 3 0 006 0l-3-7z" },
  { href: "/erros", label: "Erros", d: "M12 8.5v4.5m0 3.5h.01M10.3 4l-7.9 13.6A2 2 0 004.1 20.5h15.8a2 2 0 001.7-2.9L13.7 4a2 2 0 00-3.4 0z" },
  { href: "/registrar", label: "Registrar", d: "M12 5v14M5 12h14" },
];
const Icon = ({ d }: { d: string }) => (
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" className="h-5 w-5" aria-hidden><path d={d} /></svg>
);
export default function Nav() {
  const path = usePathname();
  const active = (h: string) => (h === "/" ? path === "/" : path.startsWith(h));
  return (
    <>
      <aside className="sticky top-0 hidden h-screen w-60 shrink-0 flex-col gap-1 border-r border-line bg-surface p-5 md:flex">
        <Link href="/" className="mb-6 flex items-center gap-2.5 px-2 text-lg font-extrabold tracking-tight">
          <span className="grid h-8 w-8 place-items-center rounded-lg bg-brand text-brand-ink"><Icon d="M5 12.5l4.5 4.5L19 7.5" /></span>Concurseiro
        </Link>
        {items.map((i) => (
          <Link key={i.href} href={i.href} aria-current={active(i.href) ? "page" : undefined}
            className={`flex items-center gap-3 rounded-xl px-3 py-2.5 text-sm font-semibold transition ${active(i.href) ? "bg-brand-soft text-brand" : "text-muted hover:bg-surface2 hover:text-ink"}`}><Icon d={i.d} />{i.label}</Link>
        ))}
      </aside>
      <nav aria-label="Principal" className="fixed inset-x-0 bottom-0 z-40 grid grid-cols-5 border-t border-line bg-surface/95 pb-[env(safe-area-inset-bottom)] backdrop-blur md:hidden">
        {items.map((i) => (
          <Link key={i.href} href={i.href} aria-current={active(i.href) ? "page" : undefined}
            className={`flex min-h-14 flex-col items-center justify-center gap-0.5 text-[11px] font-semibold ${active(i.href) ? "text-brand" : "text-muted"}`}><Icon d={i.d} />{i.label}</Link>
        ))}
      </nav>
    </>
  );
}