-- Cadastra o Dia 12 (versão completa e robusta).
delete from days where week = 3 and day_number = 2;

with d as (
  insert into days (week, day_number, title)
  values (3, 2, 'Concordância verbal/nominal + equações do 1º grau + nacionalidade/direitos políticos + internet/navegadores/cookies/cache')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Concordância verbal e nominal — núcleo do sujeito, haver/fazer, anexo/obrigado/mesmo', 30, $$CONCORDÂNCIA VERBAL — o verbo e o sujeito
Regra geral: o verbo concorda com o núcleo do sujeito em número e pessoa. "Os servidores do departamento organizaram os documentos." — quem organizou? Os servidores. O núcleo é "servidores" (plural), por isso "organizaram". "Do departamento" só complementa, não muda o núcleo.
Pegadinha: "Os documentos do servidor está na mesa" está errado — o núcleo é "documentos" (plural): "Os documentos do servidor estão na mesa." Não deixe uma palavra singular perto do verbo te enganar sobre o verdadeiro núcleo.

SUJEITO COMPOSTO
Com dois ou mais núcleos, o verbo geralmente vai para o plural: "Maria e João estudam juntos."; "O diretor e os funcionários participaram da reunião."; "Português e Matemática exigem prática."

VERBO "HAVER" COM SENTIDO DE EXISTIR
É impessoal, 3ª pessoa do singular: "Há muitos candidatos na sala."; "Havia vários documentos sobre a mesa."; "Haverá novas oportunidades." Incorreto nesse sentido: "Hão muitos candidatos", "Haviam vários documentos".
"Existir" concorda normalmente com o sujeito: "Existem muitos candidatos na sala."; "Existiam vários documentos."
Macete: troque mentalmente "haver" por "existir" — se o sentido é de existência, "haver" fica no singular.

VERBO "FAZER" INDICANDO TEMPO
Também impessoal quando indica tempo decorrido ou fenômeno meteorológico: "Faz dois anos que comecei a estudar."; "Fazia três meses que ele trabalhava no setor."; "Faz muitos dias que não chove." Incorreto nesse sentido: "Fazem dois anos que comecei a estudar." Compare: "Os funcionários fazem os relatórios" — aqui há sujeito ("os funcionários"), e o verbo concorda normalmente com ele.

CONCORDÂNCIA COM "A MAIORIA DE"
O verbo pode ficar no singular (concordando com "maioria") ou, em construções admitidas, no plural (concordando com o termo que vem depois): "A maioria dos candidatos acertou a questão." / "A maioria dos candidatos acertaram a questão." Em prova, analise a construção completa e o padrão exigido.

CONCORDÂNCIA NOMINAL
Artigo e adjetivo acompanham gênero e número do substantivo: "O documento correto." / "Os documentos corretos." / "A resposta correta." / "As respostas corretas."
"As funcionárias estavam cansado" está errado — o adjetivo precisa concordar: "As funcionárias estavam cansadas."

ANEXO, OBRIGADO, MESMO
Anexo (como adjetivo) concorda com o substantivo: "Segue anexo o documento." / "Seguem anexos os documentos." / "Segue anexa a declaração." / "Seguem anexas as declarações." Mas "em anexo" é expressão invariável: "Os documentos seguem em anexo."
Obrigado concorda com quem agradece: homem diz "Muito obrigado"; mulher diz "Muito obrigada".
Mesmo (= "próprio") concorda com o termo a que se refere: "Ela mesma resolveu o problema." / "Eles mesmos resolveram o problema." Cuidado: em "mesmo assim", a palavra não exerce essa função.

"É PROIBIDO" OU "É PROIBIDA"?
Sem determinante, a expressão tende ao masculino singular: "É proibido entrada." Com artigo/determinante, concorda com o substantivo: "É proibida a entrada." Para evitar dúvida, prefira: "A entrada é proibida." ou "É proibida a entrada de pessoas não autorizadas."$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — concordância verbal e nominal (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Equações do 1º grau: operações inversas, duas operações e problemas em palavras', 35, $$O QUE É UMA EQUAÇÃO
Igualdade com um ou mais valores desconhecidos (incógnitas), normalmente letras. Ex.: x + 5 = 12 → x = 12 − 5 = 7 (confira: 7 + 5 = 12).

OPERAÇÕES INVERSAS
Soma ↔ subtração. Multiplicação ↔ divisão. Potência ↔ radiciação (em situações apropriadas). Ex.: x + 8 = 20 → x = 20 − 8 = 12. x − 6 = 14 → x = 14 + 6 = 20.
"Passar para o outro lado trocando o sinal" é um atalho de linguagem — o raciocínio correto é aplicar a mesma operação nos dois lados da igualdade.

EQUAÇÃO COM MULTIPLICAÇÃO
4x = 28 → divida os dois lados por 4 → x = 7. 5x = 45 → x = 9.

EQUAÇÃO COM DUAS OPERAÇÕES
3x + 6 = 24. Passo 1: subtraia 6 dos dois lados → 3x = 18. Passo 2: divida por 3 → x = 6. Confira substituindo: 3×6+6 = 24 → 24=24. ✓

INCÓGNITA NOS DOIS LADOS
5x + 4 = 2x + 19. Subtraia 2x dos dois lados: 3x + 4 = 19. Subtraia 4: 3x = 15. Divida por 3: x = 5. Confira: 5×5+4 = 2×5+19 → 29=29. ✓

PROBLEMAS EM PALAVRAS
Idade: "o dobro da idade de uma pessoa, somado a 6, é igual a 30" → 2x + 6 = 30 → 2x = 24 → x = 12 anos.
Compra: "um caderno custa R$ 8 a mais que uma caneta; juntos custam R$ 20" → caneta = x, caderno = x+8 → x + (x+8) = 20 → 2x+8=20 → 2x=12 → x=6 (caneta R$6, caderno R$14; confira: 6+14=20).

TRADUZINDO ENUNCIADOS
"Um número mais 7" → x+7. "Um número menos 4" → x−4. "O dobro de um número" → 2x. "O triplo" → 3x. "A metade" → x/2. "O dobro de um número mais 5" → 2x+5. "O dobro da soma de um número com 5" → 2(x+5).
Pegadinha: 2x+5 e 2(x+5)=2x+10 NÃO são a mesma coisa — os parênteses mudam o resultado. Leia o enunciado com atenção.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — equações do 1º grau (Q1 a Q4)', 15
  from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Nacionalidade (arts. 12-13) e direitos políticos (arts. 14-16)', 30, $$NACIONALIDADE
Vínculo jurídico-político que liga uma pessoa a um Estado. A Constituição diferencia brasileiros natos e naturalizados — importante porque alguns cargos e regras são específicos para natos.

BRASILEIROS NATOS (art. 12, I)
1) Nascidos no Brasil, ainda que de pais estrangeiros, desde que estes não estejam a serviço de seu país.
2) Nascidos no exterior, de pai brasileiro ou mãe brasileira, quando qualquer dos pais estiver a serviço da República Federativa do Brasil.
3) Nascidos no exterior, de pai brasileiro ou mãe brasileira, se registrados em repartição brasileira competente, ou se vierem a residir no Brasil e optarem, após a maioridade, pela nacionalidade brasileira.
Pegadinha: "toda pessoa nascida no Brasil é brasileira nata, sem nenhuma exceção" está errado — há a exceção dos pais estrangeiros a serviço de seu país.

