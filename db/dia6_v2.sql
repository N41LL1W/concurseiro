-- Cadastra o Dia 6 (versão completa e robusta).
delete from days where week = 2 and day_number = 1;

with d as (
  insert into days (week, day_number, title)
  values (2, 1, 'Concordância verbal/nominal + equações do 1º grau + organização administrativa + segurança da informação')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Concordância verbal e nominal', 30, $$Concordância é a relação gramatical entre palavras da frase. Na verbal, o verbo se ajusta ao sujeito ("O servidor trabalha" / "Os servidores trabalham"). Na nominal, artigo, adjetivo, pronome e numeral se ajustam ao substantivo ("A funcionária dedicada" / "As funcionárias dedicadas").

CONCORDÂNCIA VERBAL — REGRA GERAL
O verbo concorda com o núcleo do sujeito, em número e pessoa — e o núcleo nem sempre é a palavra mais próxima do verbo. Ex.: "Uma série de candidatos compareceu à prova" — o núcleo é "série" (singular), por isso "compareceu".

SUJEITO COMPOSTO
Antes do verbo, em regra o verbo fica no plural: "João e Maria estudam."; "O diretor e os servidores participaram da reunião." Depois do verbo, pode haver plural ou concordância com o núcleo mais próximo: "Chegaram o diretor e os servidores." / "Chegou o diretor e os servidores."

VERBO "HAVER"
Quando significa existir ou indica tempo decorrido, é impessoal e fica sempre na 3ª pessoa do singular: "Há muitos candidatos na sala."; "Havia documentos pendentes."; "Há três anos estudo para concursos." Pegadinha: "Haviam muitos candidatos" está incorreto nesse sentido. Já "existir" concorda normalmente: "Existiam muitos candidatos."

VERBO "FAZER" INDICANDO TEMPO
Quando indica tempo decorrido ou fenômeno climático, também é impessoal: "Faz dois anos que trabalho aqui."; "Fazia meses que ele não estudava." Não se escreve "Fazem dois anos" nesse sentido.

VERBO "SER"
Tem casos particulares em expressões de tempo, data e quantidade: "Hoje é segunda-feira."; "Hoje são 2 de outubro."; "Dois quilômetros são uma distância considerável." Em "É proibida a entrada", a concordância nominal depende do artigo: com artigo, concorda ("É proibida a entrada"); sem determinante, tende ao masculino singular ("É proibido entrar").

CONCORDÂNCIA NOMINAL — REGRA GERAL
O adjetivo concorda em gênero e número com o substantivo: "Documento correto." / "Documentos corretos." / "Informações corretas."

EXPRESSÕES QUE MERECEM ATENÇÃO
Anexo: varia ("Seguem anexas as cópias"). Incluso: varia ("Estão inclusos os documentos"). Obrigado: concorda com quem agradece ("Muito obrigada", se quem fala é mulher). Mesmo: varia quando equivale a "próprio" ("Elas mesmas fizeram"). Bastante: varia quando equivale a "muitos/muitas" ("Bastantes questões"); não varia como advérbio ("Estudaram bastante"). Meio: varia como numeral ("meia hora"); não varia como advérbio ("meio cansada"). Menos: é sempre invariável ("menos questões").

"É NECESSÁRIO", "É PROIBIDO", "É PERMITIDO"
Com artigo determinando o substantivo, a expressão concorda com ele: "É proibida a entrada."; "É necessária a autorização." Sem determinante, geralmente fica no masculino singular: "É necessário cuidado."

PEGADINHAS COMUNS
Concordar o verbo com o termo mais próximo, ignorando o núcleo do sujeito. Flexionar "haver" com sentido de existir. Flexionar "fazer" quando indica tempo decorrido. Confundir "meio" advérbio com "meia" numeral. Confundir "bastante" advérbio invariável com "bastantes" adjetivo variável.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — concordância (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Equações do 1º grau e resolução de problemas', 30, $$Uma equação é uma igualdade com uma ou mais incógnitas. Ex.: x + 5 = 12 → x = 12 − 5 = 7.

PRINCÍPIO DA IGUALDADE
Podemos somar, subtrair, multiplicar ou dividir os dois lados da equação pelo mesmo número (nunca por zero), sem alterar a solução. Ex.: 3x + 4 = 19 → subtrai 4 dos dois lados → 3x = 15 → divide por 3 → x = 5.

INCÓGNITA NOS DOIS LADOS
Ex.: 5x + 2 = 2x + 17. Agrupe os termos com x de um lado e os números do outro: 5x − 2x = 17 − 2 → 3x = 15 → x = 5. "Passar para o outro lado trocando o sinal" é uma abreviação — o raciocínio correto é aplicar a mesma operação nos dois lados.

EQUAÇÕES COM PARÊNTESES
Ex.: 2(x + 3) = 18. Aplique a distributiva: 2x + 6 = 18 → 2x = 12 → x = 6.

PROBLEMAS PRÁTICOS
Idade: "A idade de Ana, somada a 8, é igual a 25." → x + 8 = 25 → x = 17 anos.
Compra: "3 cadernos iguais + 1 caneta de R$ 5 = R$ 35." → 3x + 5 = 35 → 3x = 30 → x = 10 (cada caderno custa R$ 10).

TRADUZINDO ENUNCIADOS PARA EQUAÇÕES
"Um número somado a 9" → x + 9. "O dobro de um número" → 2x. "O triplo de um número menos 4" → 3x − 4. "A metade de um número" → x/2. "O dobro de um número é 18" → 2x = 18.

PEGADINHA DE PROVA
"O dobro de um número aumentado em 5" pode ser lido de dois jeitos diferentes: dobro do número, depois soma 5 → 2x + 5; ou dobro da soma do número com 5 → 2(x + 5). Leia o enunciado com atenção para identificar a operação correta.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — equações (Q5 a Q8)', 15
  from d returning id
),
b_adm_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Administrativo', 'teoria', 'Organização da Administração Pública', 30, $$Administração Pública é o conjunto de órgãos, entidades e agentes que exercem atividades administrativas para atender às necessidades coletivas e executar as funções do Estado. Divide-se em Administração Direta e Administração Indireta.

ADMINISTRAÇÃO DIRETA
Formada pelos próprios entes federativos (União, Estados, DF, Municípios) e seus órgãos — unidades de atuação sem personalidade jurídica própria. Ex.: Ministérios (federal), Secretarias estaduais e municipais.

ADMINISTRAÇÃO INDIRETA
Composta por entidades com personalidade jurídica própria, criadas ou autorizadas por lei:
Autarquias — pessoas jurídicas de direito público, criadas diretamente por lei, para atividades típicas do Estado. Ex.: INSS.
Fundações públicas — destinadas a atividades de interesse social (educação, pesquisa, cultura), conforme seu regime jurídico.
Empresas públicas — pessoas jurídicas de direito privado, com capital integralmente público, podendo adotar diferentes formas societárias admitidas em lei. Ex.: Caixa Econômica Federal.
Sociedades de economia mista — pessoas jurídicas de direito privado, constituídas como sociedade anônima, com controle acionário estatal e participação de capital privado. Ex.: Banco do Brasil.

CENTRALIZAÇÃO, DESCENTRALIZAÇÃO E DESCONCENTRAÇÃO
Centralização: o próprio ente estatal executa a atividade por seus órgãos. Descentralização: a atividade é atribuída a outra pessoa jurídica, por outorga ou delegação. Desconcentração: distribuição interna de competências entre órgãos da mesma pessoa jurídica.
Exemplos: um município executa diretamente um serviço por sua secretaria → centralização. O Estado cria uma autarquia por lei para executar uma atividade → descentralização por outorga. Uma secretaria divide suas funções entre departamentos → desconcentração.
Macete: descentralização muda a pessoa jurídica responsável; desconcentração distribui competências dentro da mesma pessoa jurídica.

CRIAÇÃO E AUTORIZAÇÃO DE ENTIDADES (art. 37, XIX, CF)
Autarquia é criada por lei específica. Empresa pública, sociedade de economia mista e fundação têm sua instituição autorizada por lei específica, observadas as regras constitucionais e legais. A criação de subsidiárias e a participação em empresa privada dependem de autorização legislativa.

DIFERENÇAS IMPORTANTES
Autarquia: personalidade de direito público, capital público, forma definida em lei, criada por lei específica.
Empresa pública: personalidade de direito privado, capital integralmente público, formas admitidas em lei, instituição autorizada por lei.
Sociedade de economia mista: personalidade de direito privado, capital público e privado com controle estatal, forma de sociedade anônima, instituição autorizada por lei.
As fundações públicas exigem atenção especial — seu regime pode variar conforme a natureza e as normas que as instituem.

PEGADINHAS DE PROVA
Órgão público não é o mesmo que entidade: órgão não tem personalidade jurídica própria. Autarquia é criada por lei específica, não apenas autorizada. Empresa pública tem capital integralmente público. Sociedade de economia mista deve ser sociedade anônima. Desconcentração ocorre dentro da mesma pessoa jurídica.$$
  from d returning id
),
b_adm_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Administrativo', 'exercicios', 'Fixação — organização administrativa (Q9 a Q12)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'Segurança da informação e ameaças digitais', 20, $$Segurança da informação é o conjunto de práticas, controles e tecnologias para proteger informações contra acesso indevido, alteração, destruição ou indisponibilidade. Tríade clássica:
Confidencialidade: acesso só por pessoas autorizadas (ex.: restringir acesso a dados pessoais de servidores).
Integridade: proteger contra alterações indevidas, mantendo a exatidão (ex.: impedir alteração não autorizada de um documento oficial).
Disponibilidade: garantir que informações e sistemas estejam acessíveis quando necessário (ex.: manter sistemas de atendimento funcionando no expediente).

