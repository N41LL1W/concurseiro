-- Cadastra o Dia 24. Carga: 4h20 (45+50+50+45+50+20), conforme o cronograma do dia.
delete from days where week = 5 and day_number = 5;

with d as (
  insert into days (week, day_number, title)
  values (5, 5, 'Coesão e coerência textual + porcentagem + atos administrativos + Sistema Financeiro Nacional')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Coesão e coerência textual: referenciação, conectivos e contradição', 30, $$As bancas cobram a relação entre frases, parágrafos, conectivos e a organização das ideias.

COESÃO TEXTUAL
É a ligação entre palavras, frases e parágrafos — organiza o texto, evita repetições desnecessárias e facilita a leitura.
Sem coesão: "Maria foi ao banco. Maria precisava pagar uma conta. Maria encontrou uma fila." Com coesão: "Maria foi ao banco, pois precisava pagar uma conta. Ao chegar, encontrou uma fila."

COERÊNCIA TEXTUAL
É a lógica e o sentido do texto — as ideias fazem sentido entre si. Coerente: "João estava com muito frio. Por isso, colocou um casaco." Incoerente: "João estava com muito frio. Por isso, colocou o ventilador no máximo." (sem explicação adicional, as ideias parecem contraditórias).
Coesão: ligação entre elementos (conectivos, pronomes, substituições) — principalmente linguística. Coerência: lógica e sentido — depende da compatibilidade entre as ideias.
Pegadinha: um texto pode ter conectivos e ainda ser incoerente. Ex.: "Estava chovendo muito, portanto o chão permaneceu completamente seco." O conectivo está lá, mas a relação lógica é inadequada.

COESÃO REFERENCIAL
Anáfora: a expressão retoma algo já mencionado. Ex.: "Pedro comprou um computador. Ele precisava estudar." ("ele" retoma Pedro). "A instituição anunciou novas medidas. Essas medidas serão aplicadas no próximo mês." ("essas medidas" retoma "novas medidas").
Catáfora: a expressão antecipa uma informação que virá depois. Ex.: "Isto é fundamental: estudar com regularidade." ("isto" antecipa "estudar com regularidade").
Dica: anáfora retoma; catáfora antecipa.

SUBSTITUIÇÃO E REPETIÇÃO
"O banco anunciou uma nova plataforma. A instituição pretende ampliar o atendimento digital." — "a instituição" substitui "o banco". A repetição nem sempre é erro: pode enfatizar uma ideia ou garantir clareza.

ELIPSE
Omissão de um termo identificável pelo contexto. Ex.: "Ana gosta de Português; Pedro, de Matemática." (o verbo "gosta" foi omitido na segunda oração).

CONECTIVOS E RELAÇÕES
Adição: além disso, também, ainda. Oposição: mas, porém, entretanto. Causa: porque, visto que, já que. Consequência: portanto, por isso, assim. Concessão: embora, ainda que, apesar de. Condição: se, caso, desde que. Finalidade: para que, a fim de que. Explicação: pois, porque, isto é. Comparação: como, tal qual, assim como.
Exemplos: adição — "O candidato estudou Português. Além disso, revisou Matemática." Oposição — "O sistema é moderno, mas apresenta algumas limitações." Concessão — "Embora estivesse cansado, o candidato continuou estudando." (a circunstância poderia dificultar a ação, mas não a impediu). Conclusão — "O candidato revisou os conteúdos; portanto, estava mais preparado."

COERÊNCIA E CONTRADIÇÃO
Frases gramaticalmente corretas podem ter problema de sentido. "Todos os candidatos foram aprovados, mas nenhum candidato obteve aprovação." — contradição. "O atendimento foi rápido, demorando apenas cinco horas para concluir uma operação simples." — pode ser incoerente conforme o contexto, pois "rápido" contrasta com o tempo informado.

PEGADINHAS FREQUENTES
1) A troca de um conectivo altera o sentido. 2) Um pronome pode ter mais de um referente possível. 3) Coesão e coerência não são sinônimos. 4) Um texto pode ser gramaticalmente correto e semanticamente incoerente. 5) A repetição de palavras nem sempre é erro.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — coesão e coerência (Q1 a Q4)', 15 from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Porcentagem: aumentos, descontos, sucessivos, variação, valor original e juros simples', 35, $$O QUE É PORCENTAGEM
Quantidade em relação a 100. 25% = 25/100 = 0,25; 60% = 0,60; 150% = 1,5. Pode ser maior que 100%.

