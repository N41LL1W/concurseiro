-- Cadastra o Dia 14 (versão completa e robusta).
delete from days where week = 3 and day_number = 4;

with d as (
  insert into days (week, day_number, title)
  values (3, 4, 'Crase + porcentagem + art. 5º e remédios constitucionais + Excel e planilhas')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Crase: quando usar, quando não usar e o teste do masculino', 30, $$Crase é a fusão de dois sons iguais, representada pelo acento grave (à) — na situação mais comum, a preposição "a" se junta ao artigo feminino "a". Ex.: "vai a + a escola" → "vai à escola". Compare: "Vou à escola." (a+a=à) × "Vou ao mercado." (a+o=ao).

QUANDO USAR CRASE
1) Antes de palavra feminina, com preposição e artigo: "Entreguei o documento à diretora."; "Fui à prefeitura."; "O candidato compareceu à prova."
2) Em expressões femininas: à tarde, à noite, às vezes, às pressas, à direita, à esquerda, à medida que, à disposição. Ex.: "Estudo à noite."; "O servidor saiu às pressas."
3) Na indicação de horas determinadas: "A prova começará às 8 horas."; "A reunião será às 14h30." Mas: "Estudo das 8h às 11h." e "A reunião ocorrerá após as 14h" — aqui, em "após as 14h", não há crase, pois a construção não exige a mesma combinação.
4) Em locuções com palavras femininas: "à medida que os dados chegaram"; "à custa de recursos públicos."

QUANDO NÃO USAR CRASE
1) Antes de palavra masculina: "Pagamento a prazo."; "Caminhar a pé."; "Escrever a lápis."
2) Antes de verbo: "Começou a estudar."; "Voltou a trabalhar."; "Está disposto a colaborar."
3) Antes de pronomes pessoais: "Entreguei o documento a ela."; "Pedi informações a você."
4) Antes de artigo indefinido: "Fui a uma reunião."
5) Antes de palavra feminina usada genericamente, sem artigo: "Não costumo ir a festas." (depende da construção — se o artigo feminino for exigido, a crase pode aparecer).

O TESTE DO MASCULINO (macete)
Troque a palavra feminina por uma masculina equivalente — se aparecer "ao", normalmente há crase no feminino. "Vou à escola" → "Vou ao colégio" (crase confirmada). "Entreguei o documento à diretora" → "ao diretor" (crase confirmada). Já "Comecei a estudar" → "Comecei a trabalhar" (não aparece "ao" — sem crase).