BRASILEIROS NATURALIZADOS (art. 12, II)
Estrangeiros que adquirem a nacionalidade brasileira mediante requisitos constitucionais e legais: na forma da lei (com condições específicas para originários de países de língua portuguesa); ou estrangeiros de qualquer nacionalidade residentes no Brasil há mais de 15 anos ininterruptos e sem condenação penal, que requeiram a nacionalidade. Atenção: a naturalização não é automática só pelo tempo de residência.

CARGOS PRIVATIVOS DE BRASILEIRO NATO (art. 12, §3º)
Presidente e Vice-Presidente da República; Presidente da Câmara dos Deputados; Presidente do Senado Federal; Ministro do Supremo Tribunal Federal; carreira diplomática; oficial das Forças Armadas; Ministro de Estado da Defesa.
Pegadinha: nem todo Ministro de Estado precisa ser nato — só o da Defesa está nessa lista específica. E a exigência de nato para Presidente/Vice não se estende a todos os cargos eletivos.

DIREITOS POLÍTICOS
Direitos relacionados à participação do cidadão na vida política: votar, candidatar-se (cumpridas as condições), participar de mecanismos de democracia direta. A soberania popular é exercida pelo sufrágio universal e pelo voto direto e secreto, com valor igual para todos, entre outras formas do art. 14.

