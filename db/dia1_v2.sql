-- Substitui o Dia 1 pela versão completa e robusta.
-- Apaga o Dia 1 antigo (blocos, questões, respostas e conclusões em cascata) e recadastra do zero.
delete from days where week = 1 and day_number = 1;

with d as (
  insert into days (week, day_number, title)
  values (1, 1, 'Interpretação de texto (completo) + Constitucional arts. 1º a 4º + Lei Seca')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Interpretação e compreensão de textos — versão completa', 70, $$OBJETIVOS DE HOJE: ao final você deve conseguir identificar o assunto de um texto, encontrar a ideia principal, diferenciar informação explícita de implícita, fazer inferências, diferenciar fato de opinião, reconhecer o que não pode ser concluído, entender palavras pelo contexto, perceber relações entre frases, reconhecer paráfrases e evitar as pegadinhas mais comuns das bancas.

1. COMPREENSÃO × INTERPRETAÇÃO
Compreensão é o que está diretamente no texto. Ex.: "João saiu de casa às 7h e chegou ao trabalho às 8h." → Que horas João saiu? 7h. Não precisa interpretar, está explícito.
Interpretação é o que podemos concluir a partir do texto. Ex.: "João saiu às 7h. Como havia muito trânsito, chegou às 8h." → Podemos concluir que o trânsito contribuiu para o tempo de deslocamento — não foi dito nessas palavras, mas é dedutível.
Pegadinha clássica: uma alternativa pode parecer lógica, combinar com o assunto e até ser verdadeira na vida real, mas não pode ser concluída pelo texto — está errada. Regra de ouro: não responda com o que você sabe sobre o mundo; responda com o que o texto permite afirmar.

2. INFORMAÇÃO EXPLÍCITA
Escrita claramente. Ex.: "Maria trabalha em uma agência bancária desde 2022." → dá para afirmar isso sem nenhuma inferência.

3. INFORMAÇÃO IMPLÍCITA
Não aparece diretamente, mas pode ser deduzida. Ex.: "Carlos pegou o guarda-chuva antes de sair de casa." → podemos inferir que havia possibilidade de chuva, mas não podemos afirmar "estava chovendo" — o texto não disse isso; podia estar só nublado.

4. INFERÊNCIA
É concluir algo a partir das informações disponíveis, sem inventar dados novos. Ex.: "Ana chegou ao escritório com os cabelos e as roupas molhadas." → podemos inferir que teve contato com água ou chuva, mas não podemos afirmar "Ana tomou banho antes de ir trabalhar" — isso é extrapolação.

5. EXTRAPOLAÇÃO
É ir além do que o texto permite. Ex.: "Pedro estudou bastante para a prova." → podemos concluir que ele se dedicou; não podemos concluir que "será aprovado" — estudar bastante não garante aprovação.
Pegadinha importante: "A empresa aumentou suas vendas no último trimestre" NÃO autoriza concluir "a empresa apresentou crescimento econômico sustentável". O texto fala só de vendas — não de sustentabilidade, lucro ou número de funcionários. A banca usa uma informação verdadeira e relacionada, mas não autorizada pelo texto.

6. ASSUNTO × IDEIA PRINCIPAL
Assunto é o tema geral (ex.: "tecnologia e mercado de trabalho"). Ideia principal é o que o autor efetivamente defende sobre esse assunto (ex.: "o avanço tecnológico transforma o mercado de trabalho, eliminando funções e criando outras"). Não confunda os dois.

7. COMO ENCONTRAR A IDEIA PRINCIPAL
Pergunte: (1) sobre o que o texto fala? → assunto. (2) o que o autor diz sobre esse assunto? → ideia principal. (3) qual mensagem permanece se eu tirar os exemplos? → provavelmente a ideia central.

8. EXEMPLO
"A utilização de aplicativos bancários cresceu nos últimos anos. Muitos clientes passaram a realizar pagamentos, transferências e consultas sem ir às agências. Apesar da praticidade, o avanço dessas ferramentas também exige atenção com a segurança das informações."
Assunto: aplicativos bancários. Ideia principal: os aplicativos aumentaram a praticidade, mas exigem cuidado com segurança. Só dizer "aplicativos bancários cresceram" é insuficiente — é apenas um dado do texto.

9. FATO × OPINIÃO
Fato é verificável objetivamente ("O Brasil possui 26 estados e o Distrito Federal."). Opinião é avaliação ou julgamento ("Os aplicativos bancários são muito mais eficientes do que as agências tradicionais."). Palavras que costumam indicar opinião: melhor, pior, excelente, ruim, necessário, absurdo, inadequado, importante, eficiente, maravilhoso, preocupante — mas o contexto sempre importa, não basta caçar adjetivos.

10. OPINIÃO DO AUTOR × OPINIÃO DE TERCEIRO
"Segundo especialistas, a mudança poderá reduzir custos" não é o autor afirmando que vai reduzir custos — é ele relatando a opinião de terceiros. As bancas exploram bastante essa diferença.

11. PALAVRAS NO CONTEXTO
Uma palavra muda de sentido conforme a frase. "A operação foi pesada" pode significar "com muito peso", "difícil", "intensa", "severa" — o contexto decide.

12. COESÃO
É a ligação entre as partes do texto. Ex.: "João comprou um carro. Ele pretende utilizá-lo para trabalhar." — "Ele" retoma João, "-lo" retoma carro.

13. REFERENCIAÇÃO
A banca pode perguntar a quem um pronome se refere. Ex.: "Carlos encontrou Paulo quando ele saiu do banco." — há ambiguidade: quem saiu, Carlos ou Paulo? Questões de referência pronominal aparecem bastante.

14. PARÁFRASE
É dizer a mesma ideia com outras palavras, mantendo o sentido. "O servidor deve cumprir rigorosamente as normas." ↔ "É necessário que o servidor observe rigorosamente as normas."

15. COMANDOS IMPORTANTES DAS QUESTÕES
"De acordo com o texto..." → procure a informação no texto. "Infere-se..." / "Depreende-se..." → procure uma conclusão possível a partir do texto. "É correto afirmar..." → analise todas as alternativas. "Não se pode concluir..." → procure a alternativa que extrapola. "Segundo o texto..." → não coloque sua opinião.

TÉCNICA DE PROVA
Passo 1: leia primeiro o comando da questão. Passo 2: leia o texto procurando assunto, ideia principal, opinião e informações importantes. Passo 3: volte ao trecho relacionado à pergunta. Passo 4: elimine alternativas que exageram, generalizam, acrescentam informações, distorcem o texto, trocam causa por consequência ou apresentam opinião como fato.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 2, 'Português', 'exercicios', 'Questões sobre compras pela internet (Q1 a Q10)', 40,
    $$Texto-base para as 10 questões: "O crescimento das compras realizadas pela internet modificou hábitos de consumo. Antes de adquirir determinado produto, muitos consumidores passaram a pesquisar preços, avaliações e condições de entrega em diferentes plataformas. Essa facilidade, entretanto, não elimina a necessidade de atenção. Informações sobre vendedores, formas de pagamento e políticas de devolução devem ser verificadas antes da conclusão da compra."$$
  from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Constitucional', 'teoria', 'Constituição Federal — arts. 1º a 4º (versão completa)', 70, $$O QUE É UMA CONSTITUIÇÃO?
É a norma fundamental que organiza o Estado, estabelece direitos e deveres fundamentais e define a estrutura e os limites do poder estatal. A Constituição Federal brasileira é de 1988.

ARTIGO 1º
O Brasil é a República Federativa do Brasil e constitui-se em Estado Democrático de Direito. "Estado" = organização política e jurídica. "Democrático" = poder político fundado na soberania popular. "De Direito" = o próprio Estado está submetido às normas jurídicas.

FUNDAMENTOS DA REPÚBLICA (art. 1º) — cinco:
I) Soberania II) Cidadania III) Dignidade da pessoa humana IV) Valores sociais do trabalho e da livre iniciativa V) Pluralismo político.
Macete: SO-CI-DI-VA-PLU (SOberania, CIdadania, DIgnidade, VAlores sociais do trabalho e livre iniciativa, PLUralismo político) — memorize nessa ordem.

