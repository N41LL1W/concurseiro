-- Cadastra o Dia 26 (4h: 55+55+55+55+20). Semana 6, dia 2.
delete from days where week = 6 and day_number = 2;

with d as (
  insert into days (week, day_number, title)
  values (6, 2, 'Crase + razão, proporção e regra de três + princípios da Administração (art. 37) + Sistema Financeiro Nacional')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Crase: formação, teste do masculino, quando usar e quando não usar', 40, $$A crase ocorre, em regra, quando há a união de dois elementos: a preposição "a" e o artigo feminino "a" ou "as". Essa união é representada pelo acento grave: à ou às.

FORMAÇÃO DA CRASE
Quem vai, vai a algum lugar. A palavra seguinte pode aceitar o artigo feminino "a". Ex.: "Vou a + a escola" → "Vou à escola." A primeira letra "a" é a preposição exigida pelo verbo ir; a segunda é o artigo feminino que acompanha "escola".

REGRA PRÁTICA: TROQUE POR UMA PALAVRA MASCULINA
Se aparecer "ao" na substituição masculina, há crase na expressão feminina. "Vou à escola" → "Vou ao colégio". "Entreguei o documento à diretora" → "Entreguei o documento ao diretor". Logo, "à diretora" recebe crase.

QUANDO USAR CRASE
1) Antes de palavras femininas que aceitam artigo: "Fui à reunião."; "Cheguei à agência."; "Entreguei o documento à funcionária."; "O candidato dirigiu-se à sala."
2) Em locuções adverbiais femininas: à noite, à tarde, à esquerda, à direita, à vontade, às pressas, às vezes. Ex.: "O funcionário chegou à agência às oito horas."
3) Antes de "aquele", "aquela", "aquilo", quando existe a preposição "a": "Refiro-me àquele candidato."; "Entreguei o documento àquela funcionária."; "Não dei importância àquilo."
4) Em horas determinadas: "A reunião começará às 14 horas."; "O atendimento vai das 9h às 17h."; "Cheguei à uma hora da tarde." Atenção: em "daqui a duas horas" não há crase, pois não existe artigo feminino.

QUANDO NÃO USAR CRASE
1) Antes de palavras masculinas: andar a cavalo, pagamento a prazo, vendas a crédito, escrever a lápis.
2) Antes de verbos: "Começou a estudar."; "Voltou a trabalhar."; "Aprendeu a resolver questões."
3) Antes de pronomes pessoais: "Entreguei o documento a ela."; "Expliquei a situação a você."; "Pedi ajuda a ele."
4) Antes de palavras femininas no plural quando o "a" está no singular (sem artigo): "Refiro-me a pessoas honestas." Compare: "Refiro-me às pessoas honestas." (com artigo plural, há crase). "O atendimento é destinado a funcionárias."

CASOS ESPECIAIS
À medida que (com crase) × Na medida em que (sem). Cara a cara, frente a frente (sem). À procura de (com). A partir de (sem). À disposição (com). A prazo (sem).

PEGADINHAS DE CONCURSO
"Vou à pé" está errado: a pé. "Entregou o documento à ela" está errado: a ela. "Cheguei à noite" está correto. "Comecei à estudar" está errado: comecei a estudar. "Referi-me àquela situação" está correto.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — crase (Q1 a Q4)', 15 from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Razão, proporção, regra de três simples e composta', 40, $$RAZÃO
Comparação entre duas grandezas por divisão. Agência com 20 funcionários, 8 homens e 12 mulheres: razão homens/mulheres = 8/12 = 2/3 (2 homens para cada 3 mulheres). A ordem importa: mulheres/homens = 12/8.

PROPORÇÃO
Igualdade entre duas razões: 2/4 = 3/6. Multiplicação cruzada: se a/b = c/d, então a×d = b×c. Ex.: 3/5 = x/20 → 5x = 60 → x = 12.

REGRA DE TRÊS SIMPLES
Usada com três valores conhecidos para descobrir um quarto. Pode ser direta ou inversa.
Direta: uma aumenta, a outra também. Ex.: 3 cadernos custam R$ 24; 5 cadernos? 3/5 = 24/x → 3x = 120 → x = 40.
Inversa: uma aumenta, a outra diminui. Ex.: 4 funcionários fazem um serviço em 12 dias; 6 funcionários? Mais funcionários, menos dias: 4×12 = 6×x → 48 = 6x → x = 8 dias.

