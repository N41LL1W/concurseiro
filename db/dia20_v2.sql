-- Cadastra o Dia 20 (versão completa e robusta).
delete from days where week = 5 and day_number = 1;

with d as (
  insert into days (week, day_number, title)
  values (5, 1, 'Colocação pronominal + porcentagem e variações sucessivas + Administração Pública (art. 37) + produtos e serviços bancários')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Colocação pronominal: próclise, ênclise e mesóclise na norma tradicional', 30, $$Pronomes oblíquos átonos: me, te, se, o, a, lhe, nos, vos, os, as, lhes. Três posições: próclise (antes do verbo), ênclise (depois), mesóclise (no meio).

PRÓCLISE
Ex.: "Não me disseram a verdade" — "não" atrai o pronome para antes do verbo. Elementos atrativos: palavra negativa ("Não me avisaram."), pronome relativo ("O candidato que se preparou passou."), pronome indefinido ("Alguém me chamou."), pronome demonstrativo ("Isso me preocupa."), conjunção subordinativa ("Quando me chamaram, entrei."), advérbio sem pausa que atraia o pronome ("Aqui se trabalha muito.").
Negativas (não, nunca, jamais, ninguém) são fortes atratoras: "Nunca me disseram isso" (certo) × "Nunca disseram-me isso" (incorreto na norma tradicional).

ÊNCLISE
Ocorre quando não há palavra atrativa e o verbo inicia a oração: "Entregaram-me o comprovante."; "O funcionário informou-lhe o prazo."; "Apresente-se na recepção." Na norma-padrão tradicional, evita-se iniciar oração formal com pronome oblíquo átono: prefira "Disseram-me a verdade" a "Me disseram a verdade" (mesmo sendo comum na fala cotidiana).

MESÓCLISE
Ocorre, na regra tradicional, com futuro do presente e futuro do pretérito, QUANDO NÃO HÁ palavra atrativa: "Entregar-lhe-ei o documento."; "Convidar-te-ia para a reunião." Com palavra atrativa, usa-se próclise mesmo no futuro: "Não lhe entregarei o documento." (não "não entregar-lhe-ei"); "Nunca te convidaria para isso."
Pegadinha: a presença de "não" impede a mesóclise na construção normativa tradicional.

RESUMO
Próclise: "Não me avisaram." (atraído por "não"). Ênclise: "Avisaram-me." (sem atrator, início de oração). Mesóclise: "Avisar-me-ão." (futuro do presente, sem atrator).$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — colocação pronominal (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Porcentagem: cálculo, aumento/desconto, e a fatoração de variações sucessivas', 35, $$CALCULANDO PORCENTAGEM
Parte = Total × (percentual/100). Ex.: 18% de R$500 = 500×18/100=90. Tabela de referência sobre R$200: 10%=20, 15%=30, 20%=40, 25%=50, 50%=100.

AUMENTO PERCENTUAL
Produto de R$300 com aumento de 20%: 300×0,20=60; 300+60=360. Atalho: 300×1,20=360.

DESCONTO PERCENTUAL
Produto de R$400 com desconto de 15%: 400×0,15=60; 400−60=340. Atalho: 400×0,85=340.
Regra prática: aumento de p% → ×(1+p/100). Desconto de p% → ×(1−p/100).

AUMENTOS E DESCONTOS SUCESSIVOS (pegadinha)
R$100 com aumento de 10% e depois desconto de 10%: 100×1,10=110; 110×0,90=99 (não volta a R$100 — o desconto incide sobre R$110, não sobre os R$100 originais).
R$200 com dois aumentos sucessivos de 10%: 200×1,10×1,10=242 — aumento total de R$42, ou seja, 21%, não 20%.

COMO DESCOBRIR A VARIAÇÃO TOTAL
Multiplique os fatores de cada mudança. Aumento de 10% → fator 1,10. Desconto de 10% → fator 0,90. Aumento de 25% → fator 1,25. Desconto de 25% → fator 0,75.
Ex.: desconto de 20% seguido de aumento de 20%: 0,80×1,20=0,96 — resultado é 96% do valor original, ou seja, redução total de 4% (não fica igual ao original, mesmo os percentuais sendo "opostos").$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — porcentagem e variações sucessivas (Q1 a Q4)', 15
  from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Art. 37: LIMPE, Administração direta/indireta e concurso público', 30, $$OS CINCO PRINCÍPIOS — LIMPE
Legalidade: o agente deve atuar conforme a lei e dentro das competências que ela estabelece (ex.: servidor não pode criar exigência sem fundamento jurídico).
Impessoalidade: atuação deve buscar o interesse público, sem favorecimento/perseguição pessoal (ex.: não favorecer parente em procedimento público).
Moralidade: conduta ética, honesta, compatível com os deveres da Administração (ex.: ato não deve ser usado para benefício pessoal indevido).
Publicidade: atos administrativos divulgados em regra, respeitadas as hipóteses legais de sigilo (ex.: divulgação oficial de despesas públicas, observadas as restrições legais).
Eficiência: busca resultados adequados, qualidade, produtividade e bom uso dos recursos públicos (ex.: reduzir tempo de atendimento sem perder qualidade).

PEGADINHAS SOBRE OS PRINCÍPIOS
Legalidade pública ≠ legalidade privada: a Administração precisa de fundamento jurídico e respeitar competências; o particular pode fazer o que a lei não proíbe (art. 5º, II). Publicidade não é divulgação irrestrita — há sigilo legal admitido. Impessoalidade não exige tratar situações diferentes sempre de forma idêntica — diferenciações com fundamento jurídico e justificativa objetiva podem ser legítimas.

ADMINISTRAÇÃO DIRETA × INDIRETA
Direta: União, estados, DF e municípios, por seus órgãos (ex.: ministérios, secretarias). Indireta: autarquias, fundações públicas, empresas públicas e sociedades de economia mista.
Classificação a memorizar: INSS = autarquia federal. CAIXA = empresa pública federal. Banco do Brasil = sociedade de economia mista. Ministério = órgão da Administração direta (NÃO é autarquia). Empresas públicas e sociedades de economia mista têm personalidade de direito privado, mas integram a Administração indireta e se submetem a regras próprias, inclusive constitucionais.

CONCURSO PÚBLICO (art. 37, II)
Regra: investidura em cargo/emprego público depende de aprovação prévia em concurso de provas ou provas e títulos, conforme a natureza/complexidade do cargo, ressalvadas as nomeações para cargo em comissão de livre nomeação e exoneração.
Pontos de prova: concurso é a regra; cargo em comissão é exceção constitucional; função de confiança é exercida exclusivamente por servidor de cargo efetivo; cargos em comissão destinam-se a direção, chefia e assessoramento; validade do concurso é até 2 anos, prorrogável uma vez por igual período (a prorrogação não é obrigatória).$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — art. 37, LIMPE e Administração direta/indireta (Q1 a Q4)', 15
  from d returning id
),
b_banc_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Conhecimentos Bancários', 'teoria', 'Conta corrente/poupança, CDB, LCI/LCA, crédito/empréstimos, Pix e CET', 25, $$CONTA CORRENTE
Movimentação de dinheiro e operações financeiras, conforme serviços contratados: depósitos, transferências, pagamentos, Pix, boletos, cartão de débito. Atenção: ter conta corrente não significa ter crédito aprovado — cheque especial depende de contratação e análise.

CONTA POUPANÇA
Depósito com regras próprias de remuneração, geralmente creditada na data de aniversário do depósito. Não é a mesma coisa que uma conta de investimento em ações ou CDB. Cuidado: a poupança não rende sempre um percentual fixo independente da taxa básica de juros — depende das condições legais vigentes.

CDB — Certificado de Depósito Bancário
Título emitido por instituição financeira para captar recursos — o cliente empresta dinheiro à instituição e recebe remuneração conforme as condições. Pode ser prefixado (taxa definida na contratação), pós-fixado (acompanha indicador, como % do CDI) ou híbrido (combina componente prefixado com índice). Ex.: CDB de 100% do CDI acompanha o indicador — não significa 100% ao ano fixo. CDB ≠ depósito em conta corrente — tem condições e riscos próprios; CDBs elegíveis podem ter cobertura do FGC, respeitados limites e critérios.

LCI E LCA
LCI: Letra de Crédito Imobiliário (financiamento imobiliário). LCA: Letra de Crédito do Agronegócio (financiamento do agronegócio). Títulos de captação emitidos por instituições financeiras; tributação pode ter tratamento favorecido para pessoa física, conforme legislação vigente. LCI/LCA elegíveis também podem ter cobertura do FGC, respeitados limites.

CRÉDITO E EMPRÉSTIMOS
Empréstimo pessoal: crédito sem destinação específica obrigatória. Financiamento: crédito normalmente vinculado à aquisição de um bem/finalidade definida. Cheque especial: limite associado à conta, conforme contrato. Cartão de crédito: instrumento de pagamento com pagamento posterior, conforme contrato. Crédito consignado: parcelas descontadas direto do benefício/remuneração, quando permitido/contratado.
O crédito não é gratuito — juros, tarifas e tributos conforme o produto. Antes de comparar ofertas, observe o Custo Efetivo Total (CET), que reúne os custos relevantes da operação.

PIX
Meio de pagamento instantâneo, transferências e pagamentos em poucos segundos, normalmente disponível todos os dias (inclusive fins de semana e feriados). Funciona entre instituições participantes; usa chaves Pix ou outros mecanismos de iniciação; limites de valor e mecanismos de segurança dependem das regras/configurações da instituição.
Pegadinha: Pix é meio de pagamento; CDB é investimento; empréstimo é operação de crédito — categorias diferentes, não confunda.$$
  from d returning id
),
b_banc_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Conhecimentos Bancários', 'exercicios', 'Fixação — produtos e serviços bancários (Q1 a Q4)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 20 (Q17 a Q28)', 40,
    $$Sem consulta. 12 questões misturando colocação pronominal, porcentagem/sucessivos, art. 37/Administração direta e indireta, e produtos bancários (CDB, LCI, LCA, Pix, CET).$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Caderno de erros, plano de revisão e checklist do Dia 20', 20, $$CADERNO DE ERROS