Soberania: poder supremo do Estado na sua ordem jurídica e independência perante outros Estados. Cuidado: no art. 1º, soberania é fundamento; no art. 4º aparece "independência nacional" como princípio das relações internacionais — a banca gosta de trocar os dois.
Cidadania: participação do indivíduo na vida política e social (votar, participar da vida pública, exercer direitos políticos, cumprir deveres civis).
Dignidade da pessoa humana: fundamento — a pessoa tem valor próprio e deve ser tratada com respeito e proteção jurídica. Não confunda com objetivo ou princípio internacional.
Valores sociais do trabalho e da livre iniciativa: a Constituição coloca lado a lado valorização social do trabalho e livre iniciativa.
Pluralismo político: fundamento relacionado à existência e convivência de diferentes ideias e posições políticas. Pegadinha: "pluralismo político é objetivo fundamental" está errado — é fundamento.

Parágrafo único do art. 1º: todo o poder emana do povo, que o exerce por meio de representantes eleitos ou diretamente, nos termos da Constituição.

ARTIGO 2º — OS PODERES
São Poderes da União: Legislativo, Executivo e Judiciário, independentes e harmônicos entre si. Pegadinha: não é "independentes OU harmônicos" — é "independentes E harmônicos entre si".
Funções típicas: Legislativo legisla e fiscaliza; Executivo administra; Judiciário julga. Isso não significa exclusividade — existem funções típicas e atípicas, mas por enquanto memorize a literalidade do art. 2º.

