-- Cadastra o Dia 18 (versão completa e robusta).
delete from days where week = 4 and day_number = 4;

with d as (
  insert into days (week, day_number, title)
  values (4, 4, 'Concordância verbal aprofundada + equações/sistemas + poderes administrativos (revisão) + planilhas eletrônicas')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Concordância verbal: núcleo do sujeito, partitivas, haver/fazer impessoais, partícula se', 30, $$REGRA GERAL
O verbo concorda com o NÚCLEO do sujeito, não com a palavra mais próxima. "A lista de documentos foi publicada." (núcleo: lista, singular). "Os documentos do processo foram analisados." (núcleo: documentos, plural).
Pegadinha: "A relação de candidatos foram divulgadas" está errado — "relação" é o núcleo, singular: "A relação de candidatos foi divulgada."

SUJEITO COMPOSTO
Dois ou mais núcleos → verbo geralmente no plural: "O gerente e o funcionário conferiram os documentos." Quando o sujeito composto vem depois do verbo, pode haver plural ou concordância com o núcleo mais próximo, conforme a construção: "Chegaram o gerente e os funcionários." / "Chegou o gerente e os funcionários."

EXPRESSÕES PARTITIVAS ("a maioria de", "grande parte de")
Admitem singular (concordando com "maioria") ou plural (concordando com os indivíduos): "A maioria dos candidatos foi aprovada." / "A maioria dos candidatos foram aprovados." Não marque uma dessas construções como errada automaticamente — observe o contexto da questão.

EXPRESSÕES QUE EXIGEM ATENÇÃO
"Mais de um": verbo no singular, em regra ("Mais de um candidato faltou."), mas pode ir ao plural em casos de reciprocidade. "Cerca de/aproximadamente": concorda com o núcleo numérico ("Cerca de vinte pessoas chegaram."). "Um dos que": geralmente verbo no plural na oração relativa ("Ela é uma das pessoas que mais estudam."). "Quem": pode levar o verbo à 3ª pessoa do singular ou concordar com o antecedente, conforme a construção ("Fui eu quem resolveu" / "quem resolvi").

VERBO "HAVER" (sentido de existir)
Impessoal, sempre 3ª pessoa do singular: "Havia muitos candidatos na sala."; "Há documentos pendentes."; "Houve problemas no sistema." Nunca "Haviam muitos candidatos" nesse sentido. Compare: "Existiam muitos candidatos" (existir concorda normalmente). Também em tempo decorrido: "Havia dois anos que ele estudava" — continua impessoal.

VERBO "FAZER" (tempo ou clima)
Impessoal: "Faz dois anos que estudo."; "Faz três meses que o sistema foi implantado."; "Fez dias muito frios." Nunca "Fazem dois anos" nesse sentido. Compare: "Os funcionários fazem os relatórios" — aqui há sujeito ("funcionários"), concordância normal.

PARTÍCULA "SE"
a) Apassivadora — o verbo concorda com o sujeito paciente: "Vendem-se imóveis." (= Imóveis são vendidos); "Alugam-se salas." (= Salas são alugadas); "Publicaram-se os resultados."
b) Índice de indeterminação do sujeito — verbo sempre na 3ª pessoa do singular: "Precisa-se de funcionários."; "Vive-se bem aqui."; "Trata-se de questões complexas." Em "Precisa-se de funcionários", o verbo é transitivo indireto (regido por "de") — por isso NÃO existe "Precisam-se de funcionários" na norma-padrão.

