import type { MetadataRoute } from "next";
export default function manifest(): MetadataRoute.Manifest {
  return { name: "Concurseiro", short_name: "Concurseiro", description: "Estudo e desempenho para concursos", start_url: "/", display: "standalone",
    background_color: "#f3f5f8", theme_color: "#0f766e", icons: [{ src: "/icon.svg", sizes: "any", type: "image/svg+xml" }] };
}
