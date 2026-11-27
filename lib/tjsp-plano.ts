// Plano do curso TJSP. Módulo n = TITULOS[n - 1]. No banco: track 'tjsp', week = 100 + bloco, day_number = n.
const parte = (nome: string, qtd: number) => Array.from({ length: qtd }, (_, i) => `${nome} — parte ${i + 1}`);

export const TITULOS: string[] = [
  // Bloco I — Língua Portuguesa (1–11)
  "Interpretação, compreensão, inferência e ponto de vista",
  "Estrutura textual, coesão, coerência e relações entre ideias",
  "Significação das palavras, sinônimos, antônimos, denotação e conotação",
  "Classes de palavras — substantivos, adjetivos, artigos, numerais e pronomes",
  "Classes de palavras — verbos, advérbios, preposições e conjunções",
  "Concordância verbal e nominal",
  "Regência verbal e nominal",
  "Crase",
  "Colocação pronominal",
  "Pontuação",
  "Revisão geral + simulado de Português",
  // Bloco II — Conhecimentos Específicos (12–59)
  "Direito Penal — arts. 1º a 12 (aplicação da lei penal)",
  "Direito Penal — arts. 100 a 106 (ação penal)",
  "Direito Penal — arts. 107 a 121 (extinção da punibilidade e crimes contra a vida)",
  "Direito Penal — art. 129 (lesão corporal)",
  "Direito Penal — arts. 150 e 154 (violação de domicílio e segredo profissional)",
  "Direito Penal — arts. 293 a 305 (crimes documentais e falsidades)",
  "Direito Penal — arts. 307, 308 e 311-A",
  "Direito Penal — arts. 312 a 317 (crimes praticados por funcionário público)",
  "Direito Penal — arts. 319 a 333, 336, 337, 339 a 347, 357 e 359",
  "Processo Penal — arts. 24 a 42 (ação penal e disposições iniciais)",
  "Processo Penal — arts. 61 a 74 e 112 (competência)",
  "Processo Penal — arts. 125 a 131 (medidas assecuratórias)",
  "Processo Penal — arts. 156, 185, 202 a 204 e 218 a 225 (provas)",
  "Processo Penal — arts. 240 a 250 e 274 (busca e apreensão)",
  "Processo Penal — arts. 283 a 303 (prisão)",
  "Processo Penal — arts. 351 a 363 e 370 a 372 (citações e intimações)",
  "Processo Penal — arts. 396, 396-A e 406",
  "Processo Penal — Tribunal do Júri, arts. 436 a 446 e 485 a 487",
  "Processo Penal — arts. 513 a 518 (crimes funcionais)",
  "Processo Penal — arts. 563 a 570 (nulidades)",
  "Processo Penal — recursos, habeas corpus e disposições gerais",
  "Lei 9.099/1995 — Juizados Especiais Criminais",
  ...parte("Direito Processual Civil", 10), // 34–43
  ...parte("Direito Constitucional", 4), // 44–47
  ...parte("Direito Administrativo e Estatuto dos Funcionários Públicos de SP", 3), // 48–50
  ...parte("Direito Civil", 4), // 51–54
  ...parte("Legislação Especial e Normas da Corregedoria do TJSP", 5), // 55–59
  // Bloco III — Conhecimentos Gerais (60–72)
  "Estatuto da Pessoa com Deficiência — Lei 13.146/2015",
  "Atualidades — política, economia, sociedade, cultura e acontecimentos nacionais e internacionais",
  "Matemática — operações, divisibilidade, porcentagem, proporção e regra de três",
  "Matemática — médias, juros simples, equações e sistemas",
  "Matemática — gráficos, medidas, geometria e situações-problema",
  "Raciocínio lógico — proposições e estruturas lógicas",
  "Raciocínio lógico — argumentação e diagramas",
  "Raciocínio lógico — sequências numéricas e figurais",
  "Informática — Windows e gerenciamento de arquivos",
  "Informática — Word e formatação de documentos",
  "Informática — Excel, células, fórmulas, funções e gráficos",
  "Informática — Teams, OneDrive, correio eletrônico e Internet",
  "Revisão final geral + simulados no padrão do edital",
];

export const BLOCOS = [
  { n: 1, titulo: "Língua Portuguesa", info: "15 questões", de: 1, ate: 11 },
  { n: 2, titulo: "Conhecimentos Específicos", info: "40 questões", de: 12, ate: 59 },
  { n: 3, titulo: "Conhecimentos Gerais", info: "15 questões: atualidades, matemática, raciocínio lógico e informática", de: 60, ate: 72 },
];