VERBOS "SER" E "ESTAR"
"Estar" segue as regras usuais: "O documento está pronto." / "Os documentos estão prontos." "Ser" tem construções especiais em hora ("É uma hora." / "São duas horas." / "É meio-dia."). Em quantidade/preço/medida, "ser" pode concordar com a expressão numérica ou com o elemento que a acompanha: "Dois metros é suficiente."; "Dez reais é pouco para essa compra."$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — concordância verbal (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Equações do 1º grau com frações/parênteses, problemas e sistemas (adição/substituição)', 35, $$PRINCÍPIO FUNDAMENTAL
Uma igualdade continua válida quando aplicamos a mesma operação nos dois lados. x+5=12 → subtrai 5 dos dois lados → x=7. "Passar para o outro lado trocando o sinal" é um atalho para esse procedimento.

MULTIPLICAÇÃO E DIVISÃO
3x=24 → divide por 3 → x=8. x/4=6 → multiplica por 4 → x=24.

VÁRIOS TERMOS
2x+7=19 → 2x=12 → x=6. 5x−8=2x+10 → agrupa: 5x−2x=10+8 → 3x=18 → x=6.
Erro comum com parênteses: sinal de menos antes dos parênteses inverte TODOS os termos internos. Ex.: 10−(x+3)=2 → 10−x−3=2 → 7−x=2 → x=5.

FRAÇÕES EM EQUAÇÕES
x/3+2=6 → x/3=4 → x=12. Com vários denominadores, multiplique tudo pelo MMC. Ex.: x/2+x/3=10 — MMC(2,3)=6 → 3x+2x=60 → 5x=60 → x=12.

PROBLEMAS QUE VIRAM EQUAÇÕES
Idade: "idade somada a 8 é 25" → x+8=25 → x=17. Números consecutivos: "soma de dois consecutivos é 41" → x+(x+1)=41 → 2x+1=41 → x=20 (números: 20 e 21). Compra: "3 cadernos iguais custam R$36" → 3x=36 → x=12.

SISTEMAS DE DUAS EQUAÇÕES — MÉTODO DA ADIÇÃO
x+y=10 e x−y=2. Somando: 2x=12 → x=6. Substituindo: 6+y=10 → y=4.

MÉTODO DA SUBSTITUIÇÃO
x+y=12 e x=2y. Substituindo: 2y+y=12 → 3y=12 → y=4 → x=2×4=8.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — equações e sistemas (Q1 a Q4)', 15
  from d returning id
),
b_adm_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Administrativo', 'teoria', 'Poderes administrativos — revisão aprofundada (delegação/avocação, decreto autônomo, abuso de poder)', 30, $$PODER VINCULADO
A lei determina os requisitos e a consequência jurídica, sem margem de escolha quando os requisitos estão presentes. Palavra-chave: ausência de liberdade de escolha quanto à solução legalmente determinada.

PODER DISCRICIONÁRIO
A lei permite margem de escolha dentro de limites jurídicos (conveniência e oportunidade). Não é liberdade absoluta — sujeito à lei, finalidade pública, razoabilidade e proporcionalidade. Pegadinha: discricionariedade ≠ arbitrariedade (escolha permitida pelo ordenamento × atuação ilegal/fora dos limites).

PODER HIERÁRQUICO
Organiza a estrutura administrativa e distribui funções entre órgãos/agentes de uma mesma hierarquia: distribuição de tarefas, emissão de ordens dentro da competência, fiscalização do trabalho subordinado, delegação e avocação quando permitidas.
Delegação: transferência do EXERCÍCIO de uma competência a outro agente/órgão, nas condições legais — em regra, a titularidade não é transferida.
Avocação: um superior assume temporariamente o exercício de competência de órgão/agente subordinado, em caráter excepcional e nos limites permitidos.
A Lei 9.784/1999 prevê restrições à delegação e à avocação no âmbito federal — nem toda competência pode ser delegada ou avocada.

PODER DISCIPLINAR
Apurar infrações e aplicar sanções a servidores e a outras pessoas com relação jurídica específica com a Administração (inclusive certas relações contratuais). Deve respeitar contraditório, ampla defesa e demais garantias legais. Não se limita necessariamente a servidores estatutários.

PODER REGULAMENTAR
Competência para expedir regulamentos/atos normativos para execução da lei, nos limites constitucionais e legais. Regra: o regulamento não pode contrariar a lei nem criar obrigação livremente sem fundamento jurídico. A Constituição prevê hipóteses específicas de decreto autônomo (art. 84, VI, âmbito federal, matérias delimitadas) — evite afirmar que todo decreto sempre depende de lei prévia específica.

