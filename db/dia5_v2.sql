-- Cadastra o Dia 5 (revisão geral, fixação e mini-simulado).
delete from days where week = 1 and day_number = 5;

with d as (
  insert into days (week, day_number, title)
  values (1, 5, 'Revisão geral (Português, Matemática, Constitucional, Administrativo, Informática) + mini-simulado')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Revisão — interpretação de texto e classes de palavras', 20, $$INTERPRETAÇÃO DE TEXTO
Informação explícita: está escrita claramente no texto. Informação implícita: pode ser deduzida a partir do que está escrito. Inferência: conclusão lógica construída com base em pistas do texto. Extrapolação: conclusão que vai além do que o texto permite afirmar.
Exemplo: "João saiu de casa levando um guarda-chuva, apesar de o céu estar limpo." Explícito: João levou guarda-chuva. Inferência possível: João pode ter previsto possibilidade de chuva. Extrapolação (não autorizada): "João sabia que choveria às 15h" — o texto não confirma isso.
Compreensão identifica o que está escrito e localiza informações explícitas; interpretação deduz sentidos, analisa informações implícitas e responde ao que se pode concluir.

CLASSES DE PALAVRAS
Variáveis: substantivo, artigo, adjetivo, numeral, pronome, verbo. Invariáveis: advérbio, preposição, conjunção, interjeição.
Substantivo nomeia (casa, servidor, alegria). Adjetivo caracteriza um substantivo (servidor dedicado). Verbo indica ação, estado ou fenômeno (estudar, permanecer, chover). Advérbio modifica verbo/adjetivo/advérbio (estudou bastante). Pronome substitui ou acompanha um nome (ele, meu, aquele, que). Conjunção conecta orações ou termos (mas, porque, embora).
Pegadinha: a classe depende do contexto. "O jovem estudou" → substantivo. "O candidato jovem estudou" → adjetivo. Nunca classifique a palavra isolada, sem ver a função dela na frase.

TÉCNICA DE RESOLUÇÃO
Leia o comando da questão antes das alternativas. Identifique o assunto central. Separe o que está escrito do que você está deduzindo. Desconfie de alternativas com palavras absolutas ("sempre", "nunca", "todos") quando o texto não sustenta essa certeza.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — Português (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Revisão — razão, proporção, regra de três e porcentagem', 25, $$RAZÃO E PROPORÇÃO
Razão é a comparação entre duas grandezas por divisão. Ex.: 12 homens e 18 mulheres → razão homens/mulheres = 12/18 = 2/3.
Proporção é a igualdade entre duas razões — ex.: 2/3 = 8/12, verificável por multiplicação cruzada (2×12 = 3×8 = 24).

REGRA DE TRÊS
Diretamente proporcional: uma grandeza aumenta, a outra também aumenta na mesma proporção. Ex.: 4 cadernos custam R$ 28; 7 cadernos custam (7×28)/4 = 49.
Inversamente proporcional: uma aumenta, a outra diminui. Ex.: 6 funcionários concluem um serviço em 10 dias; com 12 funcionários, no mesmo ritmo: (6×10)/12 = 5 dias.

PORCENTAGEM
Porcentagem é uma razão com denominador 100: 20% = 20/100 = 0,20. Para calcular 20% de R$ 300: 300 × 0,20 = 60.

AUMENTOS E DESCONTOS (fatores)
Aumento de 10% → fator 1,10. Aumento de 25% → fator 1,25. Desconto de 10% → fator 0,90. Desconto de 30% → fator 0,70.
Ex.: produto de R$ 200 com aumento de 10% → 200×1,10 = 220. Com desconto de 10% em seguida → 220×0,90 = 198 (não volta a R$ 200).
Atenção: aumentos e descontos sucessivos incidem sobre o valor já atualizado — um aumento de 20% seguido de desconto de 20% não necessariamente "anula" as duas operações (depende da ordem e dos valores envolvidos; o padrão mais comum é não voltar ao valor original).$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — Matemática (Q5 a Q8)', 15
  from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Revisão — Constituição Federal, arts. 1º a 5º', 25, $$ART. 1º — FUNDAMENTOS
Soberania, cidadania, dignidade da pessoa humana, valores sociais do trabalho e da livre iniciativa, pluralismo político. Macete: SO-CI-DI-VA-PLU.

ART. 2º — PODERES
Legislativo, Executivo e Judiciário, independentes e harmônicos entre si. Exercem funções típicas e, em casos previstos na Constituição, funções atípicas.

ART. 3º — OBJETIVOS FUNDAMENTAIS
Construir uma sociedade livre, justa e solidária; garantir o desenvolvimento nacional; erradicar a pobreza e a marginalização e reduzir as desigualdades sociais e regionais; promover o bem de todos, sem preconceitos e outras formas de discriminação.

ART. 4º — RELAÇÕES INTERNACIONAIS
Independência nacional, prevalência dos direitos humanos, autodeterminação dos povos, não intervenção, igualdade entre os Estados, defesa da paz, solução pacífica dos conflitos, entre outros.

NÃO CONFUNDA: Art. 1º = Fundamentos | Art. 2º = Poderes da União | Art. 3º = Objetivos fundamentais | Art. 4º = Princípios das relações internacionais | Art. 5º = Direitos e garantias fundamentais.

ART. 5º — DIREITOS E GARANTIAS FUNDAMENTAIS
O caput assegura a brasileiros e estrangeiros residentes no País a inviolabilidade dos direitos à vida, liberdade, igualdade, segurança e propriedade. Pontos recorrentes: igualdade perante a lei; liberdade de manifestação do pensamento, vedado o anonimato; inviolabilidade do domicílio, com exceções constitucionais (flagrante delito, desastre, prestar socorro, ou de dia por determinação judicial); liberdade de reunião pacífica, sem armas, em locais abertos ao público, independentemente de autorização; acesso ao Judiciário diante de lesão ou ameaça a direito; devido processo legal, contraditório e ampla defesa.
Pegadinha: a Constituição não exige autorização prévia para reunião pacífica em local aberto ao público — exige prévio aviso à autoridade competente, e que não frustre outra reunião já convocada para o mesmo local.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — Constitucional (Q9 a Q12)', 15
  from d returning id
),
b_adm_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Administrativo', 'teoria', 'Revisão — princípios da Administração Pública (LIMPE)', 15, $$O art. 37, caput, da Constituição estabelece princípios que orientam a Administração Pública direta e indireta de qualquer dos Poderes da União, Estados, DF e Municípios — o LIMPE:
Legalidade: o agente público deve atuar conforme a lei e o ordenamento jurídico.
Impessoalidade: a atuação deve buscar o interesse público, sem favorecimentos ou perseguições pessoais.
Moralidade: a Administração deve observar padrões éticos e de probidade.
Publicidade: os atos administrativos devem ser divulgados, ressalvadas as hipóteses legais de sigilo.
Eficiência: a Administração deve buscar resultados, qualidade e uso adequado dos recursos públicos.

EXEMPLOS PRÁTICOS
Servidor favorece um parente em um procedimento → possível violação da impessoalidade. Órgão divulga informações públicas sem restrição legal → aplicação da publicidade. Agente atua sem observar a lei → problema de legalidade. Setor reorganiza o atendimento para reduzir filas e desperdícios → busca de eficiência.
Pegadinha: publicidade não significa que todo documento público deve ser divulgado sem exceção — há hipóteses de sigilo e proteção de informações previstas em lei.$$
  from d returning id
),
b_adm_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Administrativo', 'exercicios', 'Fixação — Administrativo (Q13 a Q14)', 10
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Informática', 'teoria', 'Revisão — hardware, software, internet e segurança', 15, $$HARDWARE × SOFTWARE
Hardware é a parte física (teclado, monitor, memória, processador). Software são os programas e sistemas que orientam o funcionamento do computador.

