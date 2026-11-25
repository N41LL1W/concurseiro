-- Cadastra o Dia 29. Carga: 4h20 (4 x 60 min de matérias + 20 min de simulado/teste/revisão). Semana 6, dia 5.
delete from days where week = 6 and day_number = 5;

with d as (
  insert into days (week, day_number, title)
  values (6, 5, 'Concordância verbal e nominal + porcentagem e variações sucessivas + Administração Pública (art. 37) + Sistema Financeiro Nacional')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Concordância verbal e nominal: sujeito, haver/fazer/existir, que/quem, anexo, meio, bastante', 45, $$Concordância é um dos assuntos mais cobrados pelas bancas (VUNESP, CESGRANRIO, FGV, FCC). Concordância verbal: o verbo concorda com o sujeito. Concordância nominal: artigos, adjetivos, pronomes e numerais concordam com o substantivo.

REGRA GERAL
O verbo concorda com o sujeito em número e pessoa. "O candidato estudou." / "Os candidatos estudaram." / "A funcionária trabalha." / "As funcionárias trabalham."

SUJEITO SIMPLES
Concorda com o núcleo. "A instituição oferece diversos serviços." / "Os bancos oferecem diversos serviços." Pegadinha: o sujeito pode estar distante do verbo. "A quantidade de candidatos inscritos no concurso aumentou." — o núcleo é "quantidade", não "candidatos". Errado: "A quantidade de candidatos aumentaram."

SUJEITO COMPOSTO
Dois ou mais núcleos: normalmente o verbo vai para o plural. "O gerente e o funcionário resolveram o problema." / "A Caixa e o Banco do Brasil oferecem diversos serviços." Antes do verbo: "Maria e João estudam juntos." Depois do verbo, também pode concordar com os dois núcleos: "Chegaram o gerente e os funcionários."

EXPRESSÕES QUE CONFUNDEM
"A maioria de", "grande parte de", "a maior parte de", "metade de": o verbo pode ficar no singular (concordando com o núcleo da expressão) ou no plural (concordando com o termo que vem depois). "A maioria dos candidatos foi aprovada." / "A maioria dos candidatos foram aprovados." As duas são admitidas. Não se assuste quando a banca apresentar o plural após "a maioria dos".

"MAIS DE UM"
Normalmente o verbo fica no singular: "Mais de um candidato faltou à prova."; "Mais de uma pessoa reclamou do atendimento." Exceção: ideia de reciprocidade — "Mais de um candidato se cumprimentaram." (um cumprimentou o outro).

HAVER (= EXISTIR) — IMPESSOAL
Fica sempre na 3ª pessoa do singular: "Há muitos candidatos inscritos."; "Havia vários documentos sobre a mesa."; "Houve problemas durante o atendimento."; "Haverá novas oportunidades." Pegadinha: EXISTIR concorda normalmente: "Existem muitos candidatos."; "Existiam vários documentos."; "Existiram dificuldades." Haver: "Há problemas." Existir: "Existem problemas."

FAZER INDICANDO TEMPO — IMPESSOAL
"Faz dois anos que estudo para concursos."; "Faz três meses que trabalho aqui."; "Faz dez dias que o edital foi publicado." Errado: "Fazem dois anos que estudo."

CONCORDÂNCIA COM "QUE" E "QUEM"
Pronome relativo "que": o verbo concorda com o antecedente. "Fui eu que resolvi a questão."; "Foram eles que resolveram a questão."; "Foi a candidata que passou." Pronome "quem": o verbo pode ficar na 3ª pessoa do singular ("Fui eu quem resolveu a questão.") ou concordar com o antecedente ("Fui eu quem resolvi a questão."). As duas são possíveis.

CONCORDÂNCIA NOMINAL
Os termos ligados ao substantivo concordam com ele: "Funcionário dedicado." / "Funcionários dedicados." / "Candidata aprovada." / "Candidatas aprovadas."

PALAVRAS MUITO COBRADAS
ANEXO varia: "Seguem anexos os documentos."; "Segue anexa a declaração."; "Seguem anexas as certidões." A expressão "em anexo" é invariável: "Os documentos seguem em anexo."
INCLUSO varia: "O valor está incluso."; "As taxas estão inclusas."
OBRIGADO concorda com quem agradece: homem — obrigado; mulher — obrigada; plural — obrigados / obrigadas.
MESMO, no sentido de "próprio", varia: "Ela mesma resolveu."; "Eles mesmos resolveram."
BASTANTE: invariável quando intensifica verbo, adjetivo ou advérbio ("Os candidatos estudaram bastante."; "A prova estava bastante difícil."); varia quando acompanha substantivo com sentido de "muitos" ("Havia bastantes candidatos."; "Foram apresentadas bastantes questões.").
MEIO: "um pouco" = advérbio invariável ("Ela estava meio cansada."; "Os candidatos estavam meio nervosos."); "metade" varia ("meio litro", "meia hora", "duas meias porções").

PEGADINHAS DE CONCURSO
Haviam muitos candidatos → Havia muitos candidatos. Fazem cinco anos → Faz cinco anos. Segue anexo as declarações → Seguem anexas as declarações. As funcionárias estavam meias cansadas → meio cansadas. Existia muitas oportunidades → Existiam muitas oportunidades.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — concordância verbal e nominal (Q1 a Q4)', 15 from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Porcentagem: aumentos, descontos, variações sucessivas e variação percentual', 45, $$PORCENTAGEM
Representa uma parte de 100. 25% = 25/100 = 0,25.
Em decimal: 1% = 0,01; 5% = 0,05; 10% = 0,10; 15% = 0,15; 20% = 0,20; 25% = 0,25; 30% = 0,30; 40% = 0,40; 50% = 0,50; 75% = 0,75; 100% = 1,00.

COMO CALCULAR
20% de R$ 800 = 800 × 0,20 = R$ 160. 15% de R$ 2.000 = 2000 × 0,15 = R$ 300.
Método rápido: 10% = dividir por 10 (10% de 450 = 45); 5% = 10% ÷ 2 (22,50); 20% = dividir por 5 (90).

AUMENTO PERCENTUAL
R$ 500 com aumento de 20%: aumento = 500 × 0,20 = 100; preço final = 600. Método direto: aumentar 20% = multiplicar por 1,20 → 500 × 1,20 = 600.

DESCONTO PERCENTUAL
R$ 800 com desconto de 15%: desconto = 800 × 0,15 = 120; preço final = 680. Método direto: desconto de 15% = pagar 85% → 800 × 0,85 = 680.

AUMENTOS SUCESSIVOS
R$ 1.000 com aumento de 10% e depois de 20%: 1000 × 1,10 = 1100; 1100 × 1,20 = 1320. Aumento total: 320/1000 = 32% — não é 30%. Aumento de 10% seguido de 20% = aumento total de 32%.

DESCONTOS SUCESSIVOS
R$ 1.000 com desconto de 10% e depois de 20%: 1000 × 0,90 = 900; 900 × 0,80 = 720. Desconto total: 280/1000 = 28% — não é 30%.

AUMENTO SEGUIDO DE DESCONTO
R$ 1.000, aumento de 20% e depois desconto de 20%: 1000 × 1,20 = 1200; 1200 × 0,80 = 960. Não voltou ao original: perda final de 4%.

VARIAÇÃO PERCENTUAL
Salário de R$ 2.000 para R$ 2.500: diferença = 500; 500/2000 = 0,25 = 25% de aumento. Fórmula: variação % = (valor final − valor inicial) / valor inicial × 100.

PEGADINHAS
10% + 20% em aumentos sucessivos não são 30%. Desconto de 10% e depois de 20% não é 30%. O percentual sempre deve ser aplicado sobre a base indicada. Aumento e desconto com o mesmo percentual não se anulam. Para variação percentual, a base é o valor inicial.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — porcentagem e variações sucessivas (Q1 a Q4)', 15 from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Art. 37: LIMPE, concurso público, prioridade, acumulação e responsabilidade civil do Estado', 45, $$ADMINISTRAÇÃO PÚBLICA
Conjunto de órgãos, entidades e agentes que exercem atividades destinadas a atender às necessidades da sociedade (INSS, Receita Federal, órgãos do Judiciário, prefeituras, ministérios, autarquias, universidades públicas, empresas públicas). O art. 37 traz os princípios que a Administração direta e indireta, de todos os Poderes e entes federativos, deve observar.

OS CINCO PRINCÍPIOS — LIMPE
Legalidade: só se age conforme a lei autoriza. Impessoalidade: interesse público, sem favorecimentos ou perseguições. Moralidade: ética, honestidade, boa-fé e probidade. Publicidade: atos divulgados, ressalvado o sigilo legal. Eficiência: resultados, qualidade, rapidez e bom uso dos recursos públicos.

LEGALIDADE
Particular: pode fazer tudo o que a lei não proíbe. Administrador público: deve agir conforme a lei autoriza. Ex.: servidor não pode criar uma cobrança porque a considera útil — precisa de fundamento legal. Pegadinha: "o administrador pode fazer o que não for expressamente proibido" está errado — essa lógica é do particular.

IMPESSOALIDADE
1) Proíbe favorecimentos (amigos, familiares, conhecidos — ex.: passar um conhecido na frente na fila sem justificativa). 2) Proíbe perseguições por motivos pessoais. 3) Exige finalidade pública. 4) Publicidade institucional: o § 1º do art. 37 determina que a publicidade dos atos, programas, obras, serviços e campanhas tenha caráter educativo, informativo ou de orientação social, sem nomes, símbolos ou imagens que caracterizem promoção pessoal de autoridades ou servidores.

