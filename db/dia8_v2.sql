-- Cadastra o Dia 8 (versão completa e robusta).
delete from days where week = 2 and day_number = 3;

with d as (
  insert into days (week, day_number, title)
  values (2, 3, 'Concordância verbal/nominal + razão, proporção e regra de três + LIMPE + internet e segurança')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Concordância verbal e nominal', 30, $$Regra básica: o verbo concorda com o sujeito; o adjetivo, artigo, pronome e numeral concordam com o substantivo.

CONCORDÂNCIA VERBAL
O verbo concorda com o núcleo do sujeito. "O candidato estudou." (sujeito: candidato). No plural: "Os candidatos estudaram." (nunca "Os candidatos estudou").

SUJEITO COMPOSTO
Com dois ou mais núcleos, o verbo normalmente vai para o plural: "João e Maria estudaram."; "Português e Matemática são importantes."

VERBO "HAVER"
Quando significa existir, é impessoal e fica sempre no singular: "Há muitas pessoas na fila."; "Havia vários candidatos na sala."; "Houve problemas na prova." Nunca "Haviam muitas pessoas" ou "Houveram problemas". Regra para decorar: HAVER = EXISTIR → SINGULAR.

VERBO "FAZER" INDICANDO TEMPO
Também fica no singular quando indica tempo decorrido: "Faz dois anos que estudo para concursos."; "Fazia três meses que ele estava estudando." Nunca "Fazem dois anos que estudo".

VERBO "SER"
Tem situações especiais, como em data e hora: "Hoje é dia 6."; "Hoje são seis de outubro."; "É uma hora."; "São duas horas."

CONCORDÂNCIA COM PORCENTAGEM
"10% dos candidatos estudaram" — como "candidatos" está no plural, o verbo concorda com ele. "10% da população compareceu" — aqui "população" é singular, e o verbo acompanha.

CONCORDÂNCIA NOMINAL
O adjetivo concorda com o substantivo em gênero e número: "As questões difíceis foram anuladas." (questões = feminino plural → difíceis); "O candidato estava preparado." / "As candidatas estavam preparadas."

PEGADINHA — "É PROIBIDO"
Sem artigo determinando o substantivo, a expressão tende ao masculino singular: "É proibido estacionar." Com artigo, concorda com o substantivo: "É proibida a entrada."$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — concordância (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Razão, proporção e regra de três', 35, $$RAZÃO
Comparação entre duas grandezas. Ex.: sala com 20 homens e 30 mulheres → razão homens/mulheres = 20/30 = 2/3 (razão 2:3).

PROPORÇÃO
Igualdade entre duas razões. Ex.: 2/3 = 4/6 é uma proporção.

REGRA FUNDAMENTAL DA PROPORÇÃO
Se a/b = c/d, então a×d = b×c. Ex.: x/5 = 12/15 → multiplicando cruzado: 15x = 60 → x = 4.

REGRA DE TRÊS SIMPLES (DIRETA)
Ex.: se 5 cadernos custam R$ 40, quanto custam 8? Mais cadernos → maior preço: grandeza diretamente proporcional. 5/8 = 40/X → 5X = 320 → X = 64.

GRANDEZAS DIRETAMENTE PROPORCIONAIS
Uma aumenta, a outra também aumenta. Ex.: mais produtos → maior preço; mais horas trabalhadas → maior salário (valor por hora constante).

GRANDEZAS INVERSAMENTE PROPORCIONAIS
Uma aumenta, a outra diminui. Ex.: uma tarefa feita por 2 trabalhadores em 10 dias — aumentando para 5 trabalhadores, o número de dias diminui: 2×10 = 5×X → 20 = 5X → X = 4 dias.

PEGADINHA — COMO IDENTIFICAR
Antes de montar a regra de três, pergunte: quando uma grandeza aumenta, a outra aumenta ou diminui? Se ambas aumentam → direta. Se uma aumenta e a outra diminui → inversa.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — razão, proporção e regra de três (Q5 a Q8)', 15
  from d returning id
),
b_adm_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Administrativo', 'teoria', 'Princípios da Administração Pública (LIMPE) — revisão aprofundada', 30, $$Ponto de partida: art. 37 da Constituição Federal. A Administração Pública deve obedecer ao LIMPE: Legalidade, Impessoalidade, Moralidade, Publicidade, Eficiência.

LEGALIDADE
O agente público só pode agir conforme a lei — diferente do particular, que pode fazer tudo que a lei não proíbe. A Administração precisa de autorização jurídica para agir. Ex.: um servidor não pode criar uma obrigação para o cidadão só porque "acha necessário" — precisa de fundamento legal.

IMPESSOALIDADE
A Administração deve buscar o interesse público, sem favorecer amigos, parentes ou grupos. Ex.: um prefeito não pode usar uma obra pública como propaganda pessoal — a atuação deve ser institucional.

MORALIDADE
Não basta o ato ser formalmente legal — deve respeitar padrões éticos e de boa-fé. Ex.: uma autoridade que usa uma regra de forma aparentemente legal para obter vantagem pessoal pode violar a moralidade.

PUBLICIDADE
Os atos administrativos devem ser divulgados, para permitir transparência, controle, fiscalização e conhecimento pela sociedade. Mas publicidade não significa que absolutamente tudo deve ser público — existem hipóteses legais de sigilo.

EFICIÊNCIA
Busca por bons resultados, qualidade, produtividade, economia e rapidez adequada — não é simplesmente "fazer tudo rápido", e sim produzir bons resultados usando adequadamente os recursos públicos.

COMO MEMORIZAR
O servidor deve agir dentro da Lei, sem favoritismo, com ética, transparência e buscando bons resultados — isso é o LIMPE.$$
  from d returning id
),
b_adm_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Administrativo', 'exercicios', 'Fixação — LIMPE (Q9 a Q12)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'Internet, navegadores e segurança', 25, $$NAVEGADOR
Programa usado para acessar páginas da internet: Google Chrome, Microsoft Edge, Mozilla Firefox, Safari.