MEMÓRIA E ARMAZENAMENTO
RAM: armazena temporariamente dados em uso; é volátil. SSD: armazenamento persistente, geralmente rápido e sem partes móveis. HD: armazenamento persistente com discos magnéticos. CPU: executa instruções e processa dados.

SISTEMA OPERACIONAL
Software que gerencia recursos do computador — memória, arquivos, dispositivos, execução de programas. Ex.: Windows, Linux, macOS, Android.

INTERNET, WEB E NAVEGADORES
Internet: rede mundial de redes interconectadas. Web: serviço que usa a Internet para acessar páginas e conteúdos por protocolos como HTTP e HTTPS. Navegador: programa para acessar conteúdos da Web (Chrome, Edge, Firefox). URL: endereço que identifica um recurso na Web.

SEGURANÇA DA INFORMAÇÃO
Phishing: tentativa de enganar o usuário para obter informações (senhas, dados bancários). Malware: software malicioso. Ransomware: malware que bloqueia ou criptografa dados e exige resgate. Backup: cópia de segurança que permite recuperar informações em caso de perda.
Pegadinha: a RAM não é armazenamento — seu conteúdo some quando o computador é desligado. Arquivos em SSD ou HD permanecem mesmo após o desligamento.$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 10, 'Informática', 'exercicios', 'Fixação — Informática (Q15 a Q18)', 10
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 11, 'Revisão/Simulados', 'exercicios', 'Mini-simulado geral — 20 questões misturando os 4 primeiros dias (Q19 a Q38)', 50,
    $$Sem consulta. As questões misturam Português, Matemática, Constitucional, Administrativo e Informática, com enunciados que exigem atenção aos detalhes — exatamente como numa prova de verdade.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 12, 'Revisão/Simulados', 'revisao', 'Caderno de erros, avaliação e revisão programada', 25, $$CADERNO DE ERROS