PRINCIPAIS AMEAÇAS
Vírus: se anexa a arquivos/programas e se propaga quando executado.
Worm: se propaga automaticamente entre sistemas, muitas vezes por rede, sem precisar de hospedeiro.
Cavalo de Troia (Trojan): se apresenta como legítimo/útil, mas executa ações maliciosas.
Ransomware: pode criptografar arquivos ou bloquear sistemas, exigindo pagamento para tentar restaurar o acesso.
Spyware: coleta informações do usuário ou de suas atividades sem autorização adequada.
Adware: exibe publicidade, podendo ser invasivo ou acompanhar outras atividades indesejadas.

GOLPES E ATAQUES
Phishing: mensagens falsas para induzir o usuário a fornecer informações ou clicar em links perigosos.
Engenharia social: manipulação psicológica para obter informações, acesso ou ações indevidas.
Força bruta: tentativa de descobrir senhas testando muitas combinações.
DDoS: tenta tornar um serviço indisponível sobrecarregando-o com tráfego de múltiplas fontes.

COMO SE PROTEGER
Senhas longas, únicas e difíceis de adivinhar; autenticação multifator sempre que possível; sistemas e programas atualizados; evitar anexos inesperados; confirmar solicitações sensíveis por canal confiável; fazer backups regulares; não reutilizar a mesma senha em vários serviços.