CALCULANDO
p% de V = (p/100) × V. Ex.: 20% de 300 = 0,2 × 300 = 60. Atalhos: 10% de 300 = 300÷10 = 30; 20% = 2 × 30 = 60; 5% = 10% ÷ 2 = 15.
Memorize: 10% = 1/10 = 0,10. 20% = 1/5 = 0,20. 25% = 1/4 = 0,25. 50% = 1/2 = 0,50. 75% = 3/4 = 0,75. 100% = 1. 150% = 3/2 = 1,50.

AUMENTO PERCENTUAL
Multiplique o valor por 1 + p/100. Ex.: R$ 200 com aumento de 15% → 200 × 1,15 = 230. Por quê 1,15? O valor original é 100%; com aumento de 15% passa a 115% = 1,15.

DESCONTO PERCENTUAL
Multiplique por 1 − p/100. Ex.: R$ 400 com desconto de 25% → 400 × 0,75 = 300. O desconto foi 400 × 0,25 = R$ 100.

AUMENTOS E DESCONTOS SUCESSIVOS
Um dos assuntos que mais geram erro. R$ 100 aumenta 20% e depois recebe desconto de 20%: 100 × 1,20 = 120; 120 × 0,80 = 96. O resultado não volta a R$ 100 — houve redução total de 4%.
Regra fundamental: percentuais sucessivos incidem sobre o valor ATUALIZADO, não sempre sobre o inicial.

VARIAÇÃO PERCENTUAL
Variação % = (valor final − valor inicial) / valor inicial × 100. Ex.: conta de R$ 80 para R$ 100 → (100−80)/80 × 100 = 25% de aumento.

DESCOBRINDO O VALOR ORIGINAL
Após desconto de 20%, o produto custa R$ 160. O preço final é 100% − 20% = 80% do original → 0,8x = 160 → x = 200.
Pegadinha: não basta acrescentar 20% a R$ 160 — o desconto foi calculado sobre o preço original.

JUROS SIMPLES
Incidem sempre sobre o capital inicial: J = C × i × t. Ex.: R$ 1.000 a 2% ao mês por 3 meses → J = 1000 × 0,02 × 3 = 60. Montante M = C + J = 1060.

PEGADINHAS
20% de 100 é 20, mas 20% de 200 é 40. Aumentar 10% e depois diminuir 10% não volta ao valor inicial. O percentual de aumento usa o valor inicial como base. Desconto sucessivo incide sobre o preço atualizado. Para achar o valor original após desconto, divida pelo percentual restante em decimal.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — porcentagem (Q1 a Q4)', 15 from d returning id
),
b_adm_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Administrativo', 'teoria', 'Atos administrativos: elementos, competência, motivo × motivação, atributos, anulação/revogação/convalidação', 35, $$O QUE É ATO ADMINISTRATIVO
Manifestação unilateral da Administração Pública (ou de quem exerça função administrativa), destinada a produzir efeitos jurídicos, sob regime de direito público e sujeita a controle jurídico. Ex.: concessão de licença, multa administrativa, nomeação de servidor, autorização de uso de bem público.
Não confunda: ato administrativo é manifestação de vontade com efeitos jurídicos; fato administrativo é ocorrência ou atividade material da Administração. Ex.: decidir construir uma escola envolve atos; a execução material da obra é atividade administrativa.