MORALIDADE
Não basta obedecer formalmente à lei: é preciso agir com ética e honestidade. Um procedimento aparentemente legal usado para beneficiar alguém indevidamente pode violar a moralidade. Não é a opinião pessoal do servidor sobre certo e errado — é princípio jurídico, que exige comportamento ético compatível com a finalidade pública.

PUBLICIDADE
Permite que a sociedade conheça e fiscalize os atos: transparência, controle social, prestação de contas, fiscalização. Ex.: publicar despesas públicas. Não é absoluta: o sigilo é permitido quando necessário para proteger intimidade, segurança, informações legalmente sigilosas e interesse público protegido pela legislação.

EFICIÊNCIA
Melhor uso dos recursos: rapidez, qualidade, produtividade, organização, redução de desperdícios e bom atendimento. Ex.: dois servidores fazem o mesmo serviço; um leva 30 dias por falta de organização, o outro, usando os sistemas, leva 5 dias sem perder qualidade.

CONCURSO PÚBLICO — ART. 37, II
A investidura em cargo ou emprego público depende, em regra, de aprovação prévia em concurso de provas ou de provas e títulos, conforme a natureza e a complexidade do cargo ou emprego. Exceção: cargos em comissão, de livre nomeação e exoneração, observadas as regras constitucionais e legais.
Pegadinha: cargo em comissão ≠ função de confiança. A função de confiança é exercida exclusivamente por servidores ocupantes de cargo efetivo; os cargos em comissão destinam-se a direção, chefia e assessoramento.