CASOS ESPECIAIS
Nome de cidade que admite artigo: "Vou à Bahia." Nome de cidade sem artigo: "Vou a Brasília." Pronome demonstrativo iniciado por "a": "Refiro-me àquela regra." "A distância" sem especificação (sem crase): "Observou a distância." Distância especificada (com crase): "Ficou à distância de dez metros."
Teste para cidades: "volto da Bahia" (tem artigo → crase possível) × "volto de Brasília" (sem artigo → sem crase).$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — crase (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Porcentagem: cálculo, aumento, desconto e descobrir o percentual', 35, $$Porcentagem significa "por cem": 10% = 0,10; 25% = 0,25; 50% = 0,50 (metade); 100% = 1 (o total); 150% = 1,50 (uma vez e meia o total). Para transformar em decimal, divida por 100.
Memorize: 10%=1/10, 20%=1/5, 25%=1/4, 40%=2/5, 50%=1/2, 75%=3/4.

CALCULANDO UMA PORCENTAGEM
Fórmula: porcentagem = (p/100) × V. Ex.: 20% de 300 = 300 × 0,20 = 60. Atalho mental: 15% de 200 = 10% (20) + 5% (10) = 30.

DESCONTOS
Produto de R$ 400 com desconto de 15%: desconto = 400 × 0,15 = 60; preço final = 400 − 60 = 340. Atalho: 100%−15%=85% → 400×0,85=340.

AUMENTOS
Salário de R$ 2.000 com aumento de 10%: aumento = 2000×0,10=200; novo salário = 2000+200=2200. Atalho: 2000×1,10=2200.
Multiplicadores: aumento de 10%→×1,10; de 20%→×1,20. Desconto de 10%→×0,90; de 20%→×0,80.

DESCOBRINDO QUAL FOI A PORCENTAGEM
Produto que passou de R$ 80 para R$ 100: aumento em reais = 100−80=20; percentual = 20/80 = 0,25 = 25%. Atenção: o percentual é calculado sobre o valor ORIGINAL, não sobre o valor final.

PEGADINHA — AUMENTO SEGUIDO DE DESCONTO
Produto de R$ 100 aumenta 20% e depois diminui 20%: após aumento, 100×1,20=120; após desconto, 120×0,80=96. O preço final é R$ 96, não R$ 100 — os percentuais incidem sobre valores diferentes, então aumentar e depois descontar o mesmo percentual não anula as duas operações.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — porcentagem (Q1 a Q4)', 15
  from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Art. 5º (igualdade, legalidade, pensamento, domicílio, reunião, associação) e remédios constitucionais', 30, $$IGUALDADE PERANTE A LEI
O art. 5º estabelece que todos são iguais perante a lei, sem distinção, garantindo direitos fundamentais: vida, liberdade, igualdade, segurança, propriedade. O Estado não pode tratar pessoas de forma arbitrariamente desigual — mas igualdade não significa tratamento idêntico em toda situação; diferenciações justificadas pela Constituição e pela lei podem ser legítimas.

PRINCÍPIO DA LEGALIDADE
"Ninguém será obrigado a fazer ou deixar de fazer alguma coisa senão em virtude de lei" — obrigações e proibições precisam de fundamento jurídico. Particular: pode fazer tudo que a lei não proíbe. Administração Pública: deve atuar conforme a lei, dentro de suas competências. Não confunda essa regra do art. 5º com a legalidade administrativa do art. 37.

LIBERDADE DE MANIFESTAÇÃO E VEDAÇÃO AO ANONIMATO
Protegida, mas é vedado o anonimato — a pessoa pode expressar opinião, respeitando limites legais, sem usar o anonimato como proteção absoluta contra responsabilidade. Liberdade de expressão não é autorização para praticar qualquer conduta sem consequências.

LIBERDADE DE CONSCIÊNCIA E DE CRENÇA
Protegida, com livre exercício dos cultos religiosos — o Estado deve respeitar a liberdade religiosa e de consciência.

INVIOLABILIDADE DO DOMICÍLIO
A casa é asilo inviolável, mas há exceções: consentimento do morador; flagrante delito; desastre; prestação de socorro; durante o dia, por determinação judicial. Pegadinha: só o mandado judicial exige "durante o dia" — flagrante, desastre e socorro podem justificar entrada a qualquer hora.

SIGILO DAS COMUNICAÇÕES
Protegido (correspondência, telégrafo, dados, telefone), com exceção para comunicações telefônicas: interceptação por ordem judicial, nas hipóteses e forma da lei, para investigação criminal ou instrução processual penal. Atenção: não é qualquer autoridade que pode quebrar qualquer sigilo livremente — exige garantias constitucionais e requisitos legais específicos.

DIREITO DE REUNIÃO
Reunião pacífica, sem armas, em local aberto ao público, independentemente de autorização, desde que não frustre outra reunião já convocada para o mesmo local e haja prévio aviso à autoridade competente. Não se exige autorização, apenas aviso prévio.

DIREITO DE ASSOCIAÇÃO
Plena liberdade de associação para fins lícitos, vedada a de caráter paramilitar. Ninguém pode ser obrigado a se associar ou permanecer associado. Dissolução compulsória ou suspensão de atividades depende de decisão judicial; a dissolução compulsória exige decisão transitada em julgado.

REMÉDIOS CONSTITUCIONAIS
Habeas corpus (HC): protege a liberdade de locomoção contra ilegalidade ou abuso de poder. Habeas data (HD): permite conhecer ou corrigir informações pessoais, nas situações constitucionais previstas. Mandado de segurança (MS): protege direito líquido e certo não amparado por HC ou HD, presentes os requisitos legais. Mandado de injunção (MI): combate a falta de norma regulamentadora que inviabilize direitos e liberdades constitucionais. Ação popular: permite ao cidadão buscar a anulação de atos lesivos a bens e interesses protegidos pela Constituição.
Macete: HC = liberdade de ir e vir. HD = dados pessoais. MS = direito líquido e certo. MI = falta de norma regulamentadora. Ação popular = ato lesivo a bens/interesses protegidos.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — art. 5º e remédios constitucionais (Q1 a Q4)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'Excel: células, fórmulas, funções (SOMA/MÉDIA/SE) e referências relativas/absolutas', 25, $$CONCEITOS FUNDAMENTAIS
Planilha formada por linhas (números: 1, 2, 3...) e colunas (letras: A, B, C...). Célula: encontro de linha e coluna. Endereço: combinação coluna+linha (ex.: A1, C5). Intervalo: conjunto de células (ex.: A1:A5). Pasta de trabalho: arquivo com várias planilhas (abas).
Ex.: B3 = célula da coluna B, linha 3.

FÓRMULAS
Começam com "=". =A1+B1 (soma), =A1*B1 (multiplica), =A1-B1 (subtrai), =A1/B1 (divide). Operadores: + adição, − subtração, * multiplicação, / divisão, ^ potenciação.

FUNÇÕES (considerando A1=10, A2=20, A3=30, A4=40)
=SOMA(A1:A4) → 100. =MÉDIA(A1:A4) → 25. =MÁXIMO(A1:A4) → 40. =MÍNIMO(A1:A4) → 10. =CONT.NÚM(A1:A4) → 4 (conta células com números). Nomes das funções e separador de argumentos podem variar conforme idioma/configuração.

FUNÇÃO SE
Testa uma condição e retorna um resultado se verdadeira, outro se falsa. Ex.: =SE(A1>=7;"Aprovado";"Reprovado") — se A1=8, resultado "Aprovado"; se A1=5, resultado "Reprovado".

REFERÊNCIAS RELATIVAS E ABSOLUTAS
Relativa (A1): ao copiar a fórmula, a referência pode mudar conforme o deslocamento. Absoluta ($A$1): coluna e linha ficam fixas ao copiar. Ex.: =B2*$A$1 — ao copiar para outra linha, B2 pode virar B3, B4..., mas $A$1 permanece fixo.
Macete do "$": $A$1 fixa coluna e linha; A$1 fixa só a linha; $A1 fixa só a coluna.

GRÁFICOS E ORGANIZAÇÃO DE DADOS
Colunas/barras: comparam valores entre categorias. Linhas: mostram mudança ao longo do tempo. Pizza: mostra partes de um total (poucas categorias). Classificação/ordenação: reorganiza dados (menor→maior, A→Z). Filtro: exibe só os registros que atendem a um critério, sem excluir os demais dados.

ATALHOS ÚTEIS
Ctrl+C copiar, Ctrl+V colar, Ctrl+X recortar, Ctrl+Z desfazer, Ctrl+S salvar, Ctrl+P imprimir, Ctrl+F localizar — a disponibilidade pode variar conforme sistema/programa.$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — Excel e planilhas (Q1 a Q4)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 14, misturando conteúdo novo e revisão (Q17 a Q28)', 40,
    $$Sem consulta. 12 questões misturando crase, porcentagem, art. 5º/remédios constitucionais, Excel, e revisão de regência, sistemas de equações, LIMPE, segurança da informação e concordância dos dias anteriores.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Revisão final, caderno de erros e checklist do Dia 14', 20, $$CHECKLIST DO DIA 14
Sei quando usar e quando não usar crase. Consigo calcular porcentagens, aumentos e descontos. Sei identificar os direitos fundamentais do art. 5º. Diferencio habeas corpus, habeas data e mandado de segurança. Sei identificar linhas, colunas, células e intervalos no Excel. Conheço as funções SOMA, MÉDIA, MÁXIMO, MÍNIMO e SE. Lembro o LIMPE da Administração Pública. Sei identificar phishing e outras ameaças de segurança. Marque só os assuntos que você realmente consegue explicar sem consultar o material.

COMO REVISAR NOS PRÓXIMOS DIAS
Amanhã (Dia 15): revisão rápida de crase, porcentagem, art. 5º e funções do Excel, antes dos conteúdos novos.
Daqui a 7 dias: refaça as questões que errou hoje e nos dias anteriores.
Daqui a 30 dias: resolva um simulado misturando os conteúdos estudados, sem consultar o caderno.
(O app já agenda isso sozinho via o caderno de erros — 24h, 7 dias e 30 dias, visíveis no Painel.)

CADERNO DE ERROS
Para cada erro, registre: o assunto (ex.: crase antes de horas); o motivo do erro (não conhecia a regra / confundiu conceitos / conta errada); a regra correta, em uma frase curta. Ex.: "Erro: calculei 15% de desconto sobre o preço final. Correção: o desconto incide sobre o preço original; depois subtraio para achar o preço final." As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app. Marque este bloco como concluído para fechar o Dia 14.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a frase em que a crase está correta.',
   '{"A":"Fui à pé para o trabalho.","B":"Entreguei o formulário à servidora.","C":"Comecei à estudar ontem.","D":"Pedi ajuda à ela."}'::jsonb,
   'B', '"À servidora" tem a fusão correta de preposição + artigo feminino. As demais erram: "a pé" não tem crase, antes de verbo não há crase, e antes de pronome pessoal "ela" não há crase.'),

  ((select id from b_port_ex), 2, 'Português',
   'Complete: "A prova começará ___ 9 horas."',
   '{"A":"as","B":"à","C":"às","D":"a"}'::jsonb,
   'C', 'Indicação de hora determinada, com "horas" no feminino plural: "às 9 horas".'),

  ((select id from b_port_ex), 3, 'Português',
   'Assinale a alternativa em que NÃO deve haver crase.',
   '{"A":"Cheguei à escola cedo.","B":"O atendimento será às 10 horas.","C":"O candidato começou a revisar.","D":"Dirigiu-se à diretora."}'::jsonb,
   'C', 'Antes de verbo ("a revisar") não há crase. As demais têm crase correta (escola, horas determinadas, diretora).'),

  ((select id from b_port_ex), 4, 'Português',
   'Complete: "O servidor encaminhou o pedido ___ diretora."',
   '{"A":"a","B":"à","C":"há","D":"as"}'::jsonb,
   'B', '"Encaminhar a alguém" + artigo feminino "a diretora" = "à diretora".'),

  -- Matemática — fixação (Q1-4)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Quanto é 25% de R$ 800?',
   '{"A":"R$ 100","B":"R$ 150","C":"R$ 200","D":"R$ 250"}'::jsonb,
   'C', '800 × 0,25 = 200.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Um produto custa R$ 200 e recebe desconto de 15%. Qual é o preço final?',
   '{"A":"R$ 160","B":"R$ 170","C":"R$ 175","D":"R$ 185"}'::jsonb,
   'B', '200 × 0,85 = 170.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Um salário de R$ 2.500 aumenta 8%. Qual é o novo salário?',
   '{"A":"R$ 2.600","B":"R$ 2.650","C":"R$ 2.700","D":"R$ 2.800"}'::jsonb,
   'C', '2500 × 1,08 = 2700.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Um produto passou de R$ 50 para R$ 60. Qual foi o aumento percentual?',
   '{"A":"10%","B":"15%","C":"20%","D":"25%"}'::jsonb,
   'C', '(60−50)/50 = 10/50 = 0,20 = 20%.'),

  -- Constitucional — fixação (Q1-4)
  ((select id from b_const_ex), 1, 'Constitucional',
   'Segundo a Constituição, é vedado:',
   '{"A":"O exercício de qualquer religião.","B":"O anonimato na manifestação do pensamento.","C":"O direito de reunião pacífica.","D":"O acesso ao Poder Judiciário."}'::jsonb,
   'B', 'É livre a manifestação do pensamento, mas é vedado o anonimato.'),

  ((select id from b_const_ex), 2, 'Constitucional',
   'A entrada na casa de alguém por determinação judicial pode ocorrer:',
   '{"A":"A qualquer hora, sem restrições.","B":"Somente com autorização do morador.","C":"Durante o dia, observadas as condições constitucionais.","D":"Somente em caso de flagrante delito."}'::jsonb,
   'C', 'O mandado judicial só autoriza entrada durante o dia.'),

  ((select id from b_const_ex), 3, 'Constitucional',
   'Para realizar reunião pacífica em local aberto ao público, a Constituição exige:',
   '{"A":"Autorização judicial em todos os casos.","B":"Autorização prévia do prefeito.","C":"Prévio aviso à autoridade competente, além dos demais requisitos constitucionais.","D":"Filiação a uma associação."}'::jsonb,
   'C', 'Não se exige autorização — exige-se aviso prévio e os demais requisitos (pacífica, sem armas, não frustrar outra reunião).'),

  ((select id from b_const_ex), 4, 'Constitucional',
   'Qual instrumento protege a liberdade de locomoção contra ilegalidade ou abuso de poder?',
   '{"A":"Habeas data.","B":"Ação popular.","C":"Mandado de injunção.","D":"Habeas corpus."}'::jsonb,
   'D', 'Habeas corpus protege a liberdade de ir e vir.'),

  -- Informática — fixação (Q1-4)
  ((select id from b_info_ex), 1, 'Informática',
   'Em uma planilha, o endereço C4 identifica:',
   '{"A":"A coluna 4 e a linha C.","B":"A célula da coluna C e da linha 4.","C":"A quarta planilha da coluna C.","D":"Um intervalo entre C e 4."}'::jsonb,
   'B', 'O endereço combina coluna (letra) + linha (número): C4 = coluna C, linha 4.'),

  ((select id from b_info_ex), 2, 'Informática',
   'Qual função calcula a média dos valores de A1 até A5?',
   '{"A":"=SOMA(A1:A5)","B":"=MÁXIMO(A1:A5)","C":"=MÉDIA(A1:A5)","D":"=CONT.NÚM(A1:A5)"}'::jsonb,
   'C', '=MÉDIA calcula a média aritmética do intervalo.'),

  ((select id from b_info_ex), 3, 'Informática',
   'Na fórmula =SE(A1>=7;"Aprovado";"Reprovado"), se A1 for 6, o resultado será:',
   '{"A":"Aprovado","B":"Reprovado","C":"7","D":"Erro obrigatoriamente"}'::jsonb,
   'B', '6 não é maior ou igual a 7, então a condição é falsa e o resultado é "Reprovado".'),

  ((select id from b_info_ex), 4, 'Informática',
   'Qual referência mantém a coluna e a linha fixas ao copiar uma fórmula?',
   '{"A":"A1","B":"A$1","C":"$A1","D":"$A$1"}'::jsonb,
   'D', '$A$1 fixa coluna e linha simultaneamente.'),

  -- Mini-simulado (Q17-28)
  ((select id from b_simulado), 1, 'Português',
   'Assinale a alternativa em que o uso da crase está correto.',
   '{"A":"O candidato foi à pé.","B":"O servidor começou à trabalhar.","C":"A reunião será às 15 horas.","D":"Entreguei o formulário à ela."}'::jsonb,
   'C', 'Indicação de hora determinada com "horas" no feminino plural — crase correta.'),

  ((select id from b_simulado), 2, 'Matemática/RLM',
   'Um produto de R$ 500 recebeu desconto de 12%. Qual é o preço final?',
   '{"A":"R$ 400","B":"R$ 420","C":"R$ 440","D":"R$ 460"}'::jsonb,
   'C', '500 × 0,88 = 440.'),

  ((select id from b_simulado), 3, 'Constitucional',
   'Qual instrumento constitucional protege a liberdade de locomoção?',
   '{"A":"Mandado de segurança.","B":"Habeas corpus.","C":"Habeas data.","D":"Ação popular."}'::jsonb,
   'B', 'Habeas corpus protege a liberdade de ir e vir.'),

  ((select id from b_simulado), 4, 'Informática',
   'Qual fórmula soma os valores de B1 até B5?',
   '{"A":"=MÉDIA(B1:B5)","B":"=CONT.NÚM(B1:B5)","C":"=SOMA(B1:B5)","D":"=MÁXIMO(B1:B5)"}'::jsonb,
   'C', '=SOMA soma os valores do intervalo.'),

  ((select id from b_simulado), 5, 'Português',
   'Complete corretamente: "O candidato assistiu ___ palestra."',
   '{"A":"a","B":"à","C":"há","D":"na"}'::jsonb,
   'B', '"Assistir" no sentido de ver exige "a", que se funde com o artigo feminino de "palestra": "assistiu à palestra".'),

  ((select id from b_simulado), 6, 'Matemática/RLM',
   'Resolva o sistema: x + y = 14 e x − y = 4.',
   '{"A":"x = 9 e y = 5","B":"x = 5 e y = 9","C":"x = 10 e y = 4","D":"x = 8 e y = 6"}'::jsonb,
   'A', 'Somando as equações: 2x=18 → x=9. Substituindo: y=5.'),

  ((select id from b_simulado), 7, 'Constitucional',
   'Um servidor favorece um amigo em uma decisão administrativa. Qual princípio é especialmente afetado?',
   '{"A":"Publicidade","B":"Eficiência","C":"Impessoalidade","D":"Continuidade"}'::jsonb,
   'C', 'Favorecimento pessoal viola a impessoalidade.'),

  ((select id from b_simulado), 8, 'Informática',
   'Qual é a principal finalidade da função SE em uma planilha?',
   '{"A":"Somar automaticamente todas as células.","B":"Testar uma condição e retornar um resultado conforme ela seja verdadeira ou falsa.","C":"Criar sempre um gráfico.","D":"Bloquear a planilha."}'::jsonb,
   'B', 'A função SE testa uma condição lógica e retorna um resultado para cada caso.'),

  ((select id from b_simulado), 9, 'Matemática/RLM',
   'Um salário de R$ 1.800 recebe aumento de 10%. Qual será o novo valor?',
   '{"A":"R$ 1.880","B":"R$ 1.900","C":"R$ 1.980","D":"R$ 2.000"}'::jsonb,
   'C', '1800 × 1,10 = 1980.'),

  ((select id from b_simulado), 10, 'Constitucional',
   'A entrada em domicílio por determinação judicial, segundo a Constituição, pode ocorrer:',
   '{"A":"A qualquer hora, em qualquer situação.","B":"Durante o dia, observadas as condições constitucionais.","C":"Somente com autorização do morador.","D":"Apenas em caso de desastre."}'::jsonb,
   'B', 'O mandado judicial só autoriza entrada durante o dia.'),

  ((select id from b_simulado), 11, 'Informática',
   'Em segurança da informação, phishing é:',
   '{"A":"Uma técnica de compactação de arquivos.","B":"Uma atualização automática do sistema.","C":"Uma tentativa fraudulenta de obter informações por meio de mensagens ou páginas enganosas.","D":"Um tipo de cópia de segurança."}'::jsonb,
   'C', 'É a definição clássica de phishing.'),

  ((select id from b_simulado), 12, 'Português',
   'Assinale a frase com concordância adequada.',
   '{"A":"Fazem dois anos que estudo.","B":"Houveram muitas inscrições.","C":"Existem várias oportunidades.","D":"A maioria dos candidatos chegaram atrasadas, obrigatoriamente."}'::jsonb,
   'C', '"Existir" concorda normalmente com "oportunidades" — está correto. As demais erram "fazer"/"haver" impessoais, e a última ainda erra o gênero ("atrasadas" para "candidatos").')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