PODER DE POLÍCIA
Condiciona ou restringe direitos/interesses/atividades em benefício de interesses públicos (segurança, higiene, ordenação urbana). Ex.: fiscalização sanitária, regras de trânsito, licenciamento, normas urbanísticas. Deve respeitar competência legal, finalidade pública, devido processo quando aplicável, proporcionalidade e razoabilidade.

ABUSO DE PODER
Excesso de poder: o agente ultrapassa sua competência/limites de atuação. Ex.: aplicar sanção que a lei não lhe permite.
Desvio de finalidade: o agente pratica ato visando finalidade diferente da prevista em lei/interesse público. Ex.: transferir servidor para perseguição pessoal, usando a competência para fim indevido.
Memorize: excesso = problema de competência/limites; desvio = problema de objetivo perseguido. Ambos podem invalidar o ato.$$
  from d returning id
),
b_adm_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Administrativo', 'exercicios', 'Fixação — poderes administrativos (Q1 a Q4)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'Planilhas: fórmulas, ordem de operações, funções básicas, referências relativas/absolutas/mistas, erros comuns', 25, $$LINHAS, COLUNAS E CÉLULAS
Colunas: letras (A, B, C...). Linhas: números (1, 2, 3...). Célula: interseção (ex.: B3 = coluna B, linha 3). Intervalo: conjunto de células (A1:A5, A1:C3).

FÓRMULAS E ORDEM DE OPERAÇÕES
Começam com "=". Operadores: + adição, − subtração, * multiplicação, / divisão, ^ potenciação. Parênteses definem a ordem. Ex.: A1=10, B1=5: =A1+B1*2 → 10+10=20 (multiplicação primeiro); =(A1+B1)*2 → 15×2=30 (parênteses primeiro).

FUNÇÕES BÁSICAS
SOMA: soma valores (=SOMA(A1:A5)). MÉDIA: média aritmética (=MÉDIA(A1:A5); ex.: 6,8,10 → média=8). MÁXIMO: maior valor. MÍNIMO: menor valor. CONT.NÚM: conta células com números. SE: testa condição e retorna resultado (=SE(A1>=7;"Aprovado";"Reprovado") — A1=8 → "Aprovado"; A1=5 → "Reprovado"). A sintaxe/separador pode variar por idioma/configuração (português costuma usar ponto e vírgula).

REFERÊNCIAS RELATIVA, ABSOLUTA E MISTA
Relativa (A1): ao copiar, a referência se ajusta (ex.: =A1+B1 em C1, copiada para C2, vira =A2+B2). Absoluta ($A$1): coluna e linha fixas ao copiar (ex.: =B2*$A$1 — B2 muda ao copiar, $A$1 permanece). Mista: $A1 fixa a coluna, permite variar a linha; A$1 fixa a linha, permite variar a coluna. Macete: o cifrão fixa a parte da referência logo depois dele.

ORDENAÇÃO E FILTROS
Ordenação: reorganiza dados (alfabética, menor→maior). Filtro: exibe só as linhas que atendem a um critério, ocultando temporariamente as demais — não apaga os registros ocultos.

ERROS FREQUENTES
#DIV/0!: divisão por zero/célula vazia em certas operações. #NOME?: função ou texto não reconhecido. #REF!: referência inválida. ####: geralmente coluna estreita demais para exibir o valor (pode haver outras causas conforme o conteúdo).$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — planilhas eletrônicas (Q1 a Q4)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 18, 5 alternativas por questão (Q17 a Q28)', 40,
    $$Sem consulta. 12 questões, 5 alternativas cada, misturando concordância verbal, equações/sistemas, poderes administrativos, planilhas e porcentagem.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Caderno de erros, revisão programada e checklist do Dia 18', 20, $$CADERNO DE ERROS
Escolha a matéria que mais exigiu esforço hoje (Português — concordância verbal; Matemática — equações e sistemas; Administrativo — poderes administrativos; Informática — fórmulas e referências) e anote as questões a refazer. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app.

