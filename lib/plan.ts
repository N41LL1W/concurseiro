// Meta de horas/semana por matéria (cronograma-mestre, 20h). Edite livremente.
export const SUBJECTS: Record<string, number> = {
  "Português": 3, "Matemática/RLM": 3, "Constitucional": 2, "Administrativo": 2,
  "Informática": 2, "Conhecimentos Bancários": 2, "Matemática Financeira": 2,
  "Legislação": 2, "Previdenciário": 1, "Revisão/Simulados": 1,
};
export const WEEK_GOAL_H = Object.values(SUBJECTS).reduce((a, b) => a + b, 0);
export const TARGET_PCT = 70; // meta de acertos