VOTO OBRIGATÓRIO × FACULTATIVO
Obrigatório: alfabetizados maiores de 18 e menores de 70 anos. Facultativo: analfabetos; maiores de 70 anos; maiores de 16 e menores de 18 anos. Menor de 16 anos não pode se alistar como eleitor.
Pegadinha: para jovem de 16/17 anos, o voto é facultativo, não obrigatório.

CONDIÇÕES DE ELEGIBILIDADE (art. 14, §3º)
Nacionalidade brasileira; pleno exercício dos direitos políticos; alistamento eleitoral; domicílio eleitoral na circunscrição; filiação partidária; idade mínima para o cargo.
Idades mínimas: Presidente/Vice-Presidente e Senador — 35 anos. Governador/Vice-Governador — 30 anos. Deputado Federal, Estadual/Distrital, Prefeito, Vice-Prefeito e juiz de paz — 21 anos. Vereador — 18 anos.

QUEM NÃO PODE SE ALISTAR COMO ELEITOR (art. 14, §2º)
Estrangeiros e, durante o serviço militar obrigatório, os conscritos. Não confunda com brasileiros naturalizados — eles podem votar e, cumpridas as condições, concorrer a cargos (ressalvadas restrições específicas, como os cargos privativos de nato).

PERDA E SUSPENSÃO DOS DIREITOS POLÍTICOS (art. 15)
É vedada a cassação de direitos políticos; a perda/suspensão só ocorre nos casos do próprio artigo: cancelamento de naturalização por sentença transitada em julgado; incapacidade civil absoluta; condenação criminal transitada em julgado (enquanto durarem os efeitos); recusa de cumprir obrigação a todos imposta ou prestação alternativa (art. 5º, VIII); improbidade administrativa (art. 37, §4º). Perda e suspensão não são sinônimos em toda situação — é preciso analisar a hipótese.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — nacionalidade e direitos políticos (Q1 a Q4)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'Internet, navegadores, URL, HTTPS, cookies, cache, histórico e navegação privada', 25, $$INTERNET, WEB E NAVEGADOR
Internet: infraestrutura mundial de redes interconectadas. Web: conjunto de recursos/páginas acessados pela internet, geralmente via navegador. Navegador: programa de acesso à web (Chrome, Firefox, Edge, Safari). Mecanismo de busca: serviço para localizar informações na web (Google, Bing).
Pegadinha: Chrome é navegador; a Pesquisa Google é mecanismo de busca — são coisas diferentes.

URL
Endereço para localizar um recurso na web. Ex.: https://www.exemplo.com.br/concursos/edital.pdf — protocolo (https://), domínio (www.exemplo.com.br), caminho (/concursos/edital.pdf); pode ter também parâmetros, porta e fragmento.
Endereço suspeito: golpistas imitam domínios de bancos/órgãos com pequenas alterações (ex.: banco-exemplo-seguro-falso.com em vez de bancoexemplo.com.br). Não clique em links suspeitos — digite o endereço oficial conhecido ou use o app oficial.