COMO IDENTIFICAR DIRETA OU INVERSA
Se a primeira grandeza aumentar, a segunda também aumenta? Direta. A segunda diminui? Inversa.
Exemplos: mais produtos, maior preço (direta). Mais funcionários, menos tempo (inversa). Mais horas trabalhadas, maior produção (direta). Maior velocidade, menor tempo para a mesma distância (inversa). Mais pessoas consumindo igualmente, maior quantidade total de comida (direta).

REGRA DE TRÊS COMPOSTA
Três ou mais grandezas. Ex.: 5 funcionários, 6 horas por dia, produzem 300 documentos em 4 dias. Quantos documentos produzem 8 funcionários, 5 horas por dia, em 6 dias, no mesmo ritmo? A produção depende diretamente de funcionários, horas e dias: x = 300 × (8/5) × (5/6) × (6/4) = 300 × 2 = 600.

PORCENTAGEM E PROPORÇÃO
Porcentagem é uma razão com denominador 100. 20% de 500 = 500 × 20/100 = 100.

PEGADINHAS
Não confunda direta com inversa. Na composta, analise cada grandeza separadamente. Mais trabalhadores nem sempre significa maior produção se o tempo ou as condições também mudarem. Organize as unidades antes de calcular. Em velocidade, distância e tempo: para distância fixa, velocidade e tempo são inversamente proporcionais.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — razão, proporção e regra de três (Q1 a Q4)', 15 from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Art. 37: LIMPE, concurso público, cargos em comissão, acumulação e responsabilidade do Estado', 40, $$O art. 37 estabelece princípios que devem ser observados pela Administração Pública direta e indireta, de qualquer dos Poderes da União, dos Estados, do DF e dos Municípios — LIMPE: Legalidade, Impessoalidade, Moralidade, Publicidade, Eficiência.

LEGALIDADE
O administrador só pode agir conforme a lei autoriza. Ex.: servidor não pode criar uma cobrança de taxa sem previsão legal. Pegadinha: o particular, em regra, pode fazer tudo o que a lei não proíbe; o administrador depende de autorização ou fundamento jurídico.

IMPESSOALIDADE
A Administração age visando ao interesse público, sem favorecimentos ou perseguições pessoais. Ex.: servidor não pode acelerar o atendimento de um conhecido só por amizade. Também se liga à proibição de promoção pessoal de autoridades por meio de publicidade institucional.

MORALIDADE
Não basta o ato parecer legal: deve respeitar padrões éticos e de boa-fé. Ex.: usar o cargo para obter vantagem pessoal pode violar a moralidade.

PUBLICIDADE
Permite que a sociedade conheça e fiscalize a atuação administrativa. Ex.: divulgação de despesas públicas contribui para a transparência. Atenção: não significa divulgar todos os dados indiscriminadamente — há sigilo previsto na Constituição e nas leis.

EFICIÊNCIA
Serviços com qualidade, rapidez e bom aproveitamento dos recursos. Ex.: reorganizar o atendimento para reduzir filas. Foi incluída expressamente pela Emenda Constitucional nº 19/1998.

CONCURSO PÚBLICO
Em regra, a investidura em cargo ou emprego público depende de aprovação prévia em concurso de provas ou provas e títulos, conforme a natureza e a complexidade do cargo ou emprego. Validade: até dois anos, prorrogável uma vez por igual período. Ex.: validade inicial de dois anos pode ser prorrogada por mais dois. Pegadinha: é "até" dois anos, não obrigatoriamente dois; a prorrogação ocorre uma só vez e por igual período.

CARGOS EM COMISSÃO
Destinados às atribuições de direção, chefia e assessoramento, observadas as condições constitucionais e legais.

ACUMULAÇÃO DE CARGOS PÚBLICOS
Proibida em regra, com exceções quando houver compatibilidade de horários: dois cargos de professor; um cargo de professor com outro de qualquer natureza; dois cargos ou empregos privativos de profissionais de saúde com profissões regulamentadas.