PRAZO DE VALIDADE
Até dois anos, prorrogável uma única vez, por igual período. Ex.: validade de 1 ano → pode ser prorrogada por mais 1 (total de até 2). Validade de 2 anos → pode ser prorrogada por mais 2 (total de até 4). A prorrogação não é obrigatória.

PRIORIDADE DO APROVADO — ART. 37, IV
Durante o prazo improrrogável previsto no edital de convocação, o aprovado em concurso será convocado com prioridade sobre novos concursados para assumir cargo ou emprego na carreira. Ex.: o órgão não deve realizar novo concurso para as mesmas vagas ignorando a prioridade dos aprovados no concurso anterior.

ACUMULAÇÃO DE CARGOS
Regra: proibida a acumulação remunerada. Exceções, havendo compatibilidade de horários: dois cargos de professor; um cargo de professor com outro de qualquer natureza; dois cargos ou empregos privativos de profissionais de saúde, com profissões regulamentadas. Pegadinha: não basta se enquadrar na exceção — é necessária a compatibilidade de horários.

RESPONSABILIDADE CIVIL DO ESTADO — ART. 37, § 6º
As pessoas jurídicas de direito público e as de direito privado prestadoras de serviços públicos respondem pelos danos que seus agentes, nessa qualidade, causarem a terceiros. A responsabilidade é, em regra, objetiva: a vítima não precisa provar a culpa do agente; demonstra, conforme o caso, o dano, a conduta do agente público e o nexo de causalidade. O Estado pode buscar o ressarcimento do agente por ação regressiva quando houver dolo ou culpa. Ex.: veículo oficial, em serviço, causa acidente e danifica o carro de um cidadão.

