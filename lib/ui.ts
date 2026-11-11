const HUES: Record<string, number> = {
  "Português": 25, "Matemática/RLM": 255, "Matemática Financeira": 285, "Constitucional": 310,
  "Administrativo": 160, "Informática": 200, "Conhecimentos Bancários": 85, "Revisão/Simulados": 345,
  "Legislação": 120, "Previdenciário": 40,
};
export const hueOf = (s: string) => HUES[s] ?? 220;
export const KIND_LABEL: Record<string, string> = { teoria: "Teoria", exercicios: "Questões", revisao: "Revisão" };
export const fmtH = (min: number) => `${(min / 60).toFixed(1).replace(".", ",")}h`;
