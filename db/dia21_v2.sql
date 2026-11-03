-- Cadastra o Dia 21 (versão completa e robusta).
delete from days where week = 5 and day_number = 2;

with d as (
  insert into days (week, day_number, title)
  values (5, 2, 'Vozes verbais (ativa/passiva/reflexiva) + médias aritmética/ponderada + atos administrativos (elementos/atributos/anulação) + segurança da informação')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Vozes verbais: ativa, passiva analítica, passiva sintética e reflexiva', 30, $$VOZ ATIVA
O sujeito pratica a ação. Ex.: "O funcionário conferiu os documentos." (sujeito: o funcionário; verbo: conferiu; objeto direto: os documentos — o sujeito realiza a ação).

VOZ PASSIVA ANALÍTICA
O sujeito recebe/sofre a ação. Ex.: "A comissão publicou o resultado." (ativa) → "O resultado foi publicado pela comissão." (passiva). Transformação: sujeito agente vira "agente da passiva" (pela comissão); verbo vira locução "ser + particípio" (foi publicado); objeto direto vira sujeito paciente (o resultado).
Formada por verbo SER + particípio do verbo principal: "A prova foi corrigida pelo examinador."; "Os documentos foram entregues pelo servidor."; "O edital será publicado pela instituição."
O particípio concorda com o sujeito paciente: "A prova foi corrigida." / "As provas foram corrigidas." / "O documento foi entregue." / "Os documentos foram entregues."

VOZ PASSIVA SINTÉTICA
Verbo transitivo (direto, ou direto e indireto) + pronome "se" como partícula apassivadora: "Vendem-se casas." (= "Casas são vendidas."); "Alugam-se apartamentos."; "Publicaram-se os resultados."
O verbo concorda com o sujeito paciente: "Vende-se uma casa." / "Vendem-se duas casas." / "Publicou-se o resultado." / "Publicaram-se os resultados."
Pegadinha: "Vendem-se casa" está errado na norma-padrão — o verbo deve concordar com "casas" (plural).

PARTÍCULA APASSIVADORA × ÍNDICE DE INDETERMINAÇÃO DO SUJEITO
Apassivadora: "Vendem-se apartamentos." (= "Apartamentos são vendidos" — sujeito é "apartamentos", verbo concorda com ele).
Índice de indeterminação: "Precisa-se de funcionários." ("precisar" exige "de" — verbo transitivo indireto; sujeito indeterminado; verbo sempre na 3ª pessoa do singular).
Compare: "Alugam-se salas" (= salas são alugadas, apassivadora, plural) × "Precisa-se de salas" (precisar de + sujeito indeterminado, sempre singular).

VOZ REFLEXIVA
O sujeito pratica E recebe a ação — a ação recai sobre o próprio sujeito. Ex.: "O candidato se preparou."; "A funcionária se machucou."; "O servidor se apresentou ao setor." Pode indicar reciprocidade: "Os colegas se cumprimentaram." (um cumprimentou o outro).

COMO TRANSFORMAR ATIVA EM PASSIVA
1) Identifique o objeto direto da ativa. 2) Transforme-o em sujeito paciente. 3) Use "ser" no tempo adequado + particípio. 4) Transforme o sujeito original em agente da passiva (se necessário).
Ex.: "A equipe analisará os pedidos." → objeto direto: os pedidos; verbo no futuro: analisará → "Os pedidos serão analisados pela equipe." A transformação preserva o tempo verbal e o sentido.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — vozes verbais (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Média aritmética simples, com repetição, média ponderada e valor desconhecido', 35, $$MÉDIA ARITMÉTICA SIMPLES
Média = soma dos valores ÷ quantidade de valores. Ex.: notas 6,7,8,9 → M=(6+7+8+9)/4=30/4=7,5. Ex.: atendimentos 40,50,60,30,70 em 5 dias → M=250/5=50.

MÉDIA COM VALORES REPETIDOS
Ex.: 3 funcionários ganham R$2.000 e 2 ganham R$3.000 — salário médio: M=(3×2000+2×3000)/5=(6000+6000)/5=2400. Não basta somar os dois valores e dividir por 2, pois aparecem em quantidades diferentes.

MÉDIA PONDERADA
Cada valor tem peso diferente: Mp = (x1p1+x2p2+...+xnpn)/(p1+p2+...+pn). Ex.: nota 7 com peso 2, nota 9 com peso 3 → Mp=(7×2+9×3)/(2+3)=(14+27)/5=8,2. Pegadinha: não faça a média simples (7+9)/2=8 — os pesos são diferentes.

DESCOBRINDO UM VALOR DESCONHECIDO
4 provas, notas 6,7,8,x, média 7,5. Soma necessária: 7,5×4=30. Soma conhecida: 6+7+8=21. x=30−21=9.

COMO A INCLUSÃO DE UM VALOR ALTERA A MÉDIA
5 pessoas com idade média 20 anos. Soma: 5×20=100. Entra uma 6ª pessoa de 26 anos: nova soma=100+26=126. Nova média=126/6=21 — a média sobe de 20 para 21.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — médias aritmética e ponderada (Q1 a Q4)', 15
  from d returning id
),
b_adm_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Administrativo', 'teoria', 'Atos administrativos: elementos, atributos, anulação/revogação e convalidação', 30, $$ELEMENTOS DO ATO ADMINISTRATIVO
Competência: quem tem atribuição legal para praticar o ato. Finalidade: objetivo público previsto no ordenamento (usar a competência para benefício pessoal pode ser desvio de finalidade). Forma: modo pelo qual o ato se exterioriza, conforme as exigências legais. Motivo: pressupostos de fato e de direito que justificam o ato (ex.: infração prevista em lei justifica abertura de procedimento). Objeto: conteúdo/efeito jurídico produzido (ex.: conceder uma licença, preenchidos os requisitos).
Diferença motivo × finalidade: motivo responde "por que o ato está sendo praticado?"; finalidade responde "para qual objetivo jurídico e público o ato deve servir?".