RESPONSABILIDADE CIVIL DO ESTADO
O Estado responde objetivamente pelos danos que seus agentes, nessa qualidade, causarem a terceiros, assegurado o direito de regresso contra o responsável nos casos de dolo ou culpa.

PEGADINHAS
LIMPE são os cinco princípios expressos no caput do art. 37. Publicidade não é absoluta. A acumulação depende das hipóteses constitucionais e da compatibilidade de horários.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — princípios da Administração Pública (Q1 a Q4)', 15 from d returning id
),
b_banc_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Conhecimentos Bancários', 'teoria', 'SFN: estrutura, CMN, Banco Central, CVM, bancos comerciais, de investimento e cooperativas', 40, $$O QUE É O SFN
Conjunto de instituições e órgãos responsáveis por organizar, regulamentar e fiscalizar as atividades financeiras no Brasil. Permite que o dinheiro circule entre pessoas, empresas, investidores e instituições. Ex.: uma pessoa deposita dinheiro em um banco, outra solicita empréstimo; o sistema permite captação e concessão de crédito dentro das regras aplicáveis.

ESTRUTURA BÁSICA
Órgãos normativos (definem diretrizes e regras gerais): CMN, CNSP e CNPC. Órgãos supervisores (fiscalizam e acompanham dentro de suas competências): Banco Central (BCB), CVM, SUSEP e PREVIC. Operadores (oferecem produtos e serviços): bancos comerciais, bancos de investimento, cooperativas de crédito, corretoras e distribuidoras, instituições de pagamento conforme enquadramento e autorização.

CMN — CONSELHO MONETÁRIO NACIONAL
Órgão normativo superior do SFN. Formula diretrizes da política da moeda e do crédito, zela pela estabilidade da moeda, orienta a aplicação dos recursos das instituições financeiras e estabelece diretrizes para o funcionamento do sistema financeiro. Atenção: o CMN não é banco comercial — não abre contas nem concede empréstimos diretamente ao público.

BANCO CENTRAL DO BRASIL
Entidade supervisora e executora de políticas monetárias dentro de suas atribuições: executa a política monetária; emite moeda metálica e papel-moeda, nos termos legais; fiscaliza instituições financeiras; regula e supervisiona o sistema financeiro dentro de sua competência; zela pela estabilidade e eficiência do sistema; administra as reservas internacionais.
Pegadinha: o CMN estabelece diretrizes gerais; o Banco Central executa políticas e supervisiona instituições dentro de suas atribuições.

CVM — COMISSÃO DE VALORES MOBILIÁRIOS
Fiscaliza e desenvolve o mercado de valores mobiliários: ações, debêntures, fundos de investimento em valores mobiliários, mercado de capitais. Ex.: empresa que abre o capital e negocia ações na bolsa — a CVM tem papel importante na regulação e fiscalização desse mercado.

BANCOS COMERCIAIS
Captam depósitos e concedem crédito. Serviços: conta corrente, depósitos, empréstimos, financiamentos, pagamentos, transferências, cartões. Ex.: o cliente recebe o salário em conta e usa o banco para pagar contas e transferir.

BANCOS DE INVESTIMENTO
Voltados principalmente a operações de investimento e financiamento de médio e longo prazo, além de outras atividades autorizadas: financiamento de projetos, operações no mercado de capitais, estruturação de operações financeiras, participação em ofertas de valores mobiliários conforme a regulamentação.

COOPERATIVAS DE CRÉDITO
Instituições financeiras constituídas como sociedades cooperativas, para prestar serviços financeiros aos seus associados. Os clientes são associados e participam conforme as regras aplicáveis; podem oferecer conta, crédito e outros serviços; têm características diferentes de um banco comercial tradicional.

