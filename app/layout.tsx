import "./globals.css";
import Link from "next/link";
import { Manrope } from "next/font/google";
const font = Manrope({ subsets: ["latin"], variable: "--font-sans" });

export const metadata = { title: "Concurseiro" };

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="pt-BR" className={font.variable}>
      <body className="mx-auto max-w-5xl px-4 pb-16">
        <nav className="flex items-baseline gap-6 py-6">
          <Link href="/" className="text-xl font-bold">Concurseiro</Link>
          <Link href="/" className="text-sm underline-offset-4 hover:underline">Painel</Link>
          <Link href="/estudar" className="text-sm underline-offset-4 hover:underline">Estudar</Link>
          <Link href="/registrar" className="text-sm underline-offset-4 hover:underline">Registrar estudo</Link>
        </nav>
        {children}
      </body>
    </html>
  );
}