PEGADINHAS DE PROVA
LIMPE = princípios expressos. Concurso: provas ou provas e títulos. Validade: até 2 anos, prorrogável uma vez por igual período. Função de confiança: servidor efetivo. Cargo em comissão: direção, chefia e assessoramento. Acumulação: regra proibitiva, com exceções e compatibilidade de horários. Publicidade não pode promover autoridades. Responsabilidade estatal: regra objetiva.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — art. 37 da Constituição (Q1 a Q4)', 15 from d returning id
),
b_banc_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Conhecimentos Bancários', 'teoria', 'SFN: CMN, Banco Central, COPOM/Selic, CVM, SUSEP, PREVIC, bancos, CAIXA, BB e cooperativas', 45, $$O QUE É O SFN
Conjunto de instituições e órgãos que organizam, regulamentam e viabilizam as atividades financeiras no Brasil, permitindo que o dinheiro circule entre os agentes da economia: quem tem recursos disponíveis, quem precisa financiar uma casa, a empresa que quer crescer — o sistema conecta todos por instituições, produtos e serviços.

TRÊS GRUPOS
Órgãos normativos: estabelecem regras e diretrizes. Entidades supervisoras: fiscalizam e supervisionam o cumprimento das regras. Operadores: realizam atividades financeiras diretamente com os clientes e participantes do mercado.

CMN — CONSELHO MONETÁRIO NACIONAL
Principal órgão normativo do SFN: estabelece diretrizes e normas gerais para a política monetária, creditícia e cambial — diretrizes para o sistema, orientação das políticas de crédito, busca da estabilidade da moeda. Pegadinha: o CMN não executa diretamente todas as operações bancárias; estabelece normas e diretrizes.

BANCO CENTRAL DO BRASIL
Entidade supervisora e executora: executa a política monetária; emite moeda, conforme suas competências; fiscaliza instituições financeiras; autoriza o funcionamento de instituições financeiras nos casos previstos; administra reservas internacionais; atua na estabilidade do sistema; implementa e supervisiona regras. Tem papel fundamental no controle da inflação e na estabilidade monetária.

COPOM
Comitê de Política Monetária: define a meta da taxa Selic, uma das principais taxas de juros da economia, que influencia empréstimos, financiamentos, investimentos, consumo, inflação e atividade econômica.
Selic em alta, em geral: crédito mais caro, consumo pode diminuir, renda fixa pode ficar mais atrativa, a economia pode desacelerar, pressão para reduzir a inflação. Selic em queda, em geral: crédito mais barato, consumo pode aumentar, empresas podem investir mais, atividade econômica estimulada. Os efeitos não são automáticos nem imediatos.

CVM
Regula, fiscaliza e desenvolve o mercado de valores mobiliários: ações, debêntures, fundos de investimento (dentro de sua competência), mercado de capitais, companhias abertas e participantes do mercado. Ex.: empresa que emite ações para captar recursos. Pegadinha: a CVM não fiscaliza todos os bancos comerciais — o Banco Central tem o papel central na supervisão das instituições financeiras bancárias.

SUSEP × PREVIC
SUSEP: supervisiona seguros, previdência complementar aberta, capitalização e resseguro, dentro de suas competências (seguro de automóvel, de vida, previdência privada aberta, títulos de capitalização). PREVIC: fiscaliza e supervisiona as entidades fechadas de previdência complementar — os fundos de pensão. SUSEP = previdência aberta e seguros; PREVIC = previdência complementar fechada.

OPERADORES
Bancos comerciais, bancos múltiplos, Caixa Econômica Federal, Banco do Brasil, cooperativas de crédito, instituições de pagamento, corretoras, distribuidoras e seguradoras.
Banco comercial: capta depósitos e concede crédito (conta corrente, empréstimos, financiamentos, cartões, transferências, pagamentos); conecta quem tem recursos a quem precisa.
Banco múltiplo: atua em diferentes segmentos por meio de carteiras (entre as possíveis: comercial, investimento, crédito imobiliário, crédito/financiamento/investimento e arrendamento mercantil); deve ter pelo menos duas carteiras, sendo uma obrigatoriamente comercial ou de investimento.

BANCO DO BRASIL
Sociedade de economia mista: participação do Estado e de acionistas privados, constituída sob a forma de sociedade anônima, sujeita às regras próprias das empresas estatais e do mercado. Atua em crédito, serviços bancários, financiamento agrícola, agente financeiro, investimentos e serviços para pessoas físicas e jurídicas.