PEGADINHA DE PROVA
Cadeado ou HTTPS no navegador indica que a comunicação está protegida por mecanismos de segurança — isso não garante que o site seja legítimo, confiável ou livre de golpes.$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — segurança da informação (Q13 a Q16)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 6 (Q17 a Q36)', 45,
    $$Sem consulta. As 20 questões misturam Português (concordância), Matemática (equações), Administrativo (organização administrativa) e Informática (segurança) — marque as que ficar em dúvida para revisar depois.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Correção, acompanhamento e revisão programada', 25, $$CADERNO DE ERROS — DIA 6
Depois de responder, não basta saber qual alternativa está certa — entenda por que as demais não se aplicam. Registre erro e regra, por matéria. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app.

ACOMPANHAMENTO DE DESEMPENHO (referência, não previsão de aprovação)
Português: 5 questões de fixação, meta de 70% de acerto.
Matemática: 5 questões, meta de 70%.
Administrativo: 5 questões, meta de 70%.
Informática: 5 questões, meta de 70%.
(No app, confira o percentual exato de cada matéria direto no Painel.)

REVISÃO PROGRAMADA
Em 24 horas: releia os conceitos em que teve dificuldade e explique cada um com suas próprias palavras.
Em 7 dias: refaça as questões erradas sem consultar o material.
Em 30 dias: revisão geral, misturando o Dia 6 com os assuntos anteriores.
(O app já cuida disso: toda questão errada entra no caderno de erros com ciclos de revisão em 24h, 7 dias e 30 dias, visíveis no Painel.)

