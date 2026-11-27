const HUES: Record<string, number> = {
  "Português": 25, "Língua Portuguesa": 25, "Matemática/RLM": 255, "Matemática": 255, "Matemática Financeira": 285,
  "Constitucional": 310, "Direito Constitucional": 310, "Administrativo": 160, "Direito Administrativo": 160,
  "Informática": 200, "Conhecimentos Bancários": 85, "Revisão/Simulados": 345, "Legislação": 120, "Previdenciário": 40,
  "Direito Penal": 15, "Processo Penal": 35, "Processo Civil": 215, "Direito Civil": 140, "Legislação Especial": 330,
  "Atualidades": 60, "Raciocínio Lógico": 270, "Estatuto da Pessoa com Deficiência": 180,
};
export const hueOf = (s: string) => HUES[s] ?? 220;
export const KIND_LABEL: Record<string, string> = { teoria: "Teoria", exercicios: "Questões", revisao: "Revisão" };
export const fmtH = (min: number) => `${(min / 60).toFixed(1).replace(".", ",")}h`;