HTTP E HTTPS
HTTP: protocolo de comunicação entre navegador e servidor. HTTPS: HTTP protegido por TLS — criptografa a comunicação, protege a integridade dos dados e autentica o servidor por certificado digital. Pegadinha: HTTPS não garante que o site seja honesto — um site fraudulento também pode usar HTTPS. O cadeado não substitui a verificação do domínio.

COOKIES
Pequenos dados armazenados pelo navegador a pedido de um site — mantêm sessão, lembram preferências, guardam carrinho de compras, ajudam em medição de uso. Ex.: login mantido ao navegar entre páginas = cookie de sessão. Cookies não são vírus por definição, mas informações de sessão podem ser alvo de roubo, e cookies de rastreamento acompanham a navegação.

CACHE
Área de armazenamento temporário para recursos reutilizáveis (imagens, folhas de estilo), tornando o carregamento mais rápido em visitas futuras. Cookies ≠ cache: cookies tratam de sessão/preferências; cache trata de reaproveitar recursos. Ambos podem ser apagados, mas não são a mesma coisa.

HISTÓRICO
Registro das páginas visitadas (conforme configurações/modo de navegação) — diferente de cookies e cache. Apagar o histórico não apaga necessariamente cookies, senhas salvas ou cache — depende das opções escolhidas na limpeza.

NAVEGAÇÃO PRIVADA (ANÔNIMA)
Reduz os dados armazenados localmente após a sessão — ao fechar as janelas privadas, geralmente descarta histórico local e cookies temporários daquela sessão. Mas NÃO torna o usuário invisível: empregador, escola, provedor ou os próprios sites podem continuar registrando atividades, dependendo da rede e dos serviços. Pegadinha: "modo anônimo impede que qualquer pessoa saiba quais sites foram acessados" está errado.

DOWNLOAD × UPLOAD
Download: transferência de dados de um sistema remoto para o dispositivo do usuário (ex.: baixar um edital em PDF). Upload: transferência do dispositivo do usuário para um sistema remoto (ex.: enviar currículo a um site, anexar arquivo a um formulário online).$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — internet, navegadores, cookies e cache (Q1 a Q4)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 12, 3 questões por matéria (Q17 a Q28)', 40,
    $$Sem consulta. 12 questões, 3 de cada matéria: Português (concordância), Matemática (equações do 1º grau), Constitucional (nacionalidade/direitos políticos) e Informática (internet/navegadores).$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Revisão, caderno de erros e checklist do Dia 12', 20, $$O QUE REVISAR AMANHÃ (10-15 min no Dia 13)
Português: diferença entre concordância verbal e nominal; verbos "haver" e "fazer" em situações impessoais.
Matemática: resolver uma equação com duas operações e transformar um enunciado em equação.
Constitucional: diferenças entre brasileiro nato e naturalizado; voto obrigatório e facultativo; condições de elegibilidade.
Informática: diferença entre navegador, mecanismo de busca, cookies, cache, histórico, upload e download.

CADERNO DE ERROS
Para cada erro, registre: a questão; por que errou (não conhecia a regra / confundiu conceitos / errou o cálculo); como resolver (a regra correta, com suas palavras). Não copie páginas inteiras — escreva só o que precisa lembrar. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app.