ATRIBUTOS DOS ATOS ADMINISTRATIVOS
Presunção de legitimidade e veracidade: o ato é considerado legítimo e os fatos declarados presumem-se verdadeiros até prova em contrário — presunção RELATIVA.
Imperatividade: o ato pode impor obrigações independentemente da concordância do destinatário, quando cabível — nem todo ato tem imperatividade.
Autoexecutoriedade: em certas situações, a Administração executa diretamente o ato, sem prévia autorização judicial — nem todo ato tem esse atributo, e não é autorização genérica para ignorar a lei. Ex.: multa pode ser imposta, mas a cobrança forçada exige o procedimento legal cabível — não dá para "retirar dinheiro da conta" sem esse procedimento.
Tipicidade: o ato deve corresponder a uma figura admitida pelo ordenamento jurídico.

ANULAÇÃO × REVOGAÇÃO
Anulação: há ilegalidade no ato. Pode ser feita pela própria Administração (autotutela) ou pelo Judiciário, quando provocado e dentro de sua competência. Busca retirar ato ilegal; a proteção de situações consolidadas depende das normas aplicáveis.
Revogação: por conveniência e oportunidade, quando o ato é válido mas deixou de ser adequado ao interesse público. Feita pela própria Administração. O Judiciário NÃO revoga ato administrativo de outro Poder por mera avaliação de conveniência/oportunidade. Não se revoga ato ilegal — nesse caso, é anulação.
Ex.: licença concedida em desacordo com requisito legal → sujeita a anulação. Ato discricionário válido que deixou de atender ao interesse público → pode ser revogado, respeitados os limites legais.