ELEMENTOS (requisitos)
Competência, Finalidade, Forma, Motivo, Objeto — a sigla ajuda, mas o importante é compreender cada elemento.
Competência: poder legal atribuído ao agente/órgão para praticar o ato. Finalidade: objetivo público a alcançar (uma multa não pode servir de perseguição pessoal). Forma: modo de exteriorização (por escrito, se a lei exigir). Motivo: pressuposto de fato e de direito (a infração e a norma que prevê a penalidade). Objeto: conteúdo ou efeito jurídico imediato (aplicar multa, conceder licença).

COMPETÊNCIA
Decorre da lei, é irrenunciável, deve ser exercida pelo agente competente e pode admitir delegação ou avocação nos casos permitidos.
Delegação: transferência do EXERCÍCIO de uma competência a outro agente/órgão, conforme as regras legais — não é necessariamente transferência definitiva da titularidade.
Avocação: autoridade superior chama para si, temporariamente, o exercício de competência de órgão/agente subordinado — excepcional, com requisitos legais. Atenção: nem toda competência pode ser delegada ou avocada.

FINALIDADE
Todo ato deve buscar a finalidade pública prevista no ordenamento. Usar a competência para fim diferente do previsto em lei pode ser desvio de finalidade. Ex.: transferir um servidor para puni-lo informalmente por desavença pessoal.

FORMA
Maneira de exteriorização; a Administração deve observar as formalidades legais. A ausência de formalidade essencial pode comprometer a validade — mas nem toda irregularidade formal gera nulidade; é preciso ver a natureza do vício.

MOTIVO × MOTIVAÇÃO
Motivo: pressuposto de fato e de direito que justifica o ato. Motivação: exposição dos fundamentos que levaram à prática do ato. Ex.: motivo — a infração; motivação — o documento ou decisão que explica a infração identificada e a norma aplicada.

TEORIA DOS MOTIVOS DETERMINANTES
Quando a Administração declara os motivos do ato, sua validade fica vinculada à existência e veracidade desses motivos. Ex.: remoção justificada por "reorganização administrativa"; se o motivo declarado era falso e a finalidade indevida, a validade pode ser questionada.

OBJETO
Efeito jurídico produzido. Para ser válido: lícito, possível, determinado ou determinável e compatível com o ordenamento. Ex.: não se concede licença para atividade expressamente proibida em lei.

ATRIBUTOS
Presunção de legitimidade e veracidade: atos presumidos legítimos e fatos declarados presumidos verdadeiros até prova em contrário — presunção RELATIVA.
Imperatividade: a Administração impõe obrigações unilateralmente quando o ato e o ordenamento permitirem (ex.: multa). Nem todo ato tem imperatividade.
Autoexecutoriedade: execução direta, sem autorização judicial prévia, quando houver fundamento jurídico (previsão legal ou urgência reconhecida). Não está em todos os atos. Pegadinha: não significa executar qualquer decisão de qualquer maneira.
Tipicidade: o ato deve corresponder a figura prevista ou admitida pelo ordenamento — impede que o agente crie atos incompatíveis com a lei.

ANULAÇÃO × REVOGAÇÃO
Anulação: por ilegalidade; feita pela Administração e pelo Judiciário (este, se provocado); atua sobre ato ilegal; em regra, efeitos retroativos (ex tunc), observadas as regras aplicáveis. Ex.: licença concedida por autoridade sem competência, vício não convalidável.
Revogação: por conveniência e oportunidade; feita pela própria Administração; atua sobre ato válido; em regra, efeitos futuros (ex nunc). Ex.: autorização de uso de espaço público válida, revogada por nova necessidade pública, respeitados direitos e limites. O Judiciário, em regra, não revoga por conveniência e oportunidade — controla a legalidade.
Convalidação: saneamento de certos vícios, quando sanáveis (especialmente competência não exclusiva e forma não essencial), sem lesão ao interesse público nem prejuízo a terceiros.
Resumo: ato ilegal pode ser anulado; ato válido pode ser revogado; vícios sanáveis podem ser convalidados.$$
  from d returning id
),
b_adm_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Administrativo', 'exercicios', 'Fixação — atos administrativos (Q1 a Q4)', 15 from d returning id
),
b_banc_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Conhecimentos Bancários', 'teoria', 'SFN: estrutura, CMN, Banco Central, CVM, CNSP/Susep, instituições, CAIXA e Banco do Brasil', 30, $$O QUE É O SFN
Conjunto de instituições, órgãos e entidades responsáveis pela organização e funcionamento das atividades financeiras no Brasil. Funções: facilitar a circulação de recursos, viabilizar crédito, permitir pagamentos e transferências, promover a intermediação financeira e contribuir para o funcionamento da economia. Ex.: ao depositar dinheiro, o banco pode usar os recursos captados para operações de crédito, respeitadas as regras legais e prudenciais — isso é intermediação financeira.