ARTIGO 3º — OBJETIVOS FUNDAMENTAIS
Diferente do art. 1º (fundamentos), o art. 3º traz objetivos fundamentais — quatro:
I) Construir uma sociedade livre, justa e solidária.
II) Garantir o desenvolvimento nacional.
III) Erradicar a pobreza e a marginalização e reduzir as desigualdades sociais e regionais.
IV) Promover o bem de todos, sem preconceitos de origem, raça, sexo, cor, idade e quaisquer outras formas de discriminação.
Macete: CONSTRUIR → GARANTIR → ERRADICAR → PROMOVER.

FUNDAMENTO × OBJETIVO — decore a diferença:
Fundamentos (art. 1º) = SO-CI-DI-VA-PLU. Objetivos (art. 3º) = Construir → Garantir → Erradicar → Promover.
Se a questão perguntar "a erradicação da pobreza é fundamento?" a resposta é não — é objetivo fundamental.

ARTIGO 4º — PRINCÍPIOS DAS RELAÇÕES INTERNACIONAIS
I) Independência nacional II) Prevalência dos direitos humanos III) Autodeterminação dos povos IV) Não intervenção V) Igualdade entre os Estados VI) Defesa da paz VII) Solução pacífica dos conflitos VIII) Repúdio ao terrorismo e ao racismo IX) Cooperação entre os povos para o progresso da humanidade X) Concessão de asilo político.
Como memorizar, em blocos: Bloco 1 (soberania) — independência nacional, autodeterminação dos povos, não intervenção, igualdade entre Estados. Bloco 2 (direitos e paz) — prevalência dos direitos humanos, defesa da paz, solução pacífica dos conflitos. Bloco 3 (combate e cooperação) — repúdio ao terrorismo e ao racismo, cooperação entre os povos. Bloco 4 — concessão de asilo político.
Parágrafo único do art. 4º: a República buscará a integração econômica, política, social e cultural dos povos da América Latina, visando à formação de uma comunidade latino-americana de nações.

QUADRO PARA DECORAR
Art. 1º = Fundamentos (SO-CI-DI-VA-PLU) | Art. 2º = Poderes (independentes e harmônicos) | Art. 3º = Objetivos (Construir/Garantir/Erradicar/Promover) | Art. 4º = Relações internacionais (10 princípios).