CMN × BANCO CENTRAL × CVM
CMN: estabelece diretrizes gerais. Banco Central: executa políticas e supervisiona instituições sob sua competência. CVM: fiscaliza o mercado de valores mobiliários. Memorize essa diferença — é uma das formas mais comuns de cobrança em questões introdutórias.$$
  from d returning id
),
b_banc_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Conhecimentos Bancários', 'exercicios', 'Fixação — Sistema Financeiro Nacional (Q1 a Q4)', 15 from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 26 (12 questões)', 12,
    $$Sem consultar a teoria. 12 questões misturando crase, regra de três, princípios da Administração (LIMPE/concurso) e Sistema Financeiro Nacional.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Caderno de erros, revisão programada e checklist do Dia 26', 8, $$CADERNO DE ERROS
Não basta saber a resposta certa: entenda por que errou. Marque o que precisa revisar: crase (identificação da preposição e do artigo feminino; locuções femininas e horas); regra de três direta e inversa; razão e proporção; LIMPE; concurso público (validade e prorrogação); diferenças entre CMN, Banco Central e CVM. Os erros nas questões de hoje entram automaticamente no caderno do app.

REVISÃO PROGRAMADA
Amanhã: revise as regras de crase e refaça 4 questões. Em 7 dias: resolva 10 questões de regra de três e LIMPE. Em 15 dias: revise CMN, Banco Central e CVM. Em 30 dias: revisão geral do Dia 26.