ESTRUTURA SIMPLIFICADA
Órgãos normativos: estabelecem diretrizes e normas gerais. Entidades supervisoras: fiscalizam e supervisionam instituições e atividades. Instituições operadoras: realizam operações e prestam serviços financeiros.

CMN — CONSELHO MONETÁRIO NACIONAL
Principal órgão normativo do SFN; estabelece diretrizes gerais para o sistema financeiro e para a política monetária, creditícia e cambial, nos termos da lei. É órgão normativo, não atua como banco comercial, não faz atendimento bancário e não deve ser confundido com o Banco Central.
Pegadinha: afirmar que o CMN executa diretamente todas as operações bancárias está errado.

BANCO CENTRAL DO BRASIL
Entidade supervisora e executora: executa a política monetária conforme as diretrizes; supervisiona instituições financeiras; emite moeda (competência legal); atua pela estabilidade e funcionamento do sistema; administra reservas internacionais; exerce funções ligadas ao sistema de pagamentos.
CMN × Banco Central: CMN = órgão normativo, diretrizes gerais, não é banco comercial. Banco Central = supervisora e executora, executa políticas e supervisiona instituições, não é banco comercial comum. Memorização: CMN estabelece diretrizes; Banco Central executa e supervisiona.

CVM — COMISSÃO DE VALORES MOBILIÁRIOS
Regula e fiscaliza o mercado de valores mobiliários: ações, fundos de investimento sujeitos à sua competência, companhias abertas, intermediários e participantes do mercado. Busca proteger investidores e promover o funcionamento adequado do mercado.
Pegadinha: a CVM não supervisiona todas as operações bancárias — atua no mercado de valores mobiliários.

CNSP × SUSEP
CNSP: órgão normativo de seguros privados, previdência complementar aberta e capitalização. SUSEP: supervisiona e fiscaliza esses mercados. CNSP estabelece diretrizes e normas; SUSEP supervisiona e fiscaliza.

INSTITUIÇÕES FINANCEIRAS
Bancos comerciais: captam depósitos à vista e concedem crédito, além de outros serviços. Bancos múltiplos: atuam em diferentes segmentos, conforme sua estrutura autorizada. Cooperativas de crédito: organizadas sob forma cooperativa, oferecem serviços aos associados, conforme a regulamentação. Também: bancos de investimento e instituições de pagamento, conforme enquadramento e competências.

CAIXA E BANCO DO BRASIL
CAIXA Econômica Federal: empresa pública federal, instituição financeira, atua em diversas áreas bancárias, com papel relevante em programas sociais e políticas públicas. Banco do Brasil: sociedade de economia mista, instituição financeira, com participação da União no capital, atua comercialmente e também em funções ligadas a políticas públicas.
CAIXA: empresa pública, capital integralmente público conforme sua natureza jurídica. Banco do Brasil: sociedade de economia mista, capital público e privado. Essa diferença é muito cobrada em Direito Administrativo e em Conhecimentos Bancários.