META DO DIA 6
Estudar concordância verbal e nominal. Resolver equações do 1º grau. Compreender Administração Direta e Indireta. Identificar ameaças digitais e princípios de segurança. Responder às questões de fixação e ao mini-simulado. Registrar os erros e as dúvidas. Marque este bloco como concluído para fechar o Dia 6.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a alternativa em que a concordância verbal está correta.',
   '{"A":"Haviam muitos candidatos aguardando.","B":"Fazem três meses que o edital foi publicado.","C":"Existe diversas oportunidades no serviço público.","D":"Havia muitos documentos sobre a mesa.","E":"Aconteceu várias mudanças no setor."}'::jsonb,
   'D', '"Havia", no sentido de existir, é impessoal e fica sempre no singular — está correto. As demais erram: "Haviam" (deveria ser singular), "Fazem" (fazer indicando tempo é impessoal, deveria ser "Faz"), "Existe diversas" (existir é pessoal, deveria ser "Existem"), "Aconteceu várias mudanças" (deveria ser "Aconteceram", concordando com "mudanças").'),

  ((select id from b_port_ex), 2, 'Português',
   'Assinale a frase com concordância nominal correta.',
   '{"A":"Seguem anexo as declarações.","B":"As candidatas estavam meio cansadas.","C":"Elas mesmo resolveram a questão.","D":"Havia menas pessoas na sala.","E":"As informações estão bastante detalhada."}'::jsonb,
   'B', '"Meio" como advérbio (= "um pouco") é invariável — está correto. As demais erram: "anexo" deveria concordar ("anexas"), "mesmo" deveria concordar como "próprio" ("mesmas"), "menas" não existe (é "menos", invariável), e "detalhada" deveria concordar com "informações" ("detalhadas").'),

  ((select id from b_port_ex), 3, 'Português',
   'Em "O diretor e os funcionários participaram da reunião", o verbo está no plural porque:',
   '{"A":"Concorda com o termo mais próximo.","B":"Concorda com o sujeito composto.","C":"É impessoal.","D":"Está em uma oração sem sujeito.","E":"Concorda com o objeto direto."}'::jsonb,
   'B', 'O sujeito composto ("o diretor e os funcionários") vem antes do verbo, por isso o verbo vai para o plural.'),

  ((select id from b_port_ex), 4, 'Português',
   'Assinale a alternativa correta quanto ao uso de "bastante".',
   '{"A":"Os candidatos estudaram bastantes para a prova.","B":"Havia bastante questões no exame.","C":"Os candidatos resolveram bastantes questões.","D":"Elas estavam bastantes cansadas, como advérbio.","E":"Precisamos de bastantes atenção."}'::jsonb,
   'C', '"Bastantes questões" está correto: aqui "bastante" equivale a "muitas" e varia, concordando com "questões". Nas demais, "bastante" é advérbio (invariável) mas aparece flexionado indevidamente, ou é adjetivo mas não concorda.'),

  -- Matemática — fixação (Q5-8)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'O valor de x na equação x + 13 = 29 é:',
   '{"A":"14","B":"15","C":"16","D":"17","E":"18"}'::jsonb,
   'C', 'x = 29 − 13 = 16.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Resolva: 4x − 8 = 20.',
   '{"A":"5","B":"6","C":"7","D":"8","E":"9"}'::jsonb,
   'C', '4x = 28 → x = 7.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'O dobro de um número, somado a 6, é igual a 30. Qual é esse número?',
   '{"A":"10","B":"11","C":"12","D":"13","E":"14"}'::jsonb,
   'C', '2x + 6 = 30 → 2x = 24 → x = 12.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Uma pessoa comprou 4 produtos iguais e pagou R$ 60. Qual o valor de cada produto?',
   '{"A":"R$ 10","B":"R$ 12","C":"R$ 15","D":"R$ 18","E":"R$ 20"}'::jsonb,
   'C', '4x = 60 → x = 15.'),

  -- Administrativo — fixação (Q9-12)
  ((select id from b_adm_ex), 1, 'Administrativo',
   'A Administração Direta é composta:',
   '{"A":"Apenas por autarquias e fundações públicas.","B":"Pelos órgãos dos entes federativos.","C":"Apenas por empresas públicas.","D":"Por todas as empresas que prestam serviços ao Estado.","E":"Exclusivamente por sociedades de economia mista."}'::jsonb,
   'B', 'Administração Direta = os próprios entes federativos e seus órgãos. Autarquias, fundações, empresas públicas e sociedades de economia mista integram a Administração Indireta.'),

  ((select id from b_adm_ex), 2, 'Administrativo',
   'Qual das alternativas apresenta uma característica de autarquia?',
   '{"A":"Personalidade jurídica de direito privado.","B":"Capital formado por recursos públicos e privados.","C":"Criação diretamente por lei específica.","D":"Constituição obrigatória como sociedade anônima.","E":"Ausência de personalidade jurídica."}'::jsonb,
   'C', 'Autarquia é criada diretamente por lei específica, tem personalidade de direito público e capital público — as demais descrevem empresa pública, sociedade de economia mista ou órgão.'),

  ((select id from b_adm_ex), 3, 'Administrativo',
   'A distribuição de competências entre departamentos de uma mesma secretaria é um exemplo de:',
   '{"A":"Descentralização.","B":"Desconcentração.","C":"Privatização.","D":"Concessão.","E":"Delegação legislativa."}'::jsonb,
   'B', 'Desconcentração: distribuição interna de competências entre órgãos da mesma pessoa jurídica.'),

  ((select id from b_adm_ex), 4, 'Administrativo',
   'Uma empresa pública caracteriza-se por:',
   '{"A":"Capital integralmente público.","B":"Capital obrigatoriamente privado.","C":"Ser órgão sem personalidade jurídica.","D":"Ser sempre constituída como sociedade anônima.","E":"Ser criada exclusivamente por decreto."}'::jsonb,
   'A', 'Empresa pública tem personalidade de direito privado com capital integralmente público — pode adotar diferentes formas societárias, não só sociedade anônima (essa é a sociedade de economia mista).'),

  -- Informática — fixação (Q13-16)
  ((select id from b_info_ex), 1, 'Informática',
   'A tríade clássica da segurança da informação é composta por:',
   '{"A":"Privacidade, velocidade e armazenamento.","B":"Confidencialidade, integridade e disponibilidade.","C":"Autenticação, navegação e criptografia.","D":"Hardware, software e rede.","E":"Backup, antivírus e firewall."}'::jsonb,
   'B', 'A tríade CID: confidencialidade, integridade e disponibilidade.'),

  ((select id from b_info_ex), 2, 'Informática',
   'Um malware que se propaga automaticamente por redes, sem necessariamente precisar se anexar a um arquivo hospedeiro, é chamado de:',
   '{"A":"Worm.","B":"Adware.","C":"Cookie.","D":"Firewall.","E":"Backup."}'::jsonb,
   'A', 'Worm se propaga automaticamente entre sistemas, muitas vezes por rede, sem precisar de um hospedeiro como o vírus.'),

  ((select id from b_info_ex), 3, 'Informática',
   'Um programa malicioso disfarçado de software legítimo é conhecido como:',
   '{"A":"Sistema operacional.","B":"Trojan.","C":"Navegador.","D":"Planilha.","E":"Protocolo."}'::jsonb,
   'B', 'Cavalo de Troia (Trojan): se apresenta como legítimo/útil, mas executa ações maliciosas.'),

  ((select id from b_info_ex), 4, 'Informática',
   'Um e-mail que simula uma mensagem oficial e solicita que o usuário informe sua senha por meio de um link é uma tentativa de:',
   '{"A":"Desfragmentação.","B":"Backup.","C":"Phishing.","D":"Atualização legítima.","E":"Compactação."}'::jsonb,
   'C', 'É a definição clássica de phishing.'),

  -- Mini-simulado (Q17-36)
  ((select id from b_simulado), 1, 'Português',
   'Assinale a alternativa em que a concordância verbal está correta.',
   '{"A":"Fazem cinco anos que ele trabalha aqui.","B":"Houveram muitos problemas no sistema.","C":"Existem várias vagas disponíveis.","D":"Deve haverem documentos pendentes.","E":"Aconteceu diversas mudanças."}'::jsonb,
   'C', '"Existir" é verbo pessoal e concorda normalmente com "várias vagas" (plural) — está correto. As demais erram "fazer"/"haver" impessoais ou a concordância com o sujeito.'),

  ((select id from b_simulado), 2, 'Português',
   'Assinale a alternativa correta quanto à concordância nominal.',
   '{"A":"As funcionárias estavam meio preocupadas.","B":"As funcionárias estavam meias preocupadas.","C":"Seguem anexo as cópias.","D":"É necessária cuidados.","E":"Havia menas pessoas."}'::jsonb,
   'A', '"Meio" como advérbio (= "um pouco") é invariável — está correto. As demais flexionam indevidamente "meio", "anexo", "necessária" (deveria ser "necessário", sem determinante) ou usam "menas", que não existe.'),

  ((select id from b_simulado), 3, 'Português',
   'Na frase "Há muitos candidatos inscritos", o verbo "haver" está no singular porque:',
   '{"A":"Concorda com candidatos.","B":"É auxiliar de um verbo pessoal.","C":"É impessoal, com sentido de existir.","D":"Está no futuro do presente.","E":"Concorda com o sujeito oculto."}'::jsonb,
   'C', '"Haver" no sentido de existir é impessoal — não tem sujeito e fica sempre na 3ª pessoa do singular.'),

  ((select id from b_simulado), 4, 'Português',
   'Em "Os servidores resolveram bastante questões", a palavra "bastante" deveria ser:',
   '{"A":"Mantida invariável em todos os casos.","B":"Substituída por bastantes, concordando com questões.","C":"Substituída por bastantemente.","D":"Substituída por bastanta.","E":"Retirada obrigatoriamente."}'::jsonb,
   'B', 'Aqui "bastante" equivale a "muitas" (adjetivo) e deve concordar com "questões": "bastantes questões".'),

  ((select id from b_simulado), 5, 'Matemática/RLM',
   'Resolva a equação: 3x + 7 = 28.',
   '{"A":"5","B":"6","C":"7","D":"8","E":"9"}'::jsonb,
   'C', '3x = 21 → x = 7.'),

  ((select id from b_simulado), 6, 'Matemática/RLM',
   'Qual é o valor de x em 6x − 12 = 30?',
   '{"A":"5","B":"6","C":"7","D":"8","E":"9"}'::jsonb,
   'C', '6x = 42 → x = 7.'),

  ((select id from b_simulado), 7, 'Matemática/RLM',
   'O triplo de um número, diminuído de 4, resulta em 23. Qual é o número?',
   '{"A":"7","B":"8","C":"9","D":"10","E":"11"}'::jsonb,
   'C', '3x − 4 = 23 → 3x = 27 → x = 9.'),

  ((select id from b_simulado), 8, 'Matemática/RLM',
   'Uma pessoa compra 5 livros iguais e paga R$ 90. Qual o preço de cada livro?',
   '{"A":"R$ 15","B":"R$ 16","C":"R$ 18","D":"R$ 20","E":"R$ 25"}'::jsonb,
   'C', '5x = 90 → x = 18.'),

  ((select id from b_simulado), 9, 'Administrativo',
   'Qual alternativa faz parte da Administração Direta?',
   '{"A":"Uma autarquia federal.","B":"Uma empresa pública.","C":"Uma secretaria municipal.","D":"Uma sociedade de economia mista.","E":"Uma fundação pública."}'::jsonb,
   'C', 'Secretaria é órgão do ente federativo — Administração Direta. As demais são entidades da Administração Indireta.'),

  ((select id from b_simulado), 10, 'Administrativo',
   'Uma autarquia é:',
   '{"A":"Um órgão sem personalidade jurídica.","B":"Uma entidade com personalidade jurídica de direito público.","C":"Uma empresa privada contratada pelo Estado.","D":"Uma sociedade anônima de capital misto.","E":"Uma unidade interna de uma secretaria."}'::jsonb,
   'B', 'Autarquia: entidade com personalidade jurídica de direito público, criada por lei específica.'),

  ((select id from b_simulado), 11, 'Administrativo',
   'A criação de departamentos dentro de um órgão, distribuindo funções internamente, é:',
   '{"A":"Descentralização.","B":"Desconcentração.","C":"Privatização.","D":"Concessão.","E":"Outorga."}'::jsonb,
   'B', 'Desconcentração: distribuição interna de competências dentro da mesma pessoa jurídica.'),

  ((select id from b_simulado), 12, 'Administrativo',
   'A sociedade de economia mista deve ser constituída sob a forma de:',
   '{"A":"Fundação privada.","B":"Autarquia.","C":"Sociedade anônima.","D":"Órgão público.","E":"Associação civil."}'::jsonb,
   'C', 'Sociedade de economia mista é constituída obrigatoriamente como sociedade anônima.'),

  ((select id from b_simulado), 13, 'Informática',
   'Qual princípio da segurança da informação garante que os dados não sejam modificados indevidamente?',
   '{"A":"Disponibilidade.","B":"Integridade.","C":"Confidencialidade.","D":"Mobilidade.","E":"Compatibilidade."}'::jsonb,
   'B', 'Integridade: proteger a informação contra alterações indevidas, mantendo sua exatidão.'),

  ((select id from b_simulado), 14, 'Informática',
   'Um malware que coleta informações do usuário sem autorização é geralmente classificado como:',
   '{"A":"Spyware.","B":"Backup.","C":"Firewall.","D":"Navegador.","E":"Sistema operacional."}'::jsonb,
   'A', 'Spyware coleta informações do usuário ou de suas atividades sem autorização adequada.'),

  ((select id from b_simulado), 15, 'Informática',
   'Qual prática ajuda a reduzir o risco de acesso indevido às contas?',
   '{"A":"Reutilizar a mesma senha.","B":"Desativar atualizações.","C":"Compartilhar senhas com colegas.","D":"Ativar autenticação multifator.","E":"Abrir anexos desconhecidos."}'::jsonb,
   'D', 'Autenticação multifator é uma das práticas recomendadas para reduzir o risco de acesso indevido.'),

  ((select id from b_simulado), 16, 'Informática',
   'O ataque DDoS busca principalmente:',
   '{"A":"Melhorar a velocidade da rede.","B":"Tornar um serviço indisponível por sobrecarga.","C":"Recuperar arquivos apagados.","D":"Atualizar o sistema operacional.","E":"Criar cópias de segurança."}'::jsonb,
   'B', 'DDoS sobrecarrega um serviço com tráfego de múltiplas fontes até torná-lo indisponível.'),

  ((select id from b_simulado), 17, 'Português',
   'Assinale a frase correta.',
   '{"A":"Fazem dois anos que estudo.","B":"Haviam documentos no arquivo.","C":"Existem documentos no arquivo.","D":"Fazem muito frio hoje.","E":"Houveram várias reuniões."}'::jsonb,
   'C', '"Existir" é pessoal e concorda com "documentos" — está correto. As demais erram "fazer"/"haver" impessoais, que deveriam ficar no singular.'),

  ((select id from b_simulado), 18, 'Matemática/RLM',
   'Resolva: 2(x + 5) = 24.',
   '{"A":"5","B":"6","C":"7","D":"8","E":"9"}'::jsonb,
   'C', '2x + 10 = 24 → 2x = 14 → x = 7.'),

  ((select id from b_simulado), 19, 'Administrativo',
   'A Caixa Econômica Federal é um exemplo de:',
   '{"A":"Autarquia.","B":"Empresa pública.","C":"Sociedade de economia mista.","D":"Órgão da Administração Direta.","E":"Fundação pública."}'::jsonb,
   'B', 'A Caixa é o exemplo clássico de empresa pública (capital integralmente público).'),

  ((select id from b_simulado), 20, 'Informática',
   'Qual opção descreve corretamente um ransomware?',
   '{"A":"Um programa que organiza pastas.","B":"Um software de apresentação.","C":"Um malware que pode bloquear ou criptografar dados e exigir resgate.","D":"Um sistema de autenticação multifator.","E":"Uma cópia de segurança."}'::jsonb,
   'C', 'Ransomware pode criptografar arquivos ou bloquear sistemas, exigindo pagamento para tentar restaurar o acesso.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