ORIENTAÇÃO FINAL
Não avance só para cumprir o calendário: o objetivo é aprender e conseguir resolver questões sem consultar o material. Se tiver dificuldade em crase ou regra de três, reserve mais alguns minutos para esses assuntos antes de encerrar o estudo.
Marque este bloco como concluído para fechar o Dia 26.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a alternativa em que o emprego da crase está correto.',
   '{"A":"Começou à estudar cedo.","B":"Entregou o relatório à diretora.","C":"Fui à pé até o trabalho.","D":"Entregou o documento à ela."}'::jsonb,
   'B', '"À diretora" tem preposição + artigo feminino. As demais erram: antes de verbo, "a pé" e antes de pronome pessoal não há crase.'),
  ((select id from b_port_ex), 2, 'Português',
   'Complete corretamente: "O funcionário chegou ___ agência ___ oito horas."',
   '{"A":"a – as","B":"à – às","C":"à – as","D":"a – às"}'::jsonb,
   'B', '"Chegou à agência" (a + a) e "às oito horas" (hora determinada, feminino plural).'),
  ((select id from b_port_ex), 3, 'Português',
   'Assinale a frase em que NÃO deve ocorrer crase.',
   '{"A":"Dirigiu-se à sala.","B":"Voltou à cidade.","C":"Começou a trabalhar.","D":"Chegou à reunião."}'::jsonb,
   'C', 'Antes de verbo ("a trabalhar") não há crase. As demais têm preposição + artigo feminino.'),
  ((select id from b_port_ex), 4, 'Português',
   'Em qual alternativa a crase foi empregada corretamente?',
   '{"A":"Refiro-me àquele candidato.","B":"Fui à comprar material.","C":"Entreguei o formulário à você.","D":"O pagamento será feito à prazo."}'::jsonb,
   'A', '"Àquele" = preposição "a" + "aquele". As demais erram: antes de verbo, antes de pronome pessoal e antes de palavra masculina.'),

  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Se 4 canetas custam R$ 20, quanto custarão 7 canetas iguais?',
   '{"A":"R$ 25","B":"R$ 30","C":"R$ 35","D":"R$ 40"}'::jsonb,
   'C', 'Preço unitário: 20/4 = 5. Para 7 canetas: 7 × 5 = 35.'),
  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Se 6 funcionários fazem um serviço em 10 dias, quantos dias 12 funcionários levarão, no mesmo ritmo?',
   '{"A":"3 dias","B":"5 dias","C":"10 dias","D":"20 dias"}'::jsonb,
   'B', 'Regra de três inversa: 6 × 10 = 12 × x → x = 5.'),
  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'A razão entre 15 e 25, na forma simplificada, é:',
   '{"A":"2/3","B":"3/5","C":"5/3","D":"1/2"}'::jsonb,
   'B', '15/25 simplifica dividindo por 5: 3/5.'),
  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Uma máquina produz 120 peças em 4 horas. Mantendo o mesmo ritmo, quantas peças produzirá em 7 horas?',
   '{"A":"180","B":"200","C":"210","D":"240"}'::jsonb,
   'C', 'Produção por hora: 120/4 = 30. Em 7 horas: 7 × 30 = 210.'),

  ((select id from b_const_ex), 1, 'Constitucional',
   'A sigla LIMPE representa quais princípios da Administração Pública?',
   '{"A":"Legalidade, Igualdade, Moralidade, Publicidade e Eficiência.","B":"Legalidade, Impessoalidade, Moralidade, Publicidade e Eficiência.","C":"Liberdade, Impessoalidade, Moralidade, Publicidade e Economia.","D":"Legalidade, Impessoalidade, Modernidade, Publicidade e Eficiência."}'::jsonb,
   'B', 'LIMPE: legalidade, impessoalidade, moralidade, publicidade e eficiência.'),
  ((select id from b_const_ex), 2, 'Constitucional',
   'O princípio que impede favorecimentos pessoais na Administração Pública é:',
   '{"A":"Eficiência.","B":"Publicidade.","C":"Impessoalidade.","D":"Legalidade."}'::jsonb,
   'C', 'Impessoalidade veda favorecimento ou perseguição pessoal.'),
  ((select id from b_const_ex), 3, 'Constitucional',
   'Conforme a Constituição Federal, o prazo de validade de um concurso público será de até:',
   '{"A":"Um ano, sem possibilidade de prorrogação.","B":"Dois anos, prorrogável uma vez por igual período.","C":"Três anos, prorrogável duas vezes.","D":"Cinco anos, sem possibilidade de prorrogação."}'::jsonb,
   'B', 'Art. 37, III: até dois anos, prorrogável uma vez por igual período.'),
  ((select id from b_const_ex), 4, 'Constitucional',
   'A Administração Pública deve buscar qualidade, produtividade e bons resultados. Essa afirmação está relacionada ao princípio da:',
   '{"A":"Moralidade.","B":"Publicidade.","C":"Impessoalidade.","D":"Eficiência."}'::jsonb,
   'D', 'Eficiência: qualidade, produtividade e bom uso dos recursos.'),

  ((select id from b_banc_ex), 1, 'Conhecimentos Bancários',
   'O órgão normativo superior do Sistema Financeiro Nacional é:',
   '{"A":"Banco Central.","B":"Comissão de Valores Mobiliários.","C":"Conselho Monetário Nacional.","D":"Banco do Brasil."}'::jsonb,
   'C', 'O CMN é o órgão normativo superior do SFN.'),
  ((select id from b_banc_ex), 2, 'Conhecimentos Bancários',
   'Uma das principais atribuições do Banco Central é:',
   '{"A":"Fiscalizar instituições financeiras dentro de sua competência.","B":"Elaborar leis federais.","C":"Administrar diretamente todas as contas bancárias.","D":"Definir o orçamento de todos os bancos privados."}'::jsonb,
   'A', 'O Banco Central fiscaliza e supervisiona instituições financeiras dentro de sua competência.'),
  ((select id from b_banc_ex), 3, 'Conhecimentos Bancários',
   'A instituição responsável pela fiscalização do mercado de valores mobiliários é:',
   '{"A":"CMN.","B":"CVM.","C":"INSS.","D":"Caixa Econômica Federal."}'::jsonb,
   'B', 'A CVM fiscaliza o mercado de valores mobiliários.'),
  ((select id from b_banc_ex), 4, 'Conhecimentos Bancários',
   'As cooperativas de crédito caracterizam-se principalmente por:',
   '{"A":"Serem órgãos do Poder Judiciário.","B":"Prestarem serviços financeiros aos seus associados.","C":"Não poderem conceder crédito.","D":"Serem responsáveis pela emissão de moeda."}'::jsonb,
   'B', 'Cooperativas de crédito prestam serviços financeiros aos associados.'),

  ((select id from b_simulado), 1, 'Português',
   'Assinale a alternativa em que a crase está empregada corretamente.',
   '{"A":"Começou à estudar.","B":"Entregou o documento à funcionária.","C":"Foi à pé ao trabalho.","D":"Entregou a carta à ela."}'::jsonb,
   'B', '"À funcionária": preposição + artigo feminino.'),
  ((select id from b_simulado), 2, 'Português',
   'Complete: "O atendimento ocorrerá ___ tarde, das 13h ___ 17h."',
   '{"A":"a – as","B":"à – às","C":"à – as","D":"a – às"}'::jsonb,
   'B', '"À tarde" é locução adverbial feminina; "das 13h às 17h" indica horas determinadas.'),
  ((select id from b_simulado), 3, 'Português',
   'Assinale a frase correta.',
   '{"A":"Vou à comprar pão.","B":"Refiro-me àquela decisão.","C":"Entreguei o papel à você.","D":"O pagamento será à prazo."}'::jsonb,
   'B', '"Àquela" = preposição + "aquela". As demais erram: antes de verbo, antes de pronome pessoal e antes de palavra masculina.'),
  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Se 5 cadernos custam R$ 35, quanto custam 8 cadernos iguais?',
   '{"A":"R$ 49","B":"R$ 52","C":"R$ 56","D":"R$ 60"}'::jsonb,
   'C', 'Preço unitário: 35/5 = 7. Para 8 cadernos: 8 × 7 = 56.'),
  ((select id from b_simulado), 5, 'Matemática/RLM',
   'Oito funcionários realizam um serviço em 15 dias. Mantido o ritmo, 12 funcionários levarão:',
   '{"A":"8 dias","B":"10 dias","C":"12 dias","D":"20 dias"}'::jsonb,
   'B', 'Regra de três inversa: 8 × 15 = 12 × x → x = 10.'),
  ((select id from b_simulado), 6, 'Matemática/RLM',
   'A razão entre 18 e 30, simplificada, é:',
   '{"A":"2/3","B":"3/2","C":"3/5","D":"5/3"}'::jsonb,
   'C', '18/30 simplifica dividindo por 6: 3/5.'),
  ((select id from b_simulado), 7, 'Constitucional',
   'Qual princípio impede que um agente público favoreça um amigo no atendimento?',
   '{"A":"Publicidade","B":"Eficiência","C":"Impessoalidade","D":"Moralidade apenas"}'::jsonb,
   'C', 'Favorecer um amigo viola a impessoalidade.'),
  ((select id from b_simulado), 8, 'Constitucional',
   'A sigla LIMPE corresponde aos princípios:',
   '{"A":"Legalidade, Impessoalidade, Moralidade, Publicidade e Eficiência.","B":"Legalidade, Igualdade, Moralidade, Publicidade e Economia.","C":"Liberdade, Impessoalidade, Moralidade, Probidade e Eficiência.","D":"Legalidade, Impessoalidade, Modernidade, Publicidade e Eficiência."}'::jsonb,
   'A', 'É a literalidade do caput do art. 37.'),
  ((select id from b_simulado), 9, 'Constitucional',
   'O concurso público tem validade de até:',
   '{"A":"Um ano, sem prorrogação.","B":"Dois anos, prorrogável uma vez por igual período.","C":"Três anos, prorrogável duas vezes.","D":"Quatro anos, sem prorrogação."}'::jsonb,
   'B', 'Até dois anos, prorrogável uma vez por igual período.'),
  ((select id from b_simulado), 10, 'Conhecimentos Bancários',
   'O órgão normativo superior do SFN é:',
   '{"A":"Banco Central","B":"CVM","C":"CMN","D":"Banco do Brasil"}'::jsonb,
   'C', 'O CMN é o órgão normativo superior.'),
  ((select id from b_simulado), 11, 'Conhecimentos Bancários',
   'A fiscalização do mercado de valores mobiliários está principalmente associada à:',
   '{"A":"CVM","B":"CMN","C":"INSS","D":"PREVIC"}'::jsonb,
   'A', 'A CVM fiscaliza o mercado de valores mobiliários.'),
  ((select id from b_simulado), 12, 'Conhecimentos Bancários',
   'Uma atribuição do Banco Central é:',
   '{"A":"Julgar ações judiciais.","B":"Fiscalizar instituições financeiras em sua competência.","C":"Criar leis penais.","D":"Administrar todas as empresas privadas."}'::jsonb,
   'B', 'O Banco Central fiscaliza instituições financeiras dentro de sua competência.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