RESUMO
CMN: diretrizes gerais do SFN. Banco Central: executa políticas e supervisiona instituições financeiras. CVM: regula e fiscaliza o mercado de valores mobiliários. CNSP: diretrizes do setor de seguros privados. SUSEP: supervisiona seguros privados e segmentos relacionados.$$
  from d returning id
),
b_banc_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Conhecimentos Bancários', 'exercicios', 'Fixação — Sistema Financeiro Nacional (Q1 a Q4)', 15 from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 24 (12 questões)', 50,
    $$Sem consulta. 12 questões misturando coesão/coerência, porcentagem, atos administrativos e Sistema Financeiro Nacional.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Caderno de erros, pegadinhas e revisão programada', 20, $$CADERNO DE ERROS
Registre principalmente erros em: Português — coesão referencial, anáfora, catáfora e conectivos; Matemática — aumentos e descontos sucessivos; Administrativo — elementos e atributos dos atos, e a diferença entre anulação e revogação; Bancários — CMN, Banco Central, CVM e SUSEP. Os erros nas questões de hoje entram automaticamente no caderno do app.

RESUMO DAS PEGADINHAS
Português: coesão é ligação, coerência é lógica; anáfora retoma, catáfora antecipa; "embora" indica concessão; "portanto" indica conclusão.
Matemática: 20% de aumento seguido de 20% de desconto não volta ao valor inicial; o desconto incide sobre o preço atualizado; para recuperar o preço original, divida pelo percentual restante.
Administrativo: competência é o poder legal para praticar o ato; finalidade é o objetivo público; anulação decorre de ilegalidade; revogação decorre de conveniência e oportunidade; a presunção de legitimidade é relativa.
Bancários: CMN é órgão normativo; Banco Central supervisiona e executa; CVM atua no mercado de valores mobiliários; SUSEP supervisiona seguros privados e segmentos relacionados; CAIXA é empresa pública federal; Banco do Brasil é sociedade de economia mista.