CAIXA ECONÔMICA FEDERAL
Empresa pública federal. Atua em serviços bancários, crédito imobiliário, financiamento habitacional, FGTS, programas sociais, loterias federais, poupança e crédito para pessoas físicas e jurídicas.
Comparação muito cobrada: Banco do Brasil = sociedade de economia mista; Caixa = empresa pública.

COOPERATIVAS DE CRÉDITO
Instituições financeiras constituídas por associação de pessoas; os associados participam da instituição e usam seus serviços. Atendem associados, têm participação cooperativa, podem conceder crédito, captar recursos e prestar serviços financeiros, com estrutura baseada na cooperação. Diferem de um banco tradicional em estrutura societária e finalidade organizacional.

INTERMEDIAÇÃO FINANCEIRA
Agente superavitário: tem recursos sobrando (ex.: quem guarda parte do salário). Agente deficitário: precisa de recursos (ex.: empresa que financia equipamentos). O sistema financeiro os conecta. Ex.: Maria deposita R$ 10.000 e João precisa de crédito para um negócio; a instituição administra recursos, riscos e operações de crédito dentro das regras, permitindo a circulação de recursos.

PEGADINHAS BANCÁRIAS
CMN = órgão normativo. Banco Central = executor e supervisor de importantes funções. COPOM = define a meta da Selic. CVM = mercado de valores mobiliários. SUSEP = seguros e previdência aberta. PREVIC = previdência fechada. Banco do Brasil = sociedade de economia mista. Caixa = empresa pública federal. Cooperativa de crédito = instituição financeira cooperativa.$$
  from d returning id
),
b_banc_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Conhecimentos Bancários', 'exercicios', 'Fixação — Sistema Financeiro Nacional (Q1 a Q4)', 15 from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 29 (12 questões)', 10,
    $$Sem consultar o conteúdo. 12 questões: Português (3), Matemática (3), Constitucional (3) e Bancários (3).$$
  from d returning id
),
b_teste as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'exercicios', 'Teste rápido — 8 questões de verificação', 6,
    $$Responda sem olhar o gabarito. Duas questões de cada matéria, para conferir a retenção do dia.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 11, 'Revisão/Simulados', 'revisao', 'Caderno de erros, revisão programada e checklist do Dia 29', 4, $$CADERNO DE ERROS
Não anote apenas a alternativa errada: anote por que errou e qual regra deveria ter aplicado. Ex.: "Errei porcentagem porque apliquei o segundo desconto sobre o preço original, quando deveria aplicá-lo sobre o preço já descontado." Isso diminui erros repetidos. Os erros nas questões de hoje entram automaticamente no caderno do app.

REVISÃO PROGRAMADA
Amanhã (24h): releia os pontos principais de concordância, porcentagem, art. 37 e SFN e faça 5 questões de cada matéria. Após 3 dias: 10 questões variadas sem consultar a teoria. Após 7 dias: revisão de 20 questões misturadas. Após 15 dias: revise só os assuntos em que teve erros. Após 30 dias: simulado maior para verificar a retenção.

