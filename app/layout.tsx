import "./globals.css";
import type { Metadata, Viewport } from "next";
import { Manrope } from "next/font/google";
import Nav from "@/components/Nav";
const font = Manrope({ subsets: ["latin"], variable: "--font-manrope" });
export const metadata: Metadata = { title: { default: "Concurseiro", template: "%s · Concurseiro" }, description: "Estudo e desempenho para concursos de nível médio" };
export const viewport: Viewport = {
  width: "device-width", initialScale: 1, viewportFit: "cover",
  themeColor: [{ media: "(prefers-color-scheme: light)", color: "#f3f5f8" }, { media: "(prefers-color-scheme: dark)", color: "#0d1319" }],
};
export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="pt-BR" className={font.variable}>
      <body className="antialiased">
        <div className="md:flex">
          <Nav />
          <main className="min-w-0 flex-1 px-4 pb-28 pt-5 md:px-10 md:pb-14 md:pt-8"><div className="mx-auto max-w-4xl">{children}</div></main>
        </div>
      </body>
    </html>
  );
}