CONVALIDAÇÃO
Correção de certos vícios do ato, desde que sanáveis e a lei permita. Em regra, podem ser convalidados: vícios de competência que não sejam exclusivos, e vícios de forma que não sejam essenciais — desde que não haja lesão ao interesse público nem prejuízo a terceiros. Não presuma que qualquer ilegalidade pode ser corrigida por convalidação.$$
  from d returning id
),
b_adm_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Administrativo', 'exercicios', 'Fixação — atos administrativos (Q1 a Q4)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'Tríade CID, malware, phishing/engenharia social, MFA e backup', 25, $$TRÍADE CID
Confidencialidade: só pessoas autorizadas acessam a informação (ex.: impedir consulta não autorizada a dados bancários). Integridade: protege contra alterações indevidas (ex.: valor de transferência não pode ser alterado indevidamente). Disponibilidade: sistemas/informações acessíveis quando necessários (ex.: manter sistemas de atendimento funcionando).
Como a banca cobra: invasor lê dados sigilosos → confidencialidade. Alguém altera cadastro indevidamente → integridade. Ataque impede acesso ao sistema → disponibilidade.

MALWARE
Termo geral para software malicioso. Vírus: infecta arquivos, espalha ao executar/compartilhar. Worm: propaga entre sistemas, muitas vezes explorando vulnerabilidades, sem depender de arquivo hospedeiro como o vírus. Trojan: disfarça-se de programa legítimo. Ransomware: bloqueia acesso a dados/sistemas (frequentemente com criptografia) e exige resgate. Spyware: monitora/coleta informações sem autorização. Keylogger: registra teclas digitadas, podendo capturar senhas.
Pegadinha: nem todo malware é vírus — vírus é só uma categoria.

PHISHING E ENGENHARIA SOCIAL
Phishing: tentativa de enganar o usuário para obter dados, induzir pagamento ou ação prejudicial. Ex.: mensagem de bloqueio de conta pedindo clique em link para "confirmar senha". Sinais: urgência exagerada, remetente/domínio suspeito, link que não bate com o endereço oficial, pedido de senha/código, anexo inesperado, oferta boa demais. Ação correta: não clicar, não informar código; acessar o app/site oficial por endereço conhecido e confirmar por canal independente.
Engenharia social é mais ampla: manipulação psicológica para obter informação ou ação — phishing é uma das técnicas possíveis.

SENHAS E MFA
Senha forte: longa, exclusiva, difícil de adivinhar. Boas práticas: gerenciador de senhas, MFA quando disponível, nunca compartilhar código, não aprovar login que você não iniciou. MFA combina fatores de categorias distintas: algo que você sabe (senha/PIN), algo que você possui (dispositivo/chave/token), algo que você é (biometria). Duas senhas diferentes NÃO são dois fatores — ambas são "algo que você sabe".

BACKUP E ATUALIZAÇÃO
Backup: cópia de segurança para recuperar dados após perda/falha/incidente. Boas práticas: cópias em locais separados, proteção contra acesso não autorizado, cópia offline/imutável quando possível, testes periódicos de restauração. Atualizações corrigem falhas/vulnerabilidades — adiá-las aumenta a exposição a ataques conhecidos.$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — segurança da informação (Q1 a Q4)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 21 (Q17 a Q28)', 40,
    $$Sem consulta. 12 questões misturando vozes verbais, médias, elementos/atributos do ato administrativo, anulação × revogação e segurança da informação.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Caderno de erros, revisão espaçada e checklist do Dia 21', 20, $$CADERNO DE ERROS
Marque o que precisa reforçar: transformar voz ativa em passiva; distinguir passiva sintética de sujeito indeterminado; calcular média aritmética simples; resolver média ponderada e descobrir valores desconhecidos; distinguir motivo, finalidade, forma, competência e objeto; diferenciar anulação, revogação e convalidação; identificar pilares da segurança, malware e phishing. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app.

REVISÃO ESPAÇADA
Amanhã: revise as regras principais e refaça os exercícios errados.
Daqui a 7 dias: resolva de 8 a 12 questões sobre os quatro assuntos.
Daqui a 30 dias: revisão cumulativa dos Dias 1 a 21.
(O app já agenda isso sozinho via o caderno de erros — 24h, 7 dias e 30 dias, visíveis no Painel.)