PEGADINHAS PARA EVITAR
1) "Dignidade da pessoa humana é objetivo fundamental" — errado, é fundamento.
2) "Desenvolvimento nacional é fundamento" — errado, é objetivo fundamental.
3) "Pluralismo político é princípio das relações internacionais" — errado, é fundamento.
4) "Independência nacional é fundamento" — errado, no art. 4º é princípio das relações internacionais.
5) "Os Poderes são independentes ou harmônicos" — errado, são independentes E harmônicos entre si.
6) "Todo poder emana do Estado" — errado, a Constituição diz que todo poder emana do povo.$$
  from d returning id
),
b_lei_seca as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 4, 'Constitucional', 'revisao', 'Lei Seca — leitura literal dos arts. 1º a 4º', 20, $$Pegue a Constituição Federal e leia literalmente, sem parafrasear:
- Art. 1º e seu parágrafo único
- Art. 2º
- Art. 3º
- Art. 4º e seu parágrafo único

Como estudar a Lei Seca:
1ª leitura: normal, sem parar.
2ª leitura: destaque fundamentos, poderes, objetivos e princípios internacionais.
3ª leitura: feche o texto e tente falar de memória — por exemplo, "quais são os cinco fundamentos?" — sem olhar.

Marque este bloco como concluído quando tiver feito as três leituras.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 5, 'Constitucional', 'exercicios', 'Questões sobre os arts. 1º a 4º (Q11 a Q20)', 30
  from d returning id
),
b_rev as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 6, 'Revisão/Simulados', 'revisao', 'Desafio final sem consulta', 10, $$Sem olhar o material, tente responder:
1. Quais são os cinco fundamentos do art. 1º?
2. Quais são os três Poderes?
3. Eles são independentes e...?
4. Quais são os quatro objetivos do art. 3º?
5. Cite pelo menos cinco princípios do art. 4º.
6. Qual a diferença entre fundamento e objetivo?
7. O pluralismo político pertence a qual artigo?
8. O desenvolvimento nacional pertence a qual artigo?
9. A prevalência dos direitos humanos pertence a qual artigo?
10. Quem é o titular do poder?