REVISÃO PROGRAMADA
Amanhã: revise conectivos, porcentagem e a diferença entre anulação e revogação. Em 7 dias: refaça os exercícios errados e explique os conceitos sem consultar. Em 30 dias: revisão geral e simulado misturando os Dias 23 e 24.
Marque este bloco como concluído para fechar o Dia 24 e a Semana 5.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_port_ex), 1, 'Português',
   'Na frase "Carlos comprou um livro. Ele pretende utilizá-lo nos estudos", o pronome "ele" retoma:',
   '{"A":"Livro.","B":"Estudos.","C":"Carlos.","D":"Utilizá-lo."}'::jsonb,
   'C', 'É anáfora: "ele" retoma "Carlos", quem pretende usar o livro. O "-lo" é que retoma "livro".'),
  ((select id from b_port_ex), 2, 'Português',
   'A palavra "portanto" estabelece, normalmente, uma relação de:',
   '{"A":"Oposição.","B":"Conclusão.","C":"Condição.","D":"Concessão."}'::jsonb,
   'B', '"Portanto" introduz conclusão.'),
  ((select id from b_port_ex), 3, 'Português',
   'A frase "Embora estivesse cansado, continuou estudando" apresenta relação de:',
   '{"A":"Adição.","B":"Conclusão.","C":"Concessão.","D":"Finalidade."}'::jsonb,
   'C', '"Embora" introduz concessão: o cansaço poderia dificultar, mas não impediu.'),
  ((select id from b_port_ex), 4, 'Português',
   'Assinale a alternativa que apresenta uma relação lógica de oposição:',
   '{"A":"Estudou bastante, portanto foi aprovado.","B":"Estudou bastante, mas não foi aprovado.","C":"Estudou bastante para que fosse aprovado.","D":"Estudou bastante porque precisava."}'::jsonb,
   'B', '"Mas" contrapõe o muito estudo à falta de aprovação. As demais indicam conclusão, finalidade e causa.'),

  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Quanto é 15% de 400?',
   '{"A":"40","B":"50","C":"60","D":"80"}'::jsonb,
   'C', '400 × 0,15 = 60.'),
  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Um produto custa R$ 250 e recebe desconto de 20%. Qual é o preço final?',
   '{"A":"R$ 200","B":"R$ 210","C":"R$ 225","D":"R$ 230"}'::jsonb,
   'A', '250 × 0,80 = 200.'),
  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Um valor de R$ 100 sofre aumento de 10% e depois desconto de 10%. O valor final será:',
   '{"A":"R$ 100","B":"R$ 99","C":"R$ 90","D":"R$ 110"}'::jsonb,
   'B', '100 × 1,10 × 0,90 = 99.'),
  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Após desconto de 25%, um produto custa R$ 300. Qual era o preço original?',
   '{"A":"R$ 350","B":"R$ 375","C":"R$ 400","D":"R$ 450"}'::jsonb,
   'C', 'O preço final é 75% do original: 0,75x = 300 → x = 400.'),

  ((select id from b_adm_ex), 1, 'Administrativo',
   'O elemento do ato administrativo que corresponde ao objetivo público a ser alcançado é:',
   '{"A":"Competência.","B":"Forma.","C":"Finalidade.","D":"Objeto."}'::jsonb,
   'C', 'Finalidade é o objetivo público que a Administração deve alcançar.'),
  ((select id from b_adm_ex), 2, 'Administrativo',
   'A retirada de um ato administrativo ilegal denomina-se:',
   '{"A":"Revogação.","B":"Anulação.","C":"Delegação.","D":"Avocação."}'::jsonb,
   'B', 'Ato ilegal → anulação.'),
  ((select id from b_adm_ex), 3, 'Administrativo',
   'A retirada de um ato válido por razões de conveniência e oportunidade caracteriza:',
   '{"A":"Anulação.","B":"Convalidação.","C":"Revogação.","D":"Delegação."}'::jsonb,
   'C', 'Ato válido que deixou de ser conveniente/oportuno → revogação.'),
  ((select id from b_adm_ex), 4, 'Administrativo',
   'A presunção de legitimidade dos atos administrativos é:',
   '{"A":"Absoluta, sem possibilidade de contestação.","B":"Relativa, admitindo prova em contrário.","C":"Inexistente em todos os atos.","D":"Aplicável apenas aos atos judiciais."}'::jsonb,
   'B', 'A presunção é relativa — admite prova em contrário.'),

  ((select id from b_banc_ex), 1, 'Conhecimentos Bancários',
   'O principal órgão normativo do Sistema Financeiro Nacional é:',
   '{"A":"Banco Central.","B":"CVM.","C":"Conselho Monetário Nacional.","D":"CAIXA Econômica Federal."}'::jsonb,
   'C', 'O CMN é o principal órgão normativo do SFN.'),
  ((select id from b_banc_ex), 2, 'Conhecimentos Bancários',
   'A instituição responsável pela supervisão de instituições financeiras e por importantes funções de execução da política monetária é:',
   '{"A":"Banco Central.","B":"CNSP.","C":"CAIXA.","D":"Câmara dos Deputados."}'::jsonb,
   'A', 'O Banco Central supervisiona instituições financeiras e executa a política monetária.'),
  ((select id from b_banc_ex), 3, 'Conhecimentos Bancários',
   'A CVM está relacionada principalmente à regulação e fiscalização:',
   '{"A":"Do mercado de valores mobiliários.","B":"De todas as operações de crédito consignado.","C":"Da emissão de documentos de identidade.","D":"Exclusivamente das cooperativas de crédito."}'::jsonb,
   'A', 'A CVM atua no mercado de valores mobiliários.'),
  ((select id from b_banc_ex), 4, 'Conhecimentos Bancários',
   'A CAIXA Econômica Federal é:',
   '{"A":"Sociedade de economia mista.","B":"Empresa pública federal.","C":"Autarquia estadual.","D":"Órgão do Poder Judiciário."}'::jsonb,
   'B', 'A CAIXA é empresa pública federal.'),

  ((select id from b_simulado), 1, 'Português',
   'A coesão textual está relacionada principalmente:',
   '{"A":"À ligação entre palavras, frases e parágrafos.","B":"À ausência de qualquer conectivo.","C":"Somente à ortografia.","D":"À quantidade de parágrafos."}'::jsonb,
   'A', 'Coesão é a ligação entre os elementos do texto.'),
  ((select id from b_simulado), 2, 'Português',
   'Na frase "Embora estivesse cansado, continuou trabalhando", o conectivo expressa:',
   '{"A":"Adição.","B":"Conclusão.","C":"Concessão.","D":"Condição."}'::jsonb,
   'C', '"Embora" expressa concessão.'),
  ((select id from b_simulado), 3, 'Português',
   'A palavra "portanto" estabelece relação de:',
   '{"A":"Oposição.","B":"Conclusão.","C":"Comparação.","D":"Condição."}'::jsonb,
   'B', '"Portanto" introduz conclusão.'),
  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Quanto é 30% de 500?',
   '{"A":"100","B":"125","C":"150","D":"200"}'::jsonb,
   'C', '500 × 0,30 = 150.'),
  ((select id from b_simulado), 5, 'Matemática/RLM',
   'Um produto de R$ 200 recebe aumento de 10%. O novo preço é:',
   '{"A":"R$ 210","B":"R$ 220","C":"R$ 230","D":"R$ 240"}'::jsonb,
   'B', '200 × 1,10 = 220.'),
  ((select id from b_simulado), 6, 'Matemática/RLM',
   'Após desconto de 20%, um produto custa R$ 160. O preço original era:',
   '{"A":"R$ 180","B":"R$ 190","C":"R$ 200","D":"R$ 220"}'::jsonb,
   'C', '0,8x = 160 → x = 200.'),
  ((select id from b_simulado), 7, 'Administrativo',
   'O elemento do ato administrativo relacionado ao objetivo público é:',
   '{"A":"Competência.","B":"Forma.","C":"Finalidade.","D":"Objeto."}'::jsonb,
   'C', 'Finalidade é o objetivo público.'),
  ((select id from b_simulado), 8, 'Administrativo',
   'A retirada de um ato ilegal é denominada:',
   '{"A":"Revogação.","B":"Anulação.","C":"Delegação.","D":"Avocação."}'::jsonb,
   'B', 'Ato ilegal → anulação.'),
  ((select id from b_simulado), 9, 'Administrativo',
   'A revogação ocorre, em regra, por:',
   '{"A":"Ilegalidade.","B":"Conveniência e oportunidade.","C":"Ausência absoluta de competência.","D":"Decisão exclusiva do Poder Judiciário."}'::jsonb,
   'B', 'Revogação decorre de conveniência e oportunidade, feita pela própria Administração.'),
  ((select id from b_simulado), 10, 'Conhecimentos Bancários',
   'O principal órgão normativo do SFN é:',
   '{"A":"Banco Central.","B":"CMN.","C":"CVM.","D":"SUSEP."}'::jsonb,
   'B', 'O CMN é o principal órgão normativo.'),
  ((select id from b_simulado), 11, 'Conhecimentos Bancários',
   'A CVM está relacionada principalmente:',
   '{"A":"À fiscalização do mercado de valores mobiliários.","B":"À emissão de moeda.","C":"À gestão de benefícios previdenciários do INSS.","D":"À administração de todas as contas bancárias."}'::jsonb,
   'A', 'A CVM fiscaliza o mercado de valores mobiliários.'),
  ((select id from b_simulado), 12, 'Conhecimentos Bancários',
   'A CAIXA Econômica Federal é:',
   '{"A":"Sociedade de economia mista.","B":"Empresa pública federal.","C":"Autarquia municipal.","D":"Empresa privada sem participação estatal."}'::jsonb,
   'B', 'A CAIXA é empresa pública federal.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