CHECKLIST DO DIA 21
Estudei as três vozes verbais. Pratiquei média simples e média ponderada. Aprendi os elementos e atributos dos atos administrativos. Entendi a diferença entre anulação e revogação. Revisei segurança da informação, malware e phishing. Resolvi o mini-simulado e registrei os erros. Marque este bloco como concluído para fechar o Dia 21.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a transformação correta para a voz passiva: "A comissão divulgou o resultado".',
   '{"A":"O resultado divulgou a comissão.","B":"O resultado foi divulgado pela comissão.","C":"A comissão foi divulgada pelo resultado.","D":"Divulgou-se pela comissão o resultado foram."}'::jsonb,
   'B', 'Objeto direto "o resultado" vira sujeito paciente; "divulgou" vira "foi divulgado"; "a comissão" vira agente da passiva.'),

  ((select id from b_port_ex), 2, 'Português',
   'Complete corretamente: "________ os documentos necessários para a inscrição".',
   '{"A":"Analisou-se","B":"Analisaram-se","C":"Analisará-se","D":"Analisava-se os documentos"}'::jsonb,
   'B', 'Partícula apassivadora: o verbo concorda com o sujeito paciente "os documentos" (plural) — "Analisaram-se".'),

  ((select id from b_port_ex), 3, 'Português',
   'Em qual alternativa o sujeito é indeterminado?',
   '{"A":"Vendem-se terrenos.","B":"Publicaram-se os editais.","C":"Precisa-se de servidores.","D":"Corrigiram-se as provas."}'::jsonb,
   'C', '"Precisar de" é VTI — o "se" é índice de indeterminação do sujeito, verbo sempre no singular. As demais são partícula apassivadora (sujeito paciente determinado).'),

  ((select id from b_port_ex), 4, 'Português',
   'Em "A candidata se preparou para o concurso", a voz verbal é:',
   '{"A":"Passiva analítica.","B":"Passiva sintética.","C":"Ativa.","D":"Reflexiva."}'::jsonb,
   'D', 'O sujeito pratica e recebe a ação (preparou a si mesma) — voz reflexiva.'),

  -- Matemática — fixação (Q1-4)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Um candidato obteve notas 5, 7, 8 e 10. Qual foi a média aritmética?',
   '{"A":"7","B":"7,5","C":"8","D":"8,5"}'::jsonb,
   'B', '(5+7+8+10)/4 = 30/4 = 7,5.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Uma prova tem nota 6 com peso 2 e nota 9 com peso 4. Qual é a média ponderada?',
   '{"A":"7","B":"7,5","C":"8","D":"8,5"}'::jsonb,
   'C', '(6×2+9×4)/(2+4) = (12+36)/6 = 48/6 = 8.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'A média de seis números é 12. Qual é a soma desses números?',
   '{"A":"18","B":"60","C":"72","D":"84"}'::jsonb,
   'C', '12 × 6 = 72.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Quatro funcionários atendem, em média, 30 clientes por dia cada um. Um quinto funcionário passa a integrar o grupo e atende 50 clientes por dia. Qual é a nova média diária por funcionário?',
   '{"A":"32","B":"34","C":"35","D":"40"}'::jsonb,
   'B', 'Soma inicial: 4×30=120. Com o novo: 120+50=170. Nova média: 170/5=34.'),

  -- Administrativo — fixação (Q1-4)
  ((select id from b_adm_ex), 1, 'Administrativo',
   'Qual elemento do ato administrativo corresponde aos pressupostos de fato e de direito que justificam sua prática?',
   '{"A":"Objeto","B":"Finalidade","C":"Motivo","D":"Forma"}'::jsonb,
   'C', 'Motivo são os pressupostos de fato e de direito que justificam o ato.'),

  ((select id from b_adm_ex), 2, 'Administrativo',
   'A retirada de um ato administrativo ilegal é denominada:',
   '{"A":"Revogação","B":"Anulação","C":"Delegação","D":"Avocação"}'::jsonb,
   'B', 'Ato ilegal → anulação.'),

  ((select id from b_adm_ex), 3, 'Administrativo',
   'A Administração revoga, em regra, um ato administrativo quando:',
   '{"A":"O ato é ilegal, obrigatoriamente.","B":"O Judiciário determina que o ato seja revogado por conveniência.","C":"O ato válido deixou de ser conveniente ou oportuno, respeitados os limites legais.","D":"Pretende corrigir qualquer vício insanável."}'::jsonb,
   'C', 'Revogação é feita pela Administração quando o ato válido deixa de ser conveniente/oportuno.'),

  ((select id from b_adm_ex), 4, 'Administrativo',
   'Sobre a autoexecutoriedade, assinale a alternativa correta.',
   '{"A":"Está presente obrigatoriamente em todos os atos administrativos.","B":"Permite à Administração executar diretamente certos atos quando houver fundamento jurídico para isso.","C":"Elimina a necessidade de respeitar a lei.","D":"Significa que todo ato é imune ao controle judicial."}'::jsonb,
   'B', 'Autoexecutoriedade existe em hipóteses específicas, com fundamento jurídico — não é geral nem dispensa a lei.'),

  -- Informática — fixação (Q1-4)
  ((select id from b_info_ex), 1, 'Informática',
   'Um ataque impede que funcionários acessem um sistema de trabalho. Qual pilar da segurança é diretamente afetado?',
   '{"A":"Confidencialidade","B":"Integridade","C":"Disponibilidade","D":"Autenticidade exclusivamente"}'::jsonb,
   'C', 'Impedir o acesso ao sistema compromete a disponibilidade.'),

  ((select id from b_info_ex), 2, 'Informática',
   'Um programa malicioso que bloqueia arquivos e exige pagamento para tentar liberá-los é conhecido como:',
   '{"A":"Ransomware","B":"Firewall","C":"Backup","D":"Navegador"}'::jsonb,
   'A', 'É a definição de ransomware.'),

  ((select id from b_info_ex), 3, 'Informática',
   'Uma mensagem falsa imita o banco e pede que o cliente informe sua senha por um link. Trata-se de um exemplo de:',
   '{"A":"Compactação de arquivos","B":"Phishing","C":"Desfragmentação","D":"Backup incremental"}'::jsonb,
   'B', 'É a definição clássica de phishing.'),

  ((select id from b_info_ex), 4, 'Informática',
   'Qual alternativa apresenta corretamente a autenticação multifator?',
   '{"A":"Usar a mesma senha em dois sites.","B":"Digitar a senha duas vezes.","C":"Trocar a senha mensalmente, sem outro fator.","D":"Combinar senha com um fator de outra categoria, como uma chave de segurança."}'::jsonb,
   'D', 'MFA exige fatores de categorias distintas — senha + chave de segurança é um exemplo correto.'),

  -- Mini-simulado (Q17-28)
  ((select id from b_simulado), 1, 'Português',
   'Assinale a transformação correta para a voz passiva: "O servidor analisou os documentos".',
   '{"A":"Os documentos analisaram o servidor.","B":"Os documentos foram analisados pelo servidor.","C":"O servidor foi analisado pelos documentos.","D":"Analisaram o servidor os documentos."}'::jsonb,
   'B', 'Objeto direto "os documentos" vira sujeito paciente; "analisou" vira "foram analisados"; "o servidor" vira agente da passiva.'),

  ((select id from b_simulado), 2, 'Português',
   'Assinale a frase correta de acordo com a norma-padrão.',
   '{"A":"Vende-se apartamentos.","B":"Precisam-se de funcionários.","C":"Alugam-se salas comerciais.","D":"Publicou-se os resultados."}'::jsonb,
   'C', '"Alugam-se salas comerciais" concorda corretamente com o sujeito paciente plural. As demais erram a concordância ou a regência de "precisar de".'),

  ((select id from b_simulado), 3, 'Matemática/RLM',
   'Um candidato obteve notas 6, 8 e 10. Qual é a média aritmética?',
   '{"A":"7","B":"7,5","C":"8","D":"9"}'::jsonb,
   'C', '(6+8+10)/3 = 24/3 = 8.'),

  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Uma prova tem nota 8 com peso 2 e nota 6 com peso 3. Qual é a média ponderada?',
   '{"A":"6,4","B":"6,8","C":"7","D":"7,2"}'::jsonb,
   'B', '(8×2+6×3)/(2+3) = (16+18)/5 = 34/5 = 6,8.'),

  ((select id from b_simulado), 5, 'Matemática/RLM',
   'A média de cinco números é 14. Qual é a soma desses números?',
   '{"A":"19","B":"56","C":"65","D":"70"}'::jsonb,
   'D', '14 × 5 = 70.'),

  ((select id from b_simulado), 6, 'Administrativo',
   'Qual dos elementos do ato administrativo corresponde ao objetivo legal que a Administração deve buscar?',
   '{"A":"Motivo","B":"Finalidade","C":"Forma","D":"Objeto"}'::jsonb,
   'B', 'Finalidade é o objetivo público previsto no ordenamento jurídico.'),

  ((select id from b_simulado), 7, 'Administrativo',
   'A retirada de um ato válido por razões de conveniência e oportunidade denomina-se, em regra:',
   '{"A":"Anulação","B":"Convalidação","C":"Revogação","D":"Homologação"}'::jsonb,
   'C', 'Ato válido inconveniente/inoportuno → revogação.'),

  ((select id from b_simulado), 8, 'Administrativo',
   'Sobre os atributos dos atos administrativos, assinale a alternativa correta.',
   '{"A":"Todos os atos possuem sempre autoexecutoriedade.","B":"A presunção de legitimidade é absoluta.","C":"A imperatividade está presente obrigatoriamente em qualquer ato.","D":"A autoexecutoriedade existe em determinadas hipóteses, conforme o fundamento jurídico aplicável."}'::jsonb,
   'D', 'A autoexecutoriedade não é geral — depende de fundamento jurídico em cada caso.'),

  ((select id from b_simulado), 9, 'Informática',
   'A alteração não autorizada de informações em um cadastro compromete diretamente qual pilar da segurança?',
   '{"A":"Integridade","B":"Disponibilidade","C":"Portabilidade","D":"Compactação"}'::jsonb,
   'A', 'Alteração indevida de dados compromete a integridade.'),

  ((select id from b_simulado), 10, 'Informática',
   'Um software que coleta informações sobre a atividade do usuário sem autorização é classificado, tipicamente, como:',
   '{"A":"Firewall","B":"Spyware","C":"Editor de texto","D":"Gerenciador de arquivos"}'::jsonb,
   'B', 'Spyware monitora/coleta informações sem autorização.'),

  ((select id from b_simulado), 11, 'Informática',
   'Qual é uma medida adequada diante de uma mensagem suspeita que solicita a senha bancária?',
   '{"A":"Responder informando a senha.","B":"Encaminhar a senha para confirmar a identidade.","C":"Clicar no link e testar se funciona.","D":"Não fornecer os dados e verificar a solicitação pelo canal oficial."}'::jsonb,
   'D', 'A conduta segura é não fornecer dados e confirmar pelo canal oficial, nunca pelo link recebido.'),

  ((select id from b_simulado), 12, 'Administrativo',
   'Qual alternativa diferencia corretamente anulação e revogação?',
   '{"A":"Anulação corrige apenas erros de digitação; revogação elimina qualquer ilegalidade.","B":"Anulação está ligada à ilegalidade; revogação, à conveniência e oportunidade de ato válido.","C":"Ambas são sempre realizadas exclusivamente pelo Poder Judiciário.","D":"A revogação é obrigatória sempre que um ato for ilegal."}'::jsonb,
   'B', 'É a diferença central entre os dois institutos.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