Depois do simulado, registre as questões que errou ou acertou por sorte: o que era pedido, por que errou, e a regra que precisa lembrar. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app.

COMO AVALIAR SEU RESULTADO (referência, não é critério oficial de aprovação)
Menos de 50% de acerto → reestudar a teoria e refazer exercícios básicos.
50% a 69% → revisar os erros e resolver questões semelhantes.
70% a 84% → avançar com revisão programada.
85% a 100% → avançar e manter revisões para consolidar.

REVISÃO PROGRAMADA
Amanhã: revise os erros e tente explicar os conceitos sem consultar.
Daqui a 7 dias: refaça as questões que errou.
Daqui a 30 dias: nova revisão mista para checar a retenção.
(O app já faz isso sozinho: toda questão errada vira uma entrada no caderno de erros com ciclos de revisão em 24h, 7 dias e 30 dias, visíveis no Painel.)

META DO DIA 5
Completar as revisões das cinco matérias. Resolver as 20 questões do mini-simulado. Identificar os assuntos que precisam de reforço. Atualizar o caderno de erros. Marque este bloco como concluído para fechar o Dia 5 e a primeira semana.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Um texto afirma: "Embora tivesse estudado durante semanas, Carlos ficou nervoso ao iniciar a prova." É correto concluir que:',
   '{"A":"Carlos não estudou para a prova.","B":"Carlos ficou nervoso apesar da preparação.","C":"Carlos foi reprovado.","D":"Carlos não conhecia o conteúdo.","E":"Carlos desistiu da prova."}'::jsonb,
   'B', '"Embora" introduz concessão: mesmo tendo estudado (preparação), ele ficou nervoso. As demais extrapolam informações que o texto não traz.'),

  ((select id from b_port_ex), 2, 'Português',
   'Em "A funcionária respondeu rapidamente", a palavra "rapidamente" é:',
   '{"A":"Adjetivo.","B":"Substantivo.","C":"Advérbio.","D":"Pronome.","E":"Conjunção."}'::jsonb,
   'C', '"Rapidamente" modifica o verbo "respondeu", indicando modo — é advérbio.'),

  ((select id from b_port_ex), 3, 'Português',
   'Em "O atendimento foi eficiente, mas demorado", a palavra "mas" expressa:',
   '{"A":"Causa.","B":"Conclusão.","C":"Oposição.","D":"Condição.","E":"Explicação."}'::jsonb,
   'C', '"Mas" é conjunção adversativa — contrapõe eficiência e demora.'),

  ((select id from b_port_ex), 4, 'Português',
   'Assinale a alternativa que apresenta um substantivo:',
   '{"A":"Rapidamente.","B":"Organizado.","C":"Estudar.","D":"Eficiência.","E":"Porém."}'::jsonb,
   'D', '"Eficiência" nomeia uma qualidade/conceito — é substantivo. As demais são advérbio, adjetivo/particípio, verbo no infinitivo e conjunção.'),

  -- Matemática — fixação (Q5-8)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Uma equipe tem 15 homens e 10 mulheres. A razão entre homens e mulheres, na forma simplificada, é:',
   '{"A":"2:3","B":"3:2","C":"5:2","D":"3:5","E":"1:2"}'::jsonb,
   'B', '15:10 simplifica dividindo por 5: 3:2.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Se 5 canetas custam R$ 20, quanto custarão 8 canetas iguais?',
   '{"A":"R$ 24","B":"R$ 28","C":"R$ 30","D":"R$ 32","E":"R$ 40"}'::jsonb,
   'D', 'Preço unitário: 20/5 = 4. Para 8 canetas: 8 × 4 = 32.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Uma máquina produz 240 peças em 4 horas. Mantendo o mesmo ritmo, quantas peças produzirá em 7 horas?',
   '{"A":"360","B":"400","C":"420","D":"440","E":"480"}'::jsonb,
   'C', 'Produção por hora: 240/4 = 60. Em 7 horas: 7 × 60 = 420.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Um produto que custa R$ 500 recebe desconto de 15%. Qual será o preço final?',
   '{"A":"R$ 425","B":"R$ 435","C":"R$ 450","D":"R$ 475","E":"R$ 485"}'::jsonb,
   'A', '500 × 0,85 = 425.'),

  -- Constitucional — fixação (Q9-12)
  ((select id from b_const_ex), 1, 'Constitucional',
   'Qual alternativa apresenta um fundamento da República Federativa do Brasil?',
   '{"A":"Garantir o desenvolvimento nacional.","B":"Erradicar a pobreza.","C":"Cidadania.","D":"Reduzir as desigualdades sociais.","E":"Promover o bem de todos."}'::jsonb,
   'C', 'Cidadania é fundamento (art. 1º). As demais são objetivos fundamentais (art. 3º).'),

  ((select id from b_const_ex), 2, 'Constitucional',
   'De acordo com o art. 2º da Constituição Federal, são Poderes da União:',
   '{"A":"Executivo, Legislativo e Ministério Público.","B":"Legislativo, Judiciário e Tribunal de Contas.","C":"Executivo, Judiciário e Ministério Público.","D":"Legislativo, Executivo e Judiciário.","E":"Executivo, Legislativo e Defensoria Pública."}'::jsonb,
   'D', 'Art. 2º: Legislativo, Executivo e Judiciário.'),

  ((select id from b_const_ex), 3, 'Constitucional',
   'É um objetivo fundamental da República Federativa do Brasil:',
   '{"A":"A soberania.","B":"O pluralismo político.","C":"A cidadania.","D":"A prevalência dos direitos humanos.","E":"A erradicação da pobreza e da marginalização."}'::jsonb,
   'E', 'Erradicar a pobreza e a marginalização é objetivo fundamental (art. 3º, III). As demais são fundamentos (art. 1º) ou princípio das relações internacionais (art. 4º).'),

  ((select id from b_const_ex), 4, 'Constitucional',
   'A Constituição Federal estabelece que a manifestação do pensamento é:',
   '{"A":"Livre, sendo permitido o anonimato.","B":"Livre, sendo vedado o anonimato.","C":"Permitida apenas mediante autorização judicial.","D":"Proibida em locais públicos.","E":"Permitida somente a brasileiros natos."}'::jsonb,
   'B', 'Inciso IV: livre a manifestação do pensamento, vedado o anonimato.'),

  -- Administrativo — fixação (Q13-14)
  ((select id from b_adm_ex), 1, 'Administrativo',
   'O princípio que impede o uso da Administração Pública para promoção pessoal de agentes públicos é:',
   '{"A":"Eficiência.","B":"Publicidade.","C":"Impessoalidade.","D":"Legalidade.","E":"Continuidade."}'::jsonb,
   'C', 'Impessoalidade: a atuação deve buscar o interesse público, sem favorecimentos ou promoção pessoal.'),

  ((select id from b_adm_ex), 2, 'Administrativo',
   'Um servidor público decide agir de forma contrária à lei por considerar que sua decisão será mais rápida. Qual princípio é diretamente afetado?',
   '{"A":"Publicidade.","B":"Legalidade.","C":"Impessoalidade.","D":"Eficiência.","E":"Motivação."}'::jsonb,
   'B', 'Agir contra a lei viola diretamente a legalidade, ainda que a intenção seja ganhar velocidade.'),

  -- Informática — fixação (Q15-18)
  ((select id from b_info_ex), 1, 'Informática',
   'Qual componente é responsável pelo processamento de instruções?',
   '{"A":"SSD.","B":"CPU.","C":"Monitor.","D":"Teclado.","E":"Impressora."}'::jsonb,
   'B', 'A CPU executa instruções e processa dados.'),

  ((select id from b_info_ex), 2, 'Informática',
   'A principal característica da memória RAM é:',
   '{"A":"Armazenar permanentemente os arquivos.","B":"Ser utilizada exclusivamente para backup.","C":"Ser uma memória volátil utilizada durante a execução de tarefas.","D":"Substituir a CPU.","E":"Armazenar páginas da Web de forma permanente."}'::jsonb,
   'C', 'RAM é memória de trabalho, volátil — perde os dados ao desligar o computador.'),

  ((select id from b_info_ex), 3, 'Informática',
   'Um e-mail falso que imita uma instituição bancária para obter a senha do usuário é um exemplo de:',
   '{"A":"Backup.","B":"Phishing.","C":"Compactação.","D":"Atualização.","E":"Criptografia de disco legítima."}'::jsonb,
   'B', 'É a definição clássica de phishing: enganar o usuário para obter informações sensíveis.'),

  ((select id from b_info_ex), 4, 'Informática',
   'O HTTPS é utilizado para:',
   '{"A":"Excluir automaticamente vírus do computador.","B":"Aumentar a capacidade da memória RAM.","C":"Proteger a comunicação entre navegador e servidor por meio de criptografia e mecanismos de autenticação.","D":"Garantir que qualquer site seja verdadeiro.","E":"Substituir o sistema operacional."}'::jsonb,
   'C', 'HTTPS protege a comunicação em trânsito, mas não garante por si só que o site seja confiável.'),

  -- Mini-simulado (Q19-38)
  ((select id from b_simulado), 1, 'Português',
   'Leia: "A biblioteca ampliou seu horário de atendimento, permitindo que mais estudantes utilizassem o espaço." Qual informação pode ser concluída?',
   '{"A":"Todos os estudantes passaram a frequentar a biblioteca.","B":"A ampliação do horário criou uma possibilidade maior de uso.","C":"A biblioteca deixou de funcionar durante o dia.","D":"O texto afirma que os estudantes não tinham interesse.","E":"O horário foi ampliado apenas aos domingos."}'::jsonb,
   'B', 'O texto autoriza concluir que a ampliação abriu mais possibilidade de uso — não que "todos" passaram a usar (extrapolação).'),

  ((select id from b_simulado), 2, 'Português',
   'Em "Os candidatos resolveram cuidadosamente as questões", a palavra "cuidadosamente" é:',
   '{"A":"Adjetivo","B":"Substantivo","C":"Advérbio","D":"Verbo","E":"Pronome"}'::jsonb,
   'C', '"Cuidadosamente" modifica o verbo "resolveram", indicando modo — é advérbio.'),

  ((select id from b_simulado), 3, 'Matemática/RLM',
   'Um salário de R$ 1.800 recebeu reajuste de 10%. Qual o novo valor?',
   '{"A":"R$ 1.880","B":"R$ 1.900","C":"R$ 1.960","D":"R$ 1.980","E":"R$ 2.000"}'::jsonb,
   'D', '1800 × 1,10 = 1980.'),

  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Uma loja vende 3 camisetas por R$ 75. Mantido o mesmo preço unitário, quanto custam 8 camisetas?',
   '{"A":"R$ 150","B":"R$ 175","C":"R$ 190","D":"R$ 200","E":"R$ 225"}'::jsonb,
   'D', 'Preço unitário: 75/3 = 25. Para 8 camisetas: 8 × 25 = 200.'),

  ((select id from b_simulado), 5, 'Constitucional',
   'A dignidade da pessoa humana, conforme o art. 1º da Constituição Federal, é:',
   '{"A":"Um objetivo fundamental.","B":"Um princípio de relações internacionais listado no art. 4º.","C":"Um fundamento da República.","D":"Uma competência exclusiva do Judiciário.","E":"Uma garantia restrita aos brasileiros natos."}'::jsonb,
   'C', 'Dignidade da pessoa humana é fundamento, art. 1º, III.'),

  ((select id from b_simulado), 6, 'Constitucional',
   'A construção de uma sociedade livre, justa e solidária é:',
   '{"A":"Fundamento da República.","B":"Objetivo fundamental da República.","C":"Princípio exclusivo da Administração.","D":"Regra de competência municipal.","E":"Princípio de relações internacionais apenas."}'::jsonb,
   'B', 'É o objetivo fundamental do art. 3º, I.'),

  ((select id from b_simulado), 7, 'Constitucional',
   'Sobre a inviolabilidade do domicílio, assinale a alternativa correta:',
   '{"A":"A entrada é permitida a qualquer hora por ordem judicial.","B":"A casa é inviolável, mas há exceções constitucionais, como flagrante delito e desastre.","C":"A entrada depende sempre da autorização do vizinho.","D":"A autoridade policial pode entrar à noite por simples conveniência.","E":"A inviolabilidade vale apenas para proprietários do imóvel."}'::jsonb,
   'B', 'A casa é inviolável, com exceções constitucionais específicas (flagrante delito, desastre, prestar socorro, ou de dia por determinação judicial).'),

  ((select id from b_simulado), 8, 'Constitucional',
   'A liberdade de reunião em local aberto ao público exige, nos termos constitucionais:',
   '{"A":"Autorização prévia do prefeito.","B":"Autorização judicial em todos os casos.","C":"Aviso prévio à autoridade competente, observadas as condições constitucionais.","D":"Registro obrigatório em cartório.","E":"Filiação a uma associação."}'::jsonb,
   'C', 'Não se exige autorização — exige-se prévio aviso à autoridade competente.'),

  ((select id from b_simulado), 9, 'Administrativo',
   'O princípio que exige atuação administrativa ética e proba é:',
   '{"A":"Moralidade","B":"Publicidade","C":"Eficiência","D":"Hierarquia","E":"Especialidade"}'::jsonb,
   'A', 'Moralidade: padrões éticos e de probidade na atuação administrativa.'),

  ((select id from b_simulado), 10, 'Administrativo',
   'A divulgação de atos administrativos, respeitadas as hipóteses legais de sigilo, relaciona-se ao princípio da:',
   '{"A":"Impessoalidade","B":"Publicidade","C":"Legalidade","D":"Autotutela","E":"Razoabilidade"}'::jsonb,
   'B', 'Publicidade: divulgação dos atos, ressalvadas as hipóteses legais de sigilo.'),

  ((select id from b_simulado), 11, 'Informática',
   'Qual alternativa descreve um sistema operacional?',
   '{"A":"Um componente físico de armazenamento.","B":"Um programa que gerencia recursos e permite a execução de aplicações.","C":"Um tipo de cabo de rede.","D":"Um navegador de Internet exclusivamente.","E":"Um dispositivo de entrada."}'::jsonb,
   'B', 'Sistema operacional gerencia recursos do computador e permite a execução de programas.'),

  ((select id from b_simulado), 12, 'Informática',
   'Qual alternativa é um exemplo de armazenamento persistente?',
   '{"A":"RAM","B":"Registrador da CPU","C":"Cache volátil","D":"SSD","E":"Dado ainda não salvo na memória de trabalho"}'::jsonb,
   'D', 'SSD é armazenamento persistente — os dados permanecem mesmo após o desligamento.'),

  ((select id from b_simulado), 13, 'Português',
   'Em "O servidor que atendeu o cidadão foi cordial", a palavra "que" funciona como:',
   '{"A":"Artigo","B":"Pronome relativo","C":"Interjeição","D":"Preposição","E":"Numeral"}'::jsonb,
   'B', '"Que" retoma "servidor" — é pronome relativo.'),

  ((select id from b_simulado), 14, 'Matemática/RLM',
   'Um produto de R$ 250 teve desconto de 20%. Qual é seu preço após o desconto?',
   '{"A":"R$ 180","B":"R$ 190","C":"R$ 200","D":"R$ 210","E":"R$ 220"}'::jsonb,
   'C', '250 × 0,80 = 200.'),

  ((select id from b_simulado), 15, 'Matemática/RLM',
   'Um valor aumenta 25% e, depois, sofre desconto de 20%. Em relação ao valor inicial, o valor final é:',
   '{"A":"5% maior","B":"5% menor","C":"Igual ao inicial","D":"10% maior","E":"10% menor"}'::jsonb,
   'C', 'Fatores: 1,25 × 0,80 = 1,00 — nesse caso específico, o valor final é exatamente igual ao inicial.'),

  ((select id from b_simulado), 16, 'Constitucional',
   'O pluralismo político é:',
   '{"A":"Objetivo do art. 3º.","B":"Fundamento do art. 1º.","C":"Poder da União.","D":"Direito restrito aos servidores públicos.","E":"Princípio do art. 37 exclusivamente."}'::jsonb,
   'B', 'Pluralismo político é o quinto fundamento do art. 1º.'),

  ((select id from b_simulado), 17, 'Constitucional',
   'A Constituição assegura que ninguém será privado da liberdade ou de seus bens sem:',
   '{"A":"Decisão administrativa informal.","B":"Devido processo legal.","C":"Autorização de qualquer servidor.","D":"Consulta pública obrigatória.","E":"Autorização de um partido político."}'::jsonb,
   'B', 'Inciso LIV: devido processo legal.'),

  ((select id from b_simulado), 18, 'Administrativo',
   'A busca por resultados e qualidade na prestação dos serviços públicos está relacionada à:',
   '{"A":"Eficiência","B":"Publicidade","C":"Soberania","D":"Pluralismo","E":"Autodeterminação"}'::jsonb,
   'A', 'Eficiência: busca por resultados, qualidade e uso adequado dos recursos públicos.'),

  ((select id from b_simulado), 19, 'Informática',
   'Um software malicioso que criptografa arquivos e exige pagamento para liberá-los é chamado de:',
   '{"A":"Navegador","B":"Ransomware","C":"Firewall","D":"Backup","E":"Sistema operacional"}'::jsonb,
   'B', 'É a definição de ransomware.'),

  ((select id from b_simulado), 20, 'Português',
   'Em "Embora estivesse cansada, continuou estudando", a conjunção "embora" indica:',
   '{"A":"Causa","B":"Conclusão","C":"Concessão","D":"Adição","E":"Finalidade"}'::jsonb,
   'C', '"Embora" introduz uma ideia de concessão: apesar de estar cansada, continuou estudando.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