CHECKLIST DO DIA 12
Identifico o sujeito e faço a concordância verbal. Reconheço quando haver e fazer ficam no singular. Resolvo equações do 1º grau. Transformo problemas escritos em equações. Diferencio brasileiros natos e naturalizados. Sei quando o voto é obrigatório ou facultativo. Diferencio navegador de mecanismo de busca. Sei distinguir cookies, cache e histórico. Diferencio download de upload. Marque este bloco como concluído para fechar o Dia 12.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a frase correta de acordo com a norma-padrão.',
   '{"A":"Haviam muitos candidatos na sala.","B":"Fazem três anos que ele estuda.","C":"Existem muitas vagas disponíveis.","D":"Os documentos está sobre a mesa.","E":"A funcionária e o diretor chegou cedo."}'::jsonb,
   'C', '"Existir" concorda normalmente com "vagas" (plural) — está correto. As demais erram "haver"/"fazer" impessoais ou a concordância do sujeito.'),

  ((select id from b_port_ex), 2, 'Português',
   'Complete corretamente: "________ muitos problemas no sistema ontem."',
   '{"A":"Haviam.","B":"Havia.","C":"Haviam existido-se.","D":"Existia muitos.","E":"Faziam."}'::jsonb,
   'B', '"Havia", no sentido de existir, é impessoal e fica sempre no singular.'),

  ((select id from b_port_ex), 3, 'Português',
   'Assinale a alternativa correta.',
   '{"A":"Segue anexo as declarações.","B":"Seguem anexa as declarações.","C":"Seguem anexas as declarações.","D":"Segue anexas a declaração.","E":"Seguem anexo a declaração."}'::jsonb,
   'C', '"Anexas" concorda em gênero e número com "declarações" (feminino plural).'),

  ((select id from b_port_ex), 4, 'Português',
   'Complete corretamente: "Muito ________, disse a candidata ao receber a ajuda."',
   '{"A":"Obrigado.","B":"Obrigada.","C":"Obrigados.","D":"Obrigadas.","E":"Obrigade."}'::jsonb,
   'B', '"Obrigada" concorda com quem agradece — "a candidata", feminino singular.'),

  -- Matemática — fixação (Q1-4)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Resolva a equação x + 9 = 23.',
   '{"A":"12.","B":"13.","C":"14.","D":"15.","E":"16."}'::jsonb,
   'C', 'x = 23 − 9 = 14.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'O triplo de um número, menos 5, é igual a 28. Qual é esse número?',
   '{"A":"7.","B":"9.","C":"10.","D":"11.","E":"13."}'::jsonb,
   'D', '3x − 5 = 28 → 3x = 33 → x = 11.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Resolva a equação 4x + 8 = 32.',
   '{"A":"4.","B":"5.","C":"6.","D":"7.","E":"8."}'::jsonb,
   'C', '4x = 24 → x = 6.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Um número somado ao seu dobro resulta em 36. Qual é o número?',
   '{"A":"9.","B":"10.","C":"12.","D":"15.","E":"18."}'::jsonb,
   'C', 'x + 2x = 36 → 3x = 36 → x = 12.'),

  -- Constitucional — fixação (Q1-4)
  ((select id from b_const_ex), 1, 'Constitucional',
   'Segundo a Constituição Federal, é brasileiro nato, em regra, quem:',
   '{"A":"Nasce em qualquer país, independentemente de qualquer vínculo com o Brasil.","B":"Nasce no Brasil, ainda que os pais sejam estrangeiros, desde que eles não estejam a serviço de seu país.","C":"Reside no Brasil por cinco anos, automaticamente.","D":"É estrangeiro e trabalha em uma empresa brasileira.","E":"Visita o Brasil por determinado período."}'::jsonb,
   'B', 'É a primeira hipótese de brasileiro nato do art. 12, I.'),

  ((select id from b_const_ex), 2, 'Constitucional',
   'Qual cargo é privativo de brasileiro nato?',
   '{"A":"Vereador.","B":"Prefeito.","C":"Deputado Federal.","D":"Presidente da República.","E":"Governador."}'::jsonb,
   'D', 'Presidente da República está na lista do art. 12, §3º — os demais podem ser ocupados por naturalizados.'),

  ((select id from b_const_ex), 3, 'Constitucional',
   'Para uma pessoa alfabetizada de 17 anos, o voto é:',
   '{"A":"Obrigatório.","B":"Facultativo.","C":"Proibido em qualquer circunstância.","D":"Obrigatório somente nas eleições municipais.","E":"Facultativo apenas para cargos federais."}'::jsonb,
   'B', 'Para maiores de 16 e menores de 18 anos, o voto é facultativo, mesmo sendo alfabetizados.'),

  ((select id from b_const_ex), 4, 'Constitucional',
   'Qual alternativa apresenta uma condição de elegibilidade prevista na Constituição?',
   '{"A":"Ser obrigatoriamente brasileiro nato para qualquer cargo eletivo.","B":"Possuir patrimônio mínimo definido pela Constituição.","C":"Estar em pleno exercício dos direitos políticos.","D":"Ter concluído curso superior para qualquer cargo.","E":"Ter idade mínima de 35 anos para todos os cargos."}'::jsonb,
   'C', 'É uma das condições do art. 14, §3º — as demais não existem como regra geral constitucional.'),

  -- Informática — fixação (Q1-4)
  ((select id from b_info_ex), 1, 'Informática',
   'Qual alternativa diferencia corretamente navegador e mecanismo de busca?',
   '{"A":"São nomes diferentes para a mesma coisa.","B":"Navegador é um programa de acesso à web; mecanismo de busca ajuda a localizar informações.","C":"Navegador é um tipo de antivírus.","D":"Mecanismo de busca serve apenas para abrir arquivos locais.","E":"Nenhum dos dois depende de software."}'::jsonb,
   'B', 'Navegador acessa a web; mecanismo de busca localiza informações na web — são coisas diferentes.'),

  ((select id from b_info_ex), 2, 'Informática',
   'Sobre HTTPS, assinale a alternativa correta.',
   '{"A":"Garante que todo site seja legítimo.","B":"Impede qualquer tipo de golpe.","C":"Ajuda a proteger a comunicação, mas não garante que o site seja confiável.","D":"É utilizado exclusivamente para transferir imagens.","E":"É sinônimo de navegação anônima."}'::jsonb,
   'C', 'HTTPS protege a comunicação em trânsito — um site fraudulento também pode usar HTTPS.'),

  ((select id from b_info_ex), 3, 'Informática',
   'Qual é uma função comum dos cookies?',
   '{"A":"Substituir o sistema operacional.","B":"Eliminar automaticamente todos os vírus.","C":"Aumentar fisicamente a memória RAM.","D":"Manter informações de sessão ou preferências de um site.","E":"Converter automaticamente qualquer página em PDF."}'::jsonb,
   'D', 'Cookies servem para manter sessão e preferências de um site, entre outras funções.'),

  ((select id from b_info_ex), 4, 'Informática',
   'Ao enviar um arquivo do computador para um formulário em um site, o usuário normalmente está realizando:',
   '{"A":"Download.","B":"Upload.","C":"Formatação.","D":"Desfragmentação.","E":"Navegação privada."}'::jsonb,
   'B', 'Enviar dados do dispositivo do usuário para um sistema remoto é upload.'),

  -- Mini-simulado (Q17-28)
  ((select id from b_simulado), 1, 'Português',
   'Assinale a frase correta de acordo com a norma-padrão.',
   '{"A":"Fazem cinco meses que trabalho aqui.","B":"Houveram muitos problemas na reunião.","C":"Existem documentos pendentes de análise.","D":"A equipe de funcionários chegaram cedo.","E":"Os relatório foram enviados ontem."}'::jsonb,
   'C', '"Existir" concorda normalmente com "documentos" — está correto. As demais erram "fazer"/"haver" impessoais ou a concordância do sujeito.'),

  ((select id from b_simulado), 2, 'Português',
   'Qual alternativa está correta quanto à concordância nominal?',
   '{"A":"As declarações seguem anexo.","B":"As funcionárias estavam cansado.","C":"Seguem anexas as declarações.","D":"Os documentos estão organizada.","E":"A candidata disse: \"Muito obrigado\"."}'::jsonb,
   'C', '"Anexas" concorda com "declarações" (feminino plural).'),

  ((select id from b_simulado), 3, 'Português',
   'Complete corretamente: "________ muitos anos que o prédio foi inaugurado."',
   '{"A":"Faz.","B":"Fazem.","C":"Haviam.","D":"Existia.","E":"Houveram."}'::jsonb,
   'A', '"Faz", indicando tempo decorrido, é impessoal e fica sempre no singular.'),

  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Resolva a equação 2x + 10 = 30.',
   '{"A":"5.","B":"8.","C":"10.","D":"15.","E":"20."}'::jsonb,
   'C', '2x = 20 → x = 10.'),

  ((select id from b_simulado), 5, 'Matemática/RLM',
   'O dobro de um número, somado a 12, resulta em 42. Qual é o número?',
   '{"A":"10.","B":"12.","C":"15.","D":"18.","E":"20."}'::jsonb,
   'C', '2x + 12 = 42 → 2x = 30 → x = 15.'),

  ((select id from b_simulado), 6, 'Matemática/RLM',
   'Resolva a equação 5x − 10 = 3x + 8.',
   '{"A":"4.","B":"6.","C":"8.","D":"9.","E":"10."}'::jsonb,
   'D', '5x − 3x = 8 + 10 → 2x = 18 → x = 9.'),

  ((select id from b_simulado), 7, 'Constitucional',
   'Qual dos cargos abaixo é privativo de brasileiro nato?',
   '{"A":"Vereador.","B":"Prefeito.","C":"Deputado Estadual.","D":"Presidente da República.","E":"Governador."}'::jsonb,
   'D', 'Presidente da República está na lista de cargos privativos de nato.'),

  ((select id from b_simulado), 8, 'Constitucional',
   'O voto é facultativo para:',
   '{"A":"Todas as pessoas alfabetizadas maiores de 18 anos.","B":"Todos os brasileiros naturalizados, independentemente da idade.","C":"Analfabetos, maiores de 70 anos e jovens de 16 e 17 anos.","D":"Todos os servidores públicos.","E":"Todos os brasileiros com menos de 70 anos."}'::jsonb,
   'C', 'São exatamente os três grupos com voto facultativo previstos na Constituição.'),

  ((select id from b_simulado), 9, 'Constitucional',
   'Qual alternativa apresenta uma condição constitucional de elegibilidade?',
   '{"A":"Ter curso superior em qualquer hipótese.","B":"Possuir patrimônio mínimo.","C":"Ser brasileiro nato para todo cargo eletivo.","D":"Estar em pleno exercício dos direitos políticos.","E":"Ter no mínimo 35 anos para qualquer cargo."}'::jsonb,
   'D', 'É uma das condições de elegibilidade do art. 14, §3º.'),

  ((select id from b_simulado), 10, 'Informática',
   'Qual alternativa descreve corretamente o cache do navegador?',
   '{"A":"É o mesmo que o histórico de navegação.","B":"É uma área que pode armazenar temporariamente recursos para acelerar o carregamento.","C":"É um programa obrigatório para editar documentos.","D":"Impede qualquer rastreamento na internet.","E":"É o nome dado à senha do usuário."}'::jsonb,
   'B', 'Cache armazena recursos temporariamente para acelerar carregamentos futuros.'),

  ((select id from b_simulado), 11, 'Informática',
   'Qual afirmação sobre o modo de navegação privada é correta?',
   '{"A":"Impede o provedor de internet de observar qualquer conexão.","B":"Garante anonimato absoluto.","C":"Impede que os sites identifiquem o endereço acessado.","D":"Reduz o armazenamento local do histórico e de certos dados da sessão, mas não garante invisibilidade na internet.","E":"Substitui o uso de antivírus."}'::jsonb,
   'D', 'O modo privado reduz dados armazenados localmente, mas não torna o usuário invisível na rede.'),

  ((select id from b_simulado), 12, 'Informática',
   'Qual situação representa um download?',
   '{"A":"Enviar uma fotografia para um formulário online.","B":"Anexar um currículo a um e-mail enviado.","C":"Transferir um edital de um site para o computador.","D":"Enviar um vídeo do celular para a nuvem.","E":"Publicar um arquivo em uma plataforma."}'::jsonb,
   'C', 'Transferir dados de um sistema remoto para o dispositivo do usuário é download — as demais são upload.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