Depois disso, vá para o caderno de erros: anote questões erradas, questões que você acertou "no chute" e conceitos que ainda confunde. Marque este bloco como concluído para fechar o Dia 1.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_port_ex), 1, 'Português',
   'O assunto principal do texto é:',
   '{"A":"A redução das lojas físicas.","B":"O crescimento das compras pela internet e os cuidados necessários ao consumidor.","C":"A dificuldade dos consumidores para encontrar produtos.","D":"A obrigatoriedade de pesquisar preços antes das compras.","E":"A superioridade das compras virtuais sobre as presenciais."}'::jsonb,
   'B', 'O texto trata do crescimento das compras pela internet e dos cuidados que o consumidor ainda precisa ter. As demais alternativas são detalhes, distorções ou extrapolações.'),

  ((select id from b_port_ex), 2, 'Português',
   'Segundo o texto, os consumidores passaram a:',
   '{"A":"comprar exclusivamente pela internet.","B":"deixar de analisar preços.","C":"pesquisar diferentes informações antes da compra.","D":"abandonar as lojas físicas.","E":"utilizar somente uma plataforma de vendas."}'::jsonb,
   'C', 'O texto diz que os consumidores passaram a pesquisar preços, avaliações e condições de entrega em diferentes plataformas.'),

  ((select id from b_port_ex), 3, 'Português',
   'A expressão "Essa facilidade" refere-se:',
   '{"A":"à existência das lojas físicas.","B":"à redução dos preços.","C":"à possibilidade de pesquisar informações em diferentes plataformas.","D":"à obrigatoriedade de devolução dos produtos.","E":"às formas de pagamento."}'::jsonb,
   'C', '"Essa facilidade" retoma a possibilidade de pesquisar preços, avaliações e condições de entrega antes de comprar.'),

  ((select id from b_port_ex), 4, 'Português',
   'Pode-se inferir corretamente que:',
   '{"A":"toda compra pela internet apresenta riscos.","B":"pesquisar informações pode contribuir para uma decisão de compra mais cuidadosa.","C":"as compras presenciais são mais seguras.","D":"os consumidores não conhecem políticas de devolução.","E":"os preços da internet são sempre menores."}'::jsonb,
   'B', 'É a única inferência sustentada pelo texto; as demais extrapolam ("toda", "sempre") ou invertem informações não ditas.'),

  ((select id from b_port_ex), 5, 'Português',
   'O texto apresenta predominantemente:',
   '{"A":"uma narrativa ficcional.","B":"uma descrição de personagem.","C":"uma orientação relacionada ao consumo pela internet.","D":"uma crítica às empresas de comércio eletrônico.","E":"uma propaganda comercial."}'::jsonb,
   'C', 'O texto orienta sobre cuidados ao comprar pela internet — não narra, não descreve personagem, não critica empresas nem promove produtos.'),

  ((select id from b_port_ex), 6, 'Português',
   'A afirmação "os preços da internet são sempre menores que os das lojas físicas" seria:',
   '{"A":"uma informação explícita.","B":"uma informação implícita autorizada pelo texto.","C":"uma extrapolação.","D":"uma paráfrase.","E":"uma conclusão obrigatória."}'::jsonb,
   'C', 'O texto não fala em preços "sempre menores" — isso vai além do que está escrito: é extrapolação.'),

  ((select id from b_port_ex), 7, 'Português',
   'Em "Essa facilidade, entretanto, não elimina a necessidade de atenção", a palavra "entretanto" estabelece ideia de:',
   '{"A":"conclusão.","B":"oposição/contraste.","C":"causa.","D":"finalidade.","E":"explicação."}'::jsonb,
   'B', '"Entretanto" é conjunção adversativa: contrapõe a facilidade das compras à necessidade de atenção.'),

  ((select id from b_port_ex), 8, 'Português',
   'A finalidade principal do último período é:',
   '{"A":"apresentar produtos específicos.","B":"determinar o preço das compras.","C":"recomendar cuidados antes da conclusão da compra.","D":"explicar como funciona uma plataforma.","E":"criticar os consumidores."}'::jsonb,
   'C', 'O último período lista o que deve ser verificado (vendedores, pagamento, devolução) antes de concluir a compra — é uma recomendação de cuidado.'),

  ((select id from b_port_ex), 9, 'Português',
   'Assinale a alternativa que apresenta uma informação não autorizada pelo texto:',
   '{"A":"Os consumidores podem pesquisar avaliações.","B":"É possível comparar preços.","C":"É importante observar as condições de entrega.","D":"Todos os consumidores preferem comprar pela internet.","E":"As políticas de devolução devem ser verificadas."}'::jsonb,
   'D', 'O texto fala em "muitos consumidores", nunca em "todos" — a alternativa D extrapola.'),

  ((select id from b_port_ex), 10, 'Português',
   'Uma paráfrase adequada do texto seria:',
   '{"A":"As compras virtuais eliminaram completamente os hábitos tradicionais de consumo.","B":"O comércio eletrônico tornou desnecessária a análise das condições da compra.","C":"A internet ampliou as possibilidades de pesquisa, mas o consumidor ainda deve verificar informações antes de comprar.","D":"Os consumidores não precisam mais comparar preços.","E":"As lojas virtuais são necessariamente mais vantajosas."}'::jsonb,
   'C', 'C mantém a mesma ideia do texto com outras palavras: mais possibilidade de pesquisa, mas sem dispensar a verificação. As demais invertem ou exageram o sentido.'),

  ((select id from b_const_ex), 1, 'Constitucional',
   'Constitui fundamento da República Federativa do Brasil:',
   '{"A":"desenvolvimento nacional.","B":"erradicação da pobreza.","C":"pluralismo político.","D":"defesa da paz.","E":"solução pacífica dos conflitos."}'::jsonb,
   'C', 'Pluralismo político é fundamento (art. 1º, V). As demais são objetivo fundamental (art. 3º) ou princípios das relações internacionais (art. 4º).'),

  ((select id from b_const_ex), 2, 'Constitucional',
   'São Poderes da União:',
   '{"A":"Legislativo, Executivo e Moderador.","B":"Executivo, Judiciário e Militar.","C":"Legislativo, Executivo e Judiciário.","D":"Judiciário, Militar e Executivo.","E":"Legislativo, Popular e Executivo."}'::jsonb,
   'C', 'Art. 2º: Legislativo, Executivo e Judiciário.'),

  ((select id from b_const_ex), 3, 'Constitucional',
   'Os Poderes da União são:',
   '{"A":"subordinados entre si.","B":"independentes e harmônicos entre si.","C":"independentes e hierarquicamente organizados.","D":"autônomos e subordinados ao Executivo.","E":"independentes, mas não harmônicos."}'::jsonb,
   'B', 'A literalidade do art. 2º exige "independentes E harmônicos entre si" — não é "ou".'),

  ((select id from b_const_ex), 4, 'Constitucional',
   'Constitui objetivo fundamental da República Federativa do Brasil:',
   '{"A":"soberania.","B":"cidadania.","C":"pluralismo político.","D":"garantir o desenvolvimento nacional.","E":"dignidade da pessoa humana."}'::jsonb,
   'D', 'Garantir o desenvolvimento nacional é objetivo fundamental (art. 3º, II). As demais são fundamentos (art. 1º).'),

  ((select id from b_const_ex), 5, 'Constitucional',
   'A erradicação da pobreza e da marginalização constitui:',
   '{"A":"fundamento da República.","B":"princípio internacional.","C":"objetivo fundamental.","D":"direito individual.","E":"princípio da Administração Pública."}'::jsonb,
   'C', 'Art. 3º, III: erradicar a pobreza e a marginalização é objetivo fundamental.'),

  ((select id from b_const_ex), 6, 'Constitucional',
   'A prevalência dos direitos humanos está prevista como:',
   '{"A":"fundamento da República.","B":"objetivo fundamental.","C":"princípio das relações internacionais.","D":"princípio da Administração Pública.","E":"direito social."}'::jsonb,
   'C', 'Art. 4º, II: prevalência dos direitos humanos é princípio das relações internacionais.'),

  ((select id from b_const_ex), 7, 'Constitucional',
   'Assinale a alternativa que apresenta exclusivamente fundamentos da República:',
   '{"A":"soberania, cidadania e dignidade da pessoa humana.","B":"desenvolvimento nacional, cidadania e defesa da paz.","C":"pluralismo político, defesa da paz e soberania.","D":"erradicação da pobreza, cidadania e livre iniciativa.","E":"cooperação entre os povos, soberania e cidadania."}'::jsonb,
   'A', 'Soberania, cidadania e dignidade da pessoa humana são os três primeiros fundamentos do art. 1º. As demais alternativas misturam objetivos (art. 3º) e princípios internacionais (art. 4º).'),

  ((select id from b_const_ex), 8, 'Constitucional',
   'Assinale a alternativa que apresenta exclusivamente objetivos fundamentais:',
   '{"A":"soberania, cidadania e pluralismo político.","B":"construir sociedade livre, justa e solidária; garantir o desenvolvimento nacional; promover o bem de todos.","C":"defesa da paz; solução pacífica dos conflitos; não intervenção.","D":"dignidade da pessoa humana; desenvolvimento nacional; cidadania.","E":"prevalência dos direitos humanos; erradicação da pobreza; soberania."}'::jsonb,
   'B', 'Os três itens de B são objetivos fundamentais do art. 3º (I, II e IV). As demais misturam fundamentos e princípios internacionais.'),

  ((select id from b_const_ex), 9, 'Constitucional',
   'É princípio que rege as relações internacionais da República Federativa do Brasil:',
   '{"A":"pluralismo político.","B":"livre iniciativa.","C":"dignidade da pessoa humana.","D":"não intervenção.","E":"cidadania."}'::jsonb,
   'D', 'Não intervenção é princípio das relações internacionais (art. 4º, IV). As demais são fundamentos do art. 1º.'),

  ((select id from b_const_ex), 10, 'Constitucional',
   'Segundo a Constituição Federal, todo o poder:',
   '{"A":"emana do Estado.","B":"emana do Governo Federal.","C":"emana dos Poderes da União.","D":"emana do povo.","E":"emana do Poder Executivo."}'::jsonb,
   'D', 'Parágrafo único do art. 1º: todo o poder emana do povo, que o exerce por representantes eleitos ou diretamente.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