CHECKLIST DO DIA 29
Estudei concordância verbal e nominal. Aprendi porcentagem, aumentos, descontos e variações sucessivas. Estudei os princípios LIMPE, concurso público e acumulação de cargos. Aprendi a estrutura do SFN: CMN, Banco Central, COPOM, CVM, SUSEP e PREVIC. Revisei Caixa e Banco do Brasil. Resolvi os exercícios, o simulado e o teste rápido, e anotei meus erros.
Marque este bloco como concluído para fechar o Dia 29 e a Semana 6.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a alternativa correta.',
   '{"A":"Haviam muitos candidatos inscritos.","B":"Fazem três meses que o edital foi publicado.","C":"Existem várias oportunidades disponíveis.","D":"A maioria dos funcionários chegaram atrasados, obrigatoriamente."}'::jsonb,
   'C', '"Existir" concorda com o sujeito ("várias oportunidades"). "Haver" (existir) e "fazer" (tempo) são impessoais — A e B erram; D afirma "obrigatoriamente", mas "a maioria" admite singular ou plural.'),
  ((select id from b_port_ex), 2, 'Português',
   'Assinale a alternativa com concordância correta.',
   '{"A":"Segue anexas as declarações.","B":"Seguem anexos os documentos.","C":"Os candidatos estavam meios nervosos.","D":"Houveram problemas."}'::jsonb,
   'B', '"Anexos" concorda com "documentos". As demais erram: "anexas" com verbo no singular, "meio" (advérbio, invariável) e "houveram" (haver impessoal).'),
  ((select id from b_port_ex), 3, 'Português',
   'Complete corretamente: "Fui eu que ______ o documento."',
   '{"A":"assinou","B":"assinaram","C":"assinei","D":"assinava obrigatoriamente"}'::jsonb,
   'C', 'Com o relativo "que", o verbo concorda com o antecedente "eu": "Fui eu que assinei".'),
  ((select id from b_port_ex), 4, 'Português',
   'Assinale a frase correta.',
   '{"A":"Fazem dez anos que trabalho.","B":"Haviam pessoas na fila.","C":"A maioria dos candidatos foi aprovada.","D":"As funcionárias estavam meia cansadas."}'::jsonb,
   'C', '"A maioria" admite concordância no singular. As demais erram "fazer" e "haver" impessoais e o advérbio "meio".'),

  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Quanto é 15% de R$ 1.200?',
   '{"A":"R$ 120","B":"R$ 150","C":"R$ 180","D":"R$ 200"}'::jsonb,
   'C', '1200 × 0,15 = 180.'),
  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Um produto de R$ 800 sofre desconto de 25%. O preço final será:',
   '{"A":"R$ 500","B":"R$ 550","C":"R$ 600","D":"R$ 650"}'::jsonb,
   'C', '800 × 0,75 = 600.'),
  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Um produto de R$ 1.000 sofre aumento de 10% e depois aumento de 20%. Qual é o preço final?',
   '{"A":"R$ 1.300","B":"R$ 1.320","C":"R$ 1.200","D":"R$ 1.310"}'::jsonb,
   'B', '1000 × 1,10 × 1,20 = 1320 (aumento total de 32%).'),
  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Um produto de R$ 2.000 sofre desconto de 10% e depois de 15%. O preço final é:',
   '{"A":"R$ 1.500","B":"R$ 1.530","C":"R$ 1.550","D":"R$ 1.700"}'::jsonb,
   'B', '2000 × 0,90 × 0,85 = 1530.'),

  ((select id from b_const_ex), 1, 'Constitucional',
   'São princípios expressos no art. 37 da Constituição:',
   '{"A":"Legalidade, igualdade, razoabilidade, proporcionalidade e eficiência.","B":"Legalidade, impessoalidade, moralidade, publicidade e eficiência.","C":"Moralidade, economicidade, supremacia, publicidade e igualdade.","D":"Legalidade, hierarquia, disciplina, publicidade e eficiência."}'::jsonb,
   'B', 'LIMPE: legalidade, impessoalidade, moralidade, publicidade e eficiência.'),
  ((select id from b_const_ex), 2, 'Constitucional',
   'O concurso público possui prazo de validade de:',
   '{"A":"Até 1 ano, prorrogável duas vezes.","B":"Até 3 anos, sem prorrogação.","C":"Até 2 anos, prorrogável uma vez por igual período.","D":"4 anos obrigatoriamente."}'::jsonb,
   'C', 'Art. 37, III: até dois anos, prorrogável uma vez por igual período.'),
  ((select id from b_const_ex), 3, 'Constitucional',
   'Assinale a alternativa correta sobre acumulação de cargos públicos.',
   '{"A":"É sempre permitida.","B":"É sempre proibida, sem exceções.","C":"É permitida em hipóteses constitucionais, desde que exista compatibilidade de horários.","D":"É permitida somente para servidores federais."}'::jsonb,
   'C', 'A regra é a proibição, com exceções constitucionais e compatibilidade de horários.'),
  ((select id from b_const_ex), 4, 'Constitucional',
   'O princípio da impessoalidade proíbe:',
   '{"A":"A divulgação de informações públicas.","B":"O atendimento ao cidadão.","C":"A promoção pessoal de autoridades por meio da publicidade institucional.","D":"A realização de concursos públicos."}'::jsonb,
   'C', 'O art. 37, § 1º veda a promoção pessoal de autoridades na publicidade institucional.'),

  ((select id from b_banc_ex), 1, 'Conhecimentos Bancários',
   'O principal órgão normativo do Sistema Financeiro Nacional é:',
   '{"A":"Banco Central.","B":"CVM.","C":"CMN.","D":"Caixa Econômica Federal."}'::jsonb,
   'C', 'O CMN é o principal órgão normativo do SFN.'),
  ((select id from b_banc_ex), 2, 'Conhecimentos Bancários',
   'A instituição responsável pela supervisão do mercado de valores mobiliários é:',
   '{"A":"CVM.","B":"SUSEP.","C":"PREVIC.","D":"COPOM."}'::jsonb,
   'A', 'A CVM regula e fiscaliza o mercado de valores mobiliários.'),
  ((select id from b_banc_ex), 3, 'Conhecimentos Bancários',
   'O Banco do Brasil possui natureza jurídica de:',
   '{"A":"Autarquia federal.","B":"Empresa pública.","C":"Sociedade de economia mista.","D":"Fundação pública."}'::jsonb,
   'C', 'O Banco do Brasil é sociedade de economia mista.'),
  ((select id from b_banc_ex), 4, 'Conhecimentos Bancários',
   'A PREVIC atua principalmente na supervisão:',
   '{"A":"Dos bancos comerciais.","B":"Das entidades fechadas de previdência complementar.","C":"Das seguradoras de automóveis.","D":"Das bolsas de valores."}'::jsonb,
   'B', 'A PREVIC supervisiona as entidades fechadas de previdência complementar (fundos de pensão).'),

  ((select id from b_simulado), 1, 'Português',
   'Assinale a alternativa correta.',
   '{"A":"Houveram muitos problemas.","B":"Fazem quatro anos que estudo.","C":"Existem documentos pendentes.","D":"A maioria dos candidatos chegaram, obrigatoriamente."}'::jsonb,
   'C', '"Existir" concorda com "documentos". As demais erram "haver" e "fazer" impessoais, ou afirmam "obrigatoriamente" sobre uma construção facultativa.'),
  ((select id from b_simulado), 2, 'Português',
   'Assinale a frase correta.',
   '{"A":"As funcionárias estavam meias preocupadas.","B":"Seguem anexas as declarações.","C":"Havia muitos candidatos e existiam problemas, sendo que os dois verbos são impessoais.","D":"Mais de um candidato faltaram, obrigatoriamente."}'::jsonb,
   'B', '"Anexas" concorda com "declarações". Em C, "existir" não é impessoal; em A, "meio" é invariável; em D, "mais de um" leva em regra o singular.'),
  ((select id from b_simulado), 3, 'Português',
   'Complete: "Os candidatos foram aprovados porque ______ bastante."',
   '{"A":"estudou","B":"estudaram","C":"havia estudado","D":"existia estudado"}'::jsonb,
   'B', 'O sujeito "os candidatos" pede verbo no plural: "estudaram".'),
  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Um funcionário recebe R$ 2.400. Seu salário aumenta 10%. O novo salário será:',
   '{"A":"R$ 2.440","B":"R$ 2.600","C":"R$ 2.640","D":"R$ 2.800"}'::jsonb,
   'C', '2400 × 1,10 = 2640.'),
  ((select id from b_simulado), 5, 'Matemática/RLM',
   'Um produto custa R$ 500 e recebe dois descontos sucessivos de 10%. O preço final é:',
   '{"A":"R$ 400","B":"R$ 405","C":"R$ 410","D":"R$ 450"}'::jsonb,
   'B', '500 × 0,90 × 0,90 = 405.'),
  ((select id from b_simulado), 6, 'Matemática/RLM',
   'Uma mercadoria passa de R$ 800 para R$ 1.000. O aumento percentual foi:',
   '{"A":"20%","B":"25%","C":"30%","D":"40%"}'::jsonb,
   'B', '(1000 − 800) / 800 = 0,25 = 25%.'),
  ((select id from b_simulado), 7, 'Constitucional',
   'A Administração Pública deve observar:',
   '{"A":"Legalidade, impessoalidade, moralidade, publicidade e eficiência.","B":"Legalidade, pessoalidade, moralidade, sigilo e eficiência.","C":"Hierarquia, disciplina, pessoalidade e produtividade.","D":"Apenas legalidade e eficiência."}'::jsonb,
   'A', 'São os cinco princípios expressos do art. 37 (LIMPE).'),
  ((select id from b_simulado), 8, 'Constitucional',
   'A publicidade institucional:',
   '{"A":"Pode promover livremente o nome do governante.","B":"Deve possuir caráter educativo, informativo ou de orientação social e não pode promover pessoalmente autoridades.","C":"É sempre proibida.","D":"É obrigatória mesmo quando houver informação legalmente sigilosa."}'::jsonb,
   'B', 'Art. 37, § 1º.'),
  ((select id from b_simulado), 9, 'Constitucional',
   'A acumulação remunerada de cargos públicos:',
   '{"A":"É sempre permitida.","B":"É proibida, mas possui exceções constitucionais, observada a compatibilidade de horários.","C":"É permitida apenas para servidores municipais.","D":"É permitida sem limites para professores."}'::jsonb,
   'B', 'Regra proibitiva, com exceções constitucionais e compatibilidade de horários.'),
  ((select id from b_simulado), 10, 'Conhecimentos Bancários',
   'A meta da taxa Selic é definida pelo:',
   '{"A":"CMN.","B":"COPOM.","C":"Banco do Brasil.","D":"CVM."}'::jsonb,
   'B', 'O COPOM define a meta da Selic.'),
  ((select id from b_simulado), 11, 'Conhecimentos Bancários',
   'A Caixa Econômica Federal é:',
   '{"A":"Sociedade de economia mista.","B":"Banco privado.","C":"Empresa pública federal.","D":"Autarquia."}'::jsonb,
   'C', 'A Caixa é empresa pública federal.'),
  ((select id from b_simulado), 12, 'Conhecimentos Bancários',
   'A fiscalização do mercado de valores mobiliários está relacionada principalmente à:',
   '{"A":"PREVIC.","B":"SUSEP.","C":"CVM.","D":"Caixa."}'::jsonb,
   'C', 'A CVM fiscaliza o mercado de valores mobiliários.'),

  ((select id from b_teste), 1, 'Português',
   'Concordância verbal: assinale a alternativa correta.',
   '{"A":"Houveram muitas inscrições.","B":"Fazem dois meses.","C":"Existem vários documentos.","D":"A maioria chegaram."}'::jsonb,
   'C', '"Existem" concorda com "documentos". "Houve" e "faz" são impessoais; em D, o plural é admitido, mas as demais estão erradas e C é a única inequivocamente correta.'),
  ((select id from b_teste), 2, 'Português',
   'Concordância nominal: qual está correta?',
   '{"A":"As provas seguem anexas.","B":"Os candidatos estavam meios nervosos.","C":"Segue anexos as provas.","D":"As funcionárias estavam meia cansadas."}'::jsonb,
   'A', '"Anexas" concorda com "provas". "Meio" (um pouco) é invariável.'),
  ((select id from b_teste), 3, 'Matemática/RLM',
   '20% de R$ 1.500 equivale a:',
   '{"A":"R$ 150","B":"R$ 250","C":"R$ 300","D":"R$ 350"}'::jsonb,
   'C', '1500 × 0,20 = 300.'),
  ((select id from b_teste), 4, 'Matemática/RLM',
   'R$ 1.000 com descontos sucessivos de 10% e 20%:',
   '{"A":"R$ 700","B":"R$ 720","C":"R$ 750","D":"R$ 800"}'::jsonb,
   'B', '1000 × 0,90 × 0,80 = 720 (desconto total de 28%).'),
  ((select id from b_teste), 5, 'Constitucional',
   'Qual é um princípio expresso no art. 37?',
   '{"A":"Pessoalidade","B":"Eficiência","C":"Sigilo absoluto","D":"Autonomia irrestrita"}'::jsonb,
   'B', 'Eficiência integra o LIMPE.'),
  ((select id from b_teste), 6, 'Constitucional',
   'A validade do concurso é:',
   '{"A":"Sempre 4 anos","B":"Até 2 anos, prorrogável uma vez por igual período","C":"Até 3 anos, prorrogável duas vezes","D":"Indeterminada"}'::jsonb,
   'B', 'Até dois anos, prorrogável uma vez por igual período.'),
  ((select id from b_teste), 7, 'Conhecimentos Bancários',
   'Órgão normativo principal do SFN:',
   '{"A":"CVM","B":"CMN","C":"Banco do Brasil","D":"SUSEP"}'::jsonb,
   'B', 'O CMN é o principal órgão normativo.'),
  ((select id from b_teste), 8, 'Conhecimentos Bancários',
   'A Caixa Econômica Federal é:',
   '{"A":"Sociedade de economia mista","B":"Empresa pública federal","C":"Autarquia","D":"Banco privado"}'::jsonb,
   'B', 'A Caixa é empresa pública federal.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