REVISÃO PROGRAMADA
Amanhã (10–15 min): revise as regras de concordância, resolva duas equações e relembre a diferença entre excesso de poder e desvio de finalidade.
Daqui a 7 dias: refaça as questões erradas dos Dias 17 e 18, sem olhar o gabarito.
Daqui a 30 dias: revisão mista, incluindo porcentagem, direitos fundamentais, segurança da informação e planilhas.
(O app já agenda isso sozinho via o caderno de erros — 24h, 7 dias e 30 dias, visíveis no Painel.)

CHECKLIST DO DIA 18
Estudei concordância verbal e revisei os verbos impessoais. Resolvi equações e sistemas mostrando os cálculos. Diferenciei os poderes administrativos e as formas de abuso de poder. Pratiquei funções e referências de células em planilhas. Fiz o mini-simulado e conferi as respostas. Marque este bloco como concluído para fechar o Dia 18.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a frase correta segundo a norma-padrão.',
   '{"A":"A lista de documentos foram divulgadas.","B":"A lista de documentos foi divulgada.","C":"A lista de documentos foram divulgado.","D":"A lista de documentos foi divulgados."}'::jsonb,
   'B', 'O núcleo do sujeito é "lista" (singular), por isso o verbo e o particípio ficam no singular: "foi divulgada".'),

  ((select id from b_port_ex), 2, 'Português',
   'Complete: "_____ muitos candidatos aguardando o resultado."',
   '{"A":"Haviam","B":"Houveram","C":"Havia","D":"Existia"}'::jsonb,
   'C', '"Havia", no sentido de existir, é impessoal e fica sempre no singular.'),

  ((select id from b_port_ex), 3, 'Português',
   'Assinale a alternativa adequada à norma-padrão.',
   '{"A":"Fazem dois anos que trabalho aqui.","B":"Faz dois anos que trabalho aqui.","C":"Fazem dois ano que trabalho aqui.","D":"Faziam dois anos atrás que trabalho aqui."}'::jsonb,
   'B', '"Fazer" indicando tempo decorrido é impessoal, sempre no singular: "Faz dois anos".'),

  ((select id from b_port_ex), 4, 'Português',
   'Em qual frase a concordância está correta?',
   '{"A":"Vende-se apartamentos.","B":"Precisam-se de funcionários.","C":"Alugam-se salas comerciais.","D":"Houveram problemas ontem."}'::jsonb,
   'C', '"Alugam-se salas comerciais" — partícula apassivadora, verbo concorda com "salas" (plural). As demais erram: "vende-se" deveria concordar com "apartamentos" (plural), "precisar de" é VTI e não admite "precisam-se", e "houveram" nunca existe nesse sentido.'),

  -- Matemática — fixação (Q1-4)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Resolva: 3x + 5 = 20.',
   '{"A":"3","B":"4","C":"5","D":"6"}'::jsonb,
   'C', '3x = 15 → x = 5.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'A soma de dois números consecutivos é 57. O menor número é:',
   '{"A":"27","B":"28","C":"29","D":"30"}'::jsonb,
   'B', 'x+(x+1)=57 → 2x=56 → x=28.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Resolva o sistema: x + y = 9 e x − y = 3.',
   '{"A":"x = 6 e y = 3","B":"x = 3 e y = 6","C":"x = 5 e y = 4","D":"x = 7 e y = 2"}'::jsonb,
   'A', 'Somando: 2x=12 → x=6. Substituindo: y=3.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Um número multiplicado por 4 e depois acrescido de 6 resulta em 30. Qual é o número?',
   '{"A":"4","B":"5","C":"6","D":"8"}'::jsonb,
   'C', '4x+6=30 → 4x=24 → x=6.'),

  -- Administrativo — fixação (Q1-4)
  ((select id from b_adm_ex), 1, 'Administrativo',
   'O agente público aplica uma sanção que ultrapassa os limites de sua competência legal. Há, em princípio:',
   '{"A":"Desvio de finalidade","B":"Excesso de poder","C":"Poder regulamentar","D":"Poder hierárquico regular"}'::jsonb,
   'B', 'Ultrapassar os limites da competência caracteriza excesso de poder.'),

  ((select id from b_adm_ex), 2, 'Administrativo',
   'Um ato é praticado para perseguir pessoalmente um servidor, embora a competência administrativa exista. O vício caracteriza:',
   '{"A":"Poder vinculado","B":"Delegação regular","C":"Desvio de finalidade","D":"Poder regulamentar"}'::jsonb,
   'C', 'Usar a competência para finalidade pessoal indevida é desvio de finalidade.'),

  ((select id from b_adm_ex), 3, 'Administrativo',
   'A organização de tarefas e a fiscalização dos subordinados são manifestações típicas do poder:',
   '{"A":"Hierárquico","B":"De polícia","C":"Regulamentar","D":"Constituinte"}'::jsonb,
   'A', 'Organizar tarefas e fiscalizar subordinados é exercício do poder hierárquico.'),

  ((select id from b_adm_ex), 4, 'Administrativo',
   'Sobre o poder discricionário, assinale a alternativa correta.',
   '{"A":"Autoriza o agente a agir contra a lei","B":"Elimina o controle judicial de legalidade","C":"Permite qualquer decisão por conveniência pessoal","D":"Permite escolhas dentro dos limites legais"}'::jsonb,
   'D', 'Discricionariedade é escolha dentro dos limites do ordenamento — nunca contra a lei ou por conveniência pessoal.'),

  -- Informática — fixação (Q1-4)
  ((select id from b_info_ex), 1, 'Informática',
   'A fórmula =SOMA(A1:A4) serve para:',
   '{"A":"Calcular somente o maior valor","B":"Somar os valores das células A1 até A4","C":"Contar apenas células vazias","D":"Multiplicar A1 por A4"}'::jsonb,
   'B', '=SOMA soma todos os valores do intervalo informado.'),

  ((select id from b_info_ex), 2, 'Informática',
   'Qual referência mantém fixa a coluna A e permite que a linha varie ao copiar a fórmula?',
   '{"A":"A1","B":"$A$1","C":"$A1","D":"A$1"}'::jsonb,
   'C', '$A1 fixa a coluna (A) e deixa a linha variar.'),

  ((select id from b_info_ex), 3, 'Informática',
   'Uma célula contém 10 e outra contém 5. Qual fórmula resulta em 30?',
   '{"A":"=10+5*2","B":"=(10+5)*2","C":"=10+5","D":"=10/5"}'::jsonb,
   'B', '(10+5)×2 = 15×2 = 30. Sem parênteses, a multiplicação seria feita primeiro: 10+5×2=20.'),

  ((select id from b_info_ex), 4, 'Informática',
   'Qual função retorna o maior valor de um intervalo?',
   '{"A":"MÍNIMO","B":"MÉDIA","C":"SOMA","D":"MÁXIMO"}'::jsonb,
   'D', '=MÁXIMO retorna o maior valor do intervalo.'),

  -- Mini-simulado (Q17-28, 5 alternativas)
  ((select id from b_simulado), 1, 'Português',
   'Assinale a frase correta segundo a norma-padrão.',
   '{"A":"Haviam muitos processos pendentes.","B":"Fazem três meses que ele começou.","C":"Existia muitas dúvidas sobre a prova.","D":"Havia muitos processos pendentes.","E":"Precisam-se de novos funcionários."}'::jsonb,
   'D', '"Havia", sentido de existir, impessoal, singular — correto. As demais erram "haver"/"fazer" impessoais, concordância de "existir" ou a regência de "precisar de".'),

  ((select id from b_simulado), 2, 'Matemática/RLM',
   'Resolva a equação 4x − 8 = 20.',
   '{"A":"5","B":"6","C":"7","D":"8","E":"9"}'::jsonb,
   'C', '4x=28 → x=7.'),

  ((select id from b_simulado), 3, 'Informática',
   'Em uma planilha, a referência que mantém fixas a coluna e a linha é:',
   '{"A":"A1","B":"A$1","C":"$A1","D":"$A$1","E":"A:A"}'::jsonb,
   'D', '$A$1 fixa coluna e linha simultaneamente.'),

  ((select id from b_simulado), 4, 'Administrativo',
   'O poder administrativo relacionado à organização interna e à fiscalização dos subordinados é o:',
   '{"A":"Poder de polícia","B":"Poder hierárquico","C":"Poder regulamentar","D":"Poder constituinte","E":"Poder jurisdicional"}'::jsonb,
   'B', 'Poder hierárquico: organização e fiscalização interna.'),

  ((select id from b_simulado), 5, 'Matemática/RLM',
   'Uma mercadoria custa R$ 250 e recebe aumento de 12%. O preço passa a ser:',
   '{"A":"R$ 262","B":"R$ 270","C":"R$ 275","D":"R$ 280","E":"R$ 300"}'::jsonb,
   'D', '250 × 1,12 = 280.'),

  ((select id from b_simulado), 6, 'Administrativo',
   'Quando o agente público pratica um ato para finalidade pessoal indevida, o vício é conhecido como:',
   '{"A":"Excesso de arrecadação","B":"Delegação","C":"Desvio de finalidade","D":"Poder vinculado","E":"Avocação"}'::jsonb,
   'C', 'Finalidade pessoal indevida caracteriza desvio de finalidade.'),

  ((select id from b_simulado), 7, 'Informática',
   'Qual fórmula calcula a média dos valores das células B1 até B5?',
   '{"A":"=SOMA(B1:B5)","B":"=MÉDIA(B1:B5)","C":"=MÁXIMO(B1:B5)","D":"=CONT.NÚM(B1:B5)","E":"=MÍNIMO(B1:B5)"}'::jsonb,
   'B', '=MÉDIA calcula a média aritmética do intervalo.'),

  ((select id from b_simulado), 8, 'Matemática/RLM',
   'A soma de dois números é 30, e o maior é o dobro do menor. O menor número é:',
   '{"A":"5","B":"8","C":"10","D":"12","E":"15"}'::jsonb,
   'C', 'x+2x=30 → 3x=30 → x=10 (menor); o maior é 20.'),

  ((select id from b_simulado), 9, 'Português',
   'Assinale a alternativa em que o verbo concorda corretamente com o sujeito.',
   '{"A":"A relação de candidatos foram publicada.","B":"Os documentos foi analisado.","C":"A maioria dos candidatos foram aprovado.","D":"O conjunto de regras foram alterado.","E":"Os documentos do processo foram analisados."}'::jsonb,
   'E', 'O núcleo do sujeito é "documentos" (plural) — concorda corretamente com "foram analisados".'),

  ((select id from b_simulado), 10, 'Administrativo',
   'Uma decisão discricionária da Administração Pública:',
   '{"A":"Pode contrariar a lei se for conveniente","B":"É sempre imune ao controle judicial","C":"Permite escolhas dentro dos limites legais","D":"É necessariamente arbitrária","E":"Dispensa finalidade pública"}'::jsonb,
   'C', 'Discricionariedade é escolha dentro dos limites legais — nunca contra a lei, sem finalidade pública ou imune ao controle de legalidade.'),

  ((select id from b_simulado), 11, 'Informática',
   'Qual função de planilha retorna o menor valor numérico de um intervalo?',
   '{"A":"MÁXIMO","B":"MÍNIMO","C":"SOMA","D":"SE","E":"MÉDIA"}'::jsonb,
   'B', '=MÍNIMO retorna o menor valor do intervalo.'),

  ((select id from b_simulado), 12, 'Matemática/RLM',
   'Resolva o sistema: x + y = 12 e x − y = 4.',
   '{"A":"x = 6 e y = 6","B":"x = 7 e y = 5","C":"x = 9 e y = 3","D":"x = 8 e y = 4","E":"x = 10 e y = 2"}'::jsonb,
   'D', 'Somando: 2x=16 → x=8. Substituindo: y=4.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