Marque o que precisa reforçar: colocação pronominal (próclise/ênclise/mesóclise); cálculo de porcentagem simples; percentuais sucessivos sobre a nova base; princípios do LIMPE; Administração direta × indireta; CDB/LCI/LCA/Pix; importância do CET na comparação de crédito. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app.

PLANO DE REVISÃO
Amanhã (24h): reveja as regras principais e refaça as questões erradas.
Daqui a 7 dias: resolva de 8 a 12 questões sobre os assuntos do Dia 20.
Daqui a 30 dias: revisão cumulativa junto com os conteúdos dos Dias 1 a 20.
(O app já agenda isso sozinho via o caderno de erros — 24h, 7 dias e 30 dias, visíveis no Painel.)

CHECKLIST DO DIA 20
Estudei a teoria de colocação pronominal. Resolvi os exercícios de porcentagem e variações sucessivas. Revisei os princípios do art. 37. Estudei os produtos e serviços bancários. Fiz o mini-simulado e identifiquei meus erros. Anotei o que preciso revisar amanhã. Marque este bloco como concluído para fechar o Dia 20 — início da Semana 5.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a alternativa adequada à norma-padrão tradicional.',
   '{"A":"Nunca disseram-me a verdade.","B":"Nunca me disseram a verdade.","C":"Nunca disseram a mim-me a verdade.","D":"Nunca me disseram-na."}'::jsonb,
   'B', '"Nunca" é palavra negativa que atrai o pronome para antes do verbo: "Nunca me disseram".'),

  ((select id from b_port_ex), 2, 'Português',
   'Em qual alternativa há ênclise?',
   '{"A":"Não se esqueça do prazo.","B":"Quando me chamaram, saí.","C":"Entregaram-me o formulário.","D":"Alguém lhe telefonou."}'::jsonb,
   'C', '"Entregaram-me" tem o pronome depois do verbo, sem palavra atrativa — ênclise.'),

  ((select id from b_port_ex), 3, 'Português',
   'Complete segundo a regra tradicional: "Não ___ informarei o resultado hoje".',
   '{"A":"informar-lhe-ei","B":"lhe","C":"informarei-lhe","D":"informar-lhe"}'::jsonb,
   'B', '"Não" atrai o pronome para antes do verbo: "Não lhe informarei".'),

  ((select id from b_port_ex), 4, 'Português',
   'A mesóclise está corretamente exemplificada em:',
   '{"A":"Me entregarão o resultado.","B":"Não entregar-me-ão o resultado.","C":"Entregarão-me o resultado.","D":"Entregar-me-ão o resultado."}'::jsonb,
   'D', '"Entregar-me-ão" tem o pronome no meio do verbo, futuro do presente, sem palavra atrativa — mesóclise.'),

  -- Matemática — fixação (Q1-4)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Quanto é 15% de R$ 800?',
   '{"A":"R$ 80","B":"R$ 100","C":"R$ 120","D":"R$ 150"}'::jsonb,
   'C', '800 × 0,15 = 120.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Um produto de R$ 250 aumenta 12%. Qual é o novo preço?',
   '{"A":"R$ 262","B":"R$ 270","C":"R$ 280","D":"R$ 300"}'::jsonb,
   'C', '250 × 1,12 = 280.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Um produto de R$ 500 recebe dois descontos sucessivos de 10%. Qual é o preço final?',
   '{"A":"R$ 400","B":"R$ 405","C":"R$ 410","D":"R$ 450"}'::jsonb,
   'B', '500 × 0,90 × 0,90 = 405.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Um valor aumenta 20% e depois diminui 20%. Em relação ao valor inicial, o resultado final é:',
   '{"A":"Igual ao inicial.","B":"4% maior.","C":"4% menor.","D":"8% menor."}'::jsonb,
   'C', '1,20 × 0,80 = 0,96 → resultado é 96% do original, ou seja, 4% menor.'),

  -- Constitucional — fixação (Q1-4)
  ((select id from b_const_ex), 1, 'Constitucional',
   'Qual princípio está mais diretamente relacionado à proibição de favorecimento pessoal na Administração Pública?',
   '{"A":"Eficiência","B":"Impessoalidade","C":"Publicidade","D":"Legalidade"}'::jsonb,
   'B', 'Impessoalidade veda favorecimento ou perseguição pessoal.'),

  ((select id from b_const_ex), 2, 'Constitucional',
   'O INSS é classificado como:',
   '{"A":"Sociedade de economia mista","B":"Empresa pública","C":"Autarquia federal","D":"Órgão da Administração direta"}'::jsonb,
   'C', 'O INSS é autarquia federal, parte da Administração indireta.'),

  ((select id from b_const_ex), 3, 'Constitucional',
   'O prazo de validade de um concurso público é de:',
   '{"A":"Até dois anos, prorrogável uma vez por igual período.","B":"Exatamente quatro anos, sem prorrogação.","C":"Até cinco anos, prorrogável indefinidamente.","D":"Um ano, sem possibilidade de prorrogação."}'::jsonb,
   'A', 'Art. 37, III: até dois anos, prorrogável uma vez por igual período.'),

  ((select id from b_const_ex), 4, 'Constitucional',
   'A busca por produtividade e qualidade na prestação do serviço público está ligada principalmente ao princípio da:',
   '{"A":"Moralidade","B":"Publicidade","C":"Impessoalidade","D":"Eficiência"}'::jsonb,
   'D', 'Eficiência: resultados adequados, qualidade, produtividade e bom uso dos recursos.'),

  -- Conhecimentos Bancários — fixação (Q1-4)
  ((select id from b_banc_ex), 1, 'Conhecimentos Bancários',
   'O CDB é:',
   '{"A":"Um título emitido por instituição financeira para captação de recursos.","B":"Um meio de pagamento instantâneo.","C":"Um imposto sobre operações financeiras.","D":"Uma modalidade de conta destinada exclusivamente a empresas públicas."}'::jsonb,
   'A', 'CDB é título de captação de recursos emitido por instituição financeira.'),

  ((select id from b_banc_ex), 2, 'Conhecimentos Bancários',
   'A sigla LCI significa:',
   '{"A":"Letra de Crédito Internacional.","B":"Letra de Crédito Imobiliário.","C":"Limite de Crédito Individual.","D":"Linha de Consumo Imediato."}'::jsonb,
   'B', 'LCI = Letra de Crédito Imobiliário.'),

  ((select id from b_banc_ex), 3, 'Conhecimentos Bancários',
   'Qual alternativa diferencia corretamente Pix e CDB?',
   '{"A":"Ambos são investimentos de renda fixa.","B":"Pix é um empréstimo e CDB é um imposto.","C":"Pix é um meio de pagamento; CDB é um título de investimento.","D":"Pix é uma conta poupança e CDB é uma transferência."}'::jsonb,
   'C', 'Pix é meio de pagamento instantâneo; CDB é título de investimento — categorias diferentes.'),

  ((select id from b_banc_ex), 4, 'Conhecimentos Bancários',
   'Ao comparar propostas de crédito, o consumidor deve observar especialmente:',
   '{"A":"Apenas o valor da primeira parcela.","B":"Apenas a quantidade de parcelas, sem considerar os juros.","C":"Somente a publicidade da instituição financeira.","D":"O Custo Efetivo Total (CET), além das condições contratuais."}'::jsonb,
   'D', 'O CET reúne os custos relevantes da operação, sendo o indicador correto de comparação.'),

  -- Mini-simulado (Q17-28)
  ((select id from b_simulado), 1, 'Português',
   'Assinale a frase adequada à norma-padrão tradicional.',
   '{"A":"Não disseram-me o resultado.","B":"Jamais me contaram esse fato.","C":"Me entregaram o documento ontem.","D":"Nunca avisaram-me sobre a prova."}'::jsonb,
   'B', '"Jamais" atrai o pronome para antes do verbo: "jamais me contaram". As demais erram a colocação ou iniciam oração com pronome átono indevidamente.'),

  ((select id from b_simulado), 2, 'Português',
   'Qual alternativa apresenta mesóclise?',
   '{"A":"Não lhe direi a resposta.","B":"Quando me procurarem, estarei aqui.","C":"Entregar-lhe-ei os documentos.","D":"Alguém me informou o prazo."}'::jsonb,
   'C', '"Entregar-lhe-ei" tem o pronome no meio do verbo, futuro do presente, sem atrator — mesóclise.'),

  ((select id from b_simulado), 3, 'Matemática/RLM',
   'Quanto corresponde a 18% de R$ 750?',
   '{"A":"R$ 125","B":"R$ 130","C":"R$ 135","D":"R$ 150"}'::jsonb,
   'C', '750 × 0,18 = 135.'),

  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Um produto de R$ 400 recebe desconto de 25%. Qual é o preço final?',
   '{"A":"R$ 100","B":"R$ 250","C":"R$ 275","D":"R$ 300"}'::jsonb,
   'D', '400 × 0,75 = 300.'),

  ((select id from b_simulado), 5, 'Matemática/RLM',
   'Um valor de R$ 1.000 aumenta 10% e depois diminui 10%. Qual é o resultado final?',
   '{"A":"R$ 1.000","B":"R$ 990","C":"R$ 1.010","D":"R$ 900"}'::jsonb,
   'B', '1000 × 1,10 × 0,90 = 990.'),

  ((select id from b_simulado), 6, 'Constitucional',
   'Qual dos princípios expressos no art. 37 da Constituição está associado à busca por melhores resultados e produtividade?',
   '{"A":"Publicidade","B":"Impessoalidade","C":"Eficiência","D":"Moralidade"}'::jsonb,
   'C', 'Eficiência é o princípio associado a resultados e produtividade.'),

  ((select id from b_simulado), 7, 'Constitucional',
   'O Banco do Brasil é classificado como:',
   '{"A":"Autarquia federal","B":"Órgão da Administração direta","C":"Empresa pública","D":"Sociedade de economia mista"}'::jsonb,
   'D', 'O Banco do Brasil é sociedade de economia mista federal.'),

  ((select id from b_simulado), 8, 'Constitucional',
   'Segundo a Constituição, o concurso público tem prazo de validade de:',
   '{"A":"Até dois anos, prorrogável uma vez por igual período","B":"Exatamente quatro anos","C":"Até cinco anos, sem limite de prorrogações","D":"Um ano, sem prorrogação"}'::jsonb,
   'A', 'Art. 37, III: até dois anos, prorrogável uma vez por igual período.'),

  ((select id from b_simulado), 9, 'Conhecimentos Bancários',
   'Qual produto é um título emitido por instituição financeira para captação de recursos?',
   '{"A":"Pix","B":"CDB","C":"Boleto bancário","D":"Cartão de débito"}'::jsonb,
   'B', 'CDB é o título de captação de recursos.'),

  ((select id from b_simulado), 10, 'Conhecimentos Bancários',
   'A LCA está relacionada principalmente ao:',
   '{"A":"Financiamento imobiliário","B":"Pagamento instantâneo","C":"Agronegócio","D":"Crédito consignado"}'::jsonb,
   'C', 'LCA = Letra de Crédito do Agronegócio.'),

  ((select id from b_simulado), 11, 'Conhecimentos Bancários',
   'Ao avaliar duas propostas de empréstimo, qual indicador ajuda a comparar o custo total da operação?',
   '{"A":"Apenas o valor liberado","B":"Apenas o número de parcelas","C":"Apenas a taxa anunciada em destaque","D":"Custo Efetivo Total (CET)"}'::jsonb,
   'D', 'O CET reúne os custos relevantes da operação para comparação.'),

  ((select id from b_simulado), 12, 'Matemática/RLM',
   'Um produto de R$ 200 sofre aumento de 15%. Qual será seu preço?',
   '{"A":"R$ 215","B":"R$ 225","C":"R$ 230","D":"R$ 240"}'::jsonb,
   'C', '200 × 1,15 = 230.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