URL
Endereço usado para localizar um recurso na internet. Ex.: https://www.exemplo.com.br — tem protocolo, domínio, caminho e parâmetros.

HTTP E HTTPS
HTTP: protocolo usado na comunicação da web. HTTPS: versão que usa criptografia para proteger a comunicação (o "S" remete a "Secure"). Atenção: HTTPS protege a comunicação, mas não significa automaticamente que o site seja legítimo ou confiável.

COOKIES
Pequenos dados armazenados pelo navegador/site, usados para manter sessões, lembrar preferências, personalizar experiências e, dependendo da situação, rastreamento.

CACHE
Armazena dados temporariamente para facilitar o carregamento posterior de recursos. Ex.: a imagem de um site pode ficar no cache do navegador.

PHISHING
Técnica para enganar a vítima e fazê-la fornecer informações. Ex.: e-mail dizendo "sua conta será bloqueada, clique aqui imediatamente" — o link leva a uma página falsa que tenta roubar senha, CPF, número do cartão ou código de autenticação.

MALWARE
Software malicioso — inclui vírus, trojans, ransomware, spyware.

RANSOMWARE
Malware que pode bloquear ou criptografar arquivos e exigir pagamento para liberar o acesso. Ex.: "Seus arquivos foram criptografados. Pague para recuperar."

BACKUP
Cópia de segurança dos dados. Boa prática: manter cópias em locais diferentes (computador + armazenamento externo + nuvem).$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — internet e segurança (Q13 a Q16)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 8, com bloco de nível mais alto no final (Q17 a Q36)', 40,
    $$Sem consulta. Misture Português (concordância), Matemática (razão/proporção/regra de três), Administrativo (LIMPE) e Informática (internet/segurança). As últimas questões (Q31 a Q36) exigem mais atenção — são o bloco de "nível um pouco mais alto".$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Caderno de erros, revisão de 24h/7 dias e meta do dia', 20, $$CADERNO DE ERROS
Separe seus erros por categoria: erro grave (não dominou o conteúdo), erro de atenção (sabia, mas caiu na pegadinha), erro de interpretação (entendeu errado o enunciado). Isso evita tratar um erro de distração do mesmo jeito que uma lacuna de conteúdo. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app.

REVISÃO DE 24 HORAS (reserve uns 15 min)
Português: haver = existir → singular; fazer indicando tempo → singular; concordância nominal; "é proibido/proibida".
Matemática: razão; proporção; regra de três direta; regra de três inversa.
Administrativo: LIMPE.
Informática: navegador; HTTP/HTTPS; cookies; cache; phishing; ransomware; backup.

REVISÃO DE 7 DIAS — pergunte-se sem consultar
Quais são os cinco princípios do art. 37? (LIMPE) Haver = existir é singular? Fazer indicando tempo é singular? O que é phishing? O que é ransomware? Quando a regra de três é inversa?
(O app já agenda essas revisões sozinho a partir do caderno de erros — 24h, 7 dias e 30 dias, visíveis no Painel.)

META DO DIA 8
70% ou mais: ótimo, você está consolidando a base. 60%–69%: bom, revise alguns pontos. 50%–59%: atenção, reforce a teoria. Abaixo de 50%: sem problema — é para isso que servem as questões, para mostrar onde reforçar. Marque este bloco como concluído para fechar o Dia 8.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a alternativa correta:',
   '{"A":"Haviam muitos candidatos na sala.","B":"Houveram problemas durante a prova.","C":"Havia muitos candidatos na sala.","D":"Haviam ocorrido vários problemas.","E":"Houveram diversas reclamações."}'::jsonb,
   'C', '"Havia", no sentido de existir, é impessoal e fica sempre no singular. As demais flexionam indevidamente "haver" nesse sentido.'),

  ((select id from b_port_ex), 2, 'Português',
   'Assinale a alternativa correta:',
   '{"A":"Fazem três anos que estudo para concursos.","B":"Faz três anos que estudo para concursos.","C":"Fazem três ano que estudo para concursos.","D":"Fazia dois anos que estudo para concursos.","E":"Fazem dois anos que estudo."}'::jsonb,
   'B', '"Fazer" indicando tempo decorrido é impessoal: "Faz três anos". As demais flexionam indevidamente ou misturam tempos verbais.'),

  ((select id from b_port_ex), 3, 'Português',
   'Assinale a alternativa correta:',
   '{"A":"Os candidatos estudou bastante.","B":"O candidato estudaram bastante.","C":"Os candidatos estudaram bastante.","D":"Os candidato estudaram bastante.","E":"O candidatos estudaram bastante."}'::jsonb,
   'C', 'Sujeito plural "os candidatos" exige verbo no plural "estudaram", com artigo e substantivo também concordando no plural.'),

  ((select id from b_port_ex), 4, 'Português',
   'Assinale a alternativa correta:',
   '{"A":"É proibido a entrada de pessoas sem autorização.","B":"É proibida a entrada de pessoas sem autorização.","C":"É proibidas a entrada de pessoas sem autorização.","D":"É proibido as entradas de pessoas sem autorização.","E":"É proibida entrar pessoas sem autorização."}'::jsonb,
   'B', 'Com o artigo "a" determinando "entrada" (substantivo feminino singular), a concordância correta é "é proibida a entrada".'),

  -- Matemática — fixação (Q5-8)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Se 4 canetas custam R$ 20, quanto custarão 7 canetas?',
   '{"A":"R$ 25","B":"R$ 30","C":"R$ 35","D":"R$ 40","E":"R$ 45"}'::jsonb,
   'C', 'Preço unitário: 20/4 = 5. Para 7 canetas: 7 × 5 = 35.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'A razão entre 15 e 25, simplificada, é:',
   '{"A":"1/2","B":"2/3","C":"3/5","D":"4/5","E":"5/3"}'::jsonb,
   'C', '15/25 simplifica dividindo por 5: 3/5.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Se 6 funcionários realizam determinado trabalho em 10 dias, mantendo o mesmo ritmo, 12 funcionários realizarão o trabalho em:',
   '{"A":"2 dias","B":"3 dias","C":"4 dias","D":"5 dias","E":"6 dias"}'::jsonb,
   'D', 'Regra de três inversa: 6×10 = 12×X → 60 = 12X → X = 5 dias.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Se x/8 = 15/20, o valor de x é:',
   '{"A":"4","B":"5","C":"6","D":"7","E":"8"}'::jsonb,
   'C', 'Multiplicando em cruz: 20x = 120 → x = 6.'),

  -- Administrativo — fixação (Q9-12)
  ((select id from b_adm_ex), 1, 'Administrativo',
   'São princípios expressamente previstos no caput do art. 37 da Constituição Federal:',
   '{"A":"Legalidade, pessoalidade, moralidade, publicidade e eficiência.","B":"Legalidade, impessoalidade, moralidade, publicidade e eficiência.","C":"Legalidade, impessoalidade, economicidade, publicidade e eficiência.","D":"Moralidade, hierarquia, publicidade, eficiência e supremacia.","E":"Legalidade, moralidade, sigilo, eficiência e hierarquia."}'::jsonb,
   'B', 'O LIMPE é exatamente: legalidade, impessoalidade, moralidade, publicidade e eficiência.'),

  ((select id from b_adm_ex), 2, 'Administrativo',
   'Um servidor público utiliza sua posição para favorecer um amigo em determinado procedimento administrativo. Nesse caso, há violação principalmente ao princípio da:',
   '{"A":"publicidade.","B":"eficiência.","C":"impessoalidade.","D":"continuidade.","E":"especialidade."}'::jsonb,
   'C', 'Favorecer um amigo viola diretamente a impessoalidade — a atuação deve buscar o interesse público.'),

  ((select id from b_adm_ex), 3, 'Administrativo',
   'O princípio que exige que a Administração Pública atue conforme a lei é o princípio da:',
   '{"A":"moralidade.","B":"eficiência.","C":"publicidade.","D":"legalidade.","E":"impessoalidade."}'::jsonb,
   'D', 'Legalidade: o agente público só pode agir com fundamento legal.'),

  ((select id from b_adm_ex), 4, 'Administrativo',
   'A busca por melhores resultados, qualidade e adequada utilização dos recursos públicos está relacionada principalmente ao princípio da:',
   '{"A":"eficiência.","B":"publicidade.","C":"impessoalidade.","D":"moralidade.","E":"legalidade."}'::jsonb,
   'A', 'Eficiência: bons resultados, qualidade e uso adequado dos recursos públicos.'),

  -- Informática — fixação (Q13-16)
  ((select id from b_info_ex), 1, 'Informática',
   'Google Chrome, Microsoft Edge e Mozilla Firefox são exemplos de:',
   '{"A":"sistemas operacionais.","B":"navegadores.","C":"antivírus.","D":"bancos de dados.","E":"servidores de e-mail."}'::jsonb,
   'B', 'São exemplos de navegadores — programas usados para acessar páginas da internet.'),

  ((select id from b_info_ex), 2, 'Informática',
   'Uma mensagem falsa tenta induzir o usuário a fornecer sua senha por meio de um link fraudulento. Essa prática é conhecida como:',
   '{"A":"backup.","B":"firewall.","C":"phishing.","D":"cache.","E":"criptografia."}'::jsonb,
   'C', 'É a definição clássica de phishing.'),

  ((select id from b_info_ex), 3, 'Informática',
   'O HTTPS, em comparação ao HTTP, está associado principalmente à:',
   '{"A":"eliminação de todos os vírus.","B":"criptografia da comunicação.","C":"criação automática de backups.","D":"instalação de antivírus.","E":"exclusão dos cookies."}'::jsonb,
   'B', 'HTTPS usa criptografia para proteger a comunicação — não garante, por si só, que o site seja confiável.'),

  ((select id from b_info_ex), 4, 'Informática',
   'Um programa malicioso que pode criptografar arquivos da vítima e exigir pagamento para liberá-los é conhecido como:',
   '{"A":"spyware.","B":"firewall.","C":"ransomware.","D":"cookie.","E":"navegador."}'::jsonb,
   'C', 'É a definição de ransomware.'),

  -- Mini-simulado (Q17-36)
  ((select id from b_simulado), 1, 'Português',
   'Assinale a alternativa correta:',
   '{"A":"Haviam muitas pessoas esperando.","B":"Houveram diversos problemas.","C":"Há muitos candidatos inscritos.","D":"Haviam ocorrido problemas.","E":"Houveram várias reclamações."}'::jsonb,
   'C', '"Há", no sentido de existir, é impessoal e fica no singular — está correto.'),

  ((select id from b_simulado), 2, 'Português',
   'Assinale a alternativa correta:',
   '{"A":"Fazem cinco anos que ele trabalha aqui.","B":"Faz cinco anos que ele trabalha aqui.","C":"Fazem cinco ano que ele trabalha aqui.","D":"Fazia cinco anos que ele trabalham aqui.","E":"Faz cinco anos que eles trabalha aqui."}'::jsonb,
   'B', '"Fazer" indicando tempo é impessoal, singular: "Faz cinco anos". As demais erram a flexão de "fazer" ou a concordância do outro verbo da frase.'),

  ((select id from b_simulado), 3, 'Português',
   'Assinale a alternativa correta:',
   '{"A":"É proibido a entrada de candidatos.","B":"É proibida a entrada de candidatos.","C":"É proibidas a entrada de candidatos.","D":"São proibida a entrada de candidatos.","E":"É proibido as entradas de candidatos."}'::jsonb,
   'B', 'Com artigo "a" determinando "entrada", a concordância correta é "é proibida a entrada".'),

  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Se 5 livros custam R$ 75, o preço de 8 livros, mantendo o mesmo valor unitário, será:',
   '{"A":"R$ 100","B":"R$ 110","C":"R$ 120","D":"R$ 125","E":"R$ 130"}'::jsonb,
   'C', 'Preço unitário: 75/5 = 15. Para 8 livros: 8 × 15 = 120.'),

  ((select id from b_simulado), 5, 'Matemática/RLM',
   'A razão entre 18 e 30 é:',
   '{"A":"2/3","B":"3/5","C":"4/5","D":"5/6","E":"6/5"}'::jsonb,
   'B', '18/30 simplifica dividindo por 6: 3/5.'),

  ((select id from b_simulado), 6, 'Matemática/RLM',
   'Se 4 funcionários realizam um serviço em 15 dias, 10 funcionários, mantendo o mesmo ritmo, realizarão o serviço em:',
   '{"A":"4 dias","B":"5 dias","C":"6 dias","D":"8 dias","E":"10 dias"}'::jsonb,
   'C', 'Regra de três inversa: 4×15 = 10×X → 60 = 10X → X = 6 dias.'),

  ((select id from b_simulado), 7, 'Administrativo',
   'A sigla utilizada para memorizar os princípios expressos no art. 37 da Constituição é:',
   '{"A":"LIMPE","B":"LEGAL","C":"PIMPE","D":"LIPES","E":"MILPE"}'::jsonb,
   'A', 'LIMPE: Legalidade, Impessoalidade, Moralidade, Publicidade, Eficiência.'),

  ((select id from b_simulado), 8, 'Administrativo',
   'O favorecimento de um amigo por parte de um agente público viola principalmente o princípio da:',
   '{"A":"eficiência.","B":"publicidade.","C":"impessoalidade.","D":"legalidade tributária.","E":"continuidade."}'::jsonb,
   'C', 'Favorecimento pessoal viola a impessoalidade.'),

  ((select id from b_simulado), 9, 'Administrativo',
   'A busca por melhores resultados na prestação dos serviços públicos está relacionada ao princípio da:',
   '{"A":"moralidade.","B":"eficiência.","C":"publicidade.","D":"impessoalidade.","E":"legalidade."}'::jsonb,
   'B', 'Eficiência: bons resultados na prestação do serviço público.'),

  ((select id from b_simulado), 10, 'Administrativo',
   'A divulgação dos atos administrativos, permitindo controle social, está relacionada principalmente ao princípio da:',
   '{"A":"publicidade.","B":"moralidade.","C":"eficiência.","D":"hierarquia.","E":"especialidade."}'::jsonb,
   'A', 'Publicidade: divulgação dos atos para permitir transparência e controle social.'),

  ((select id from b_simulado), 11, 'Informática',
   'Firefox é:',
   '{"A":"sistema operacional.","B":"navegador.","C":"antivírus.","D":"mecanismo de busca.","E":"firewall."}'::jsonb,
   'B', 'Firefox é um navegador.'),

  ((select id from b_simulado), 12, 'Informática',
   'Uma tentativa fraudulenta de obter senhas por meio de mensagens e páginas falsas é denominada:',
   '{"A":"backup.","B":"phishing.","C":"cache.","D":"cookie.","E":"firewall."}'::jsonb,
   'B', 'É a definição de phishing.'),

  ((select id from b_simulado), 13, 'Informática',
   'O ransomware normalmente está associado a:',
   '{"A":"compactação de arquivos.","B":"criptografia/bloqueio de arquivos e exigência de resgate.","C":"atualização automática do navegador.","D":"criação de cookies.","E":"melhoria da velocidade da internet."}'::jsonb,
   'B', 'Ransomware pode criptografar ou bloquear arquivos e exigir pagamento (resgate) para liberar o acesso.'),

  ((select id from b_simulado), 14, 'Informática',
   'O cache do navegador serve principalmente para:',
   '{"A":"armazenar temporariamente determinados dados e recursos.","B":"eliminar todos os vírus.","C":"bloquear automaticamente qualquer site falso.","D":"substituir o sistema operacional.","E":"criar senhas bancárias."}'::jsonb,
   'A', 'Cache armazena dados temporariamente para facilitar o carregamento posterior de recursos.'),

  -- Bloco de nível mais alto (Q31-36 do material original)
  ((select id from b_simulado), 15, 'Português',
   'Assinale a alternativa correta:',
   '{"A":"Haviam muitas dúvidas sobre o conteúdo.","B":"Houveram vários erros na prova.","C":"Havia muitas dúvidas sobre o conteúdo.","D":"Fazem dois meses que comecei.","E":"Fazem três anos que ele estuda."}'::jsonb,
   'C', '"Havia", existir, impessoal, singular — está correto. As demais flexionam indevidamente "haver" ou "fazer" indicando tempo.'),

  ((select id from b_simulado), 16, 'Matemática/RLM',
   'Uma empresa possui 12 funcionários e consegue concluir determinado serviço em 8 dias. Mantendo o mesmo ritmo, 16 funcionários concluirão o mesmo serviço em:',
   '{"A":"4 dias.","B":"5 dias.","C":"6 dias.","D":"7 dias.","E":"8 dias."}'::jsonb,
   'C', 'Regra de três inversa: 12×8 = 16×X → 96 = 16X → X = 6 dias.'),

  ((select id from b_simulado), 17, 'Administrativo',
   'Um agente público decide utilizar recursos e estrutura do órgão público para promover sua imagem pessoal. A conduta pode contrariar especialmente o princípio da:',
   '{"A":"impessoalidade.","B":"eficiência.","C":"continuidade.","D":"autotutela.","E":"especialidade."}'::jsonb,
   'A', 'Usar estrutura pública para promoção pessoal é exatamente o tipo de conduta que a impessoalidade veda.'),

  ((select id from b_simulado), 18, 'Informática',
   'Um usuário recebe um e-mail aparentemente enviado por seu banco solicitando que clique em um link para "atualizar imediatamente sua senha". A página acessada possui aparência idêntica à do banco, mas foi criada para capturar seus dados. A situação caracteriza:',
   '{"A":"backup.","B":"phishing.","C":"cache.","D":"firewall.","E":"compactação."}'::jsonb,
   'B', 'É um exemplo clássico de phishing: página falsa para capturar dados do usuário.'),

  ((select id from b_simulado), 19, 'Matemática/RLM',
   'Considere: 8 trabalhadores → 12 dias. Mantendo-se as mesmas condições, quantos dias seriam necessários para 6 trabalhadores realizarem o mesmo serviço?',
   '{"A":"8","B":"12","C":"14","D":"16","E":"18"}'::jsonb,
   'D', 'Regra de três inversa: 8×12 = 6×X → 96 = 6X → X = 16 dias.'),

  ((select id from b_simulado), 20, 'Português',
   'Analise: "É proibida a entrada de pessoas não autorizadas." A concordância da palavra "proibida" ocorre porque:',
   '{"A":"concorda com \"pessoas\".","B":"concorda com \"entrada\".","C":"concorda com \"autorizadas\".","D":"concorda com \"é\".","E":"não há concordância."}'::jsonb,
   'B', '"Proibida" concorda com "entrada" (substantivo feminino singular, determinado pelo artigo "a"), não com "pessoas" nem com "autorizadas".')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
