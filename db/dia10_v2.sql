-- Cadastra o Dia 10 (versão completa e robusta).
delete from days where week = 2 and day_number = 5;

with d as (
  insert into days (week, day_number, title)
  values (2, 5, 'Interpretação e conectivos + frações/decimais/porcentagem + art. 5º aprofundado + e-mail e segurança digital')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Interpretação de textos: tema, ideia principal, inferência e conectivos', 30, $$Interpretação de texto aparece em Português e também em enunciados de Matemática, Direito, Informática e Conhecimentos Bancários. O segredo é responder com base no texto, não apenas no que você já sabe sobre o assunto.

TEMA, IDEIA PRINCIPAL E FINALIDADE
Tema: assunto geral do texto (ex.: a importância da educação financeira). Ideia principal: o que o texto afirma principalmente sobre o assunto (ex.: controlar os gastos ajuda a evitar o endividamento). Finalidade: o objetivo comunicativo — informar, explicar, convencer, criticar ou orientar.
Exemplo: "Muitas pessoas acreditam que economizar depende exclusivamente de ganhar um salário elevado. Entretanto, registrar os gastos e planejar as compras também contribuem para uma vida financeira equilibrada." Tema: organização financeira pessoal. Ideia principal: o planejamento contribui para o equilíbrio financeiro, independentemente de depender só de salário alto. Finalidade: informar e destacar a importância de hábitos de organização financeira. A ideia principal NÃO é "ganhar salário elevado" — essa informação aparece só para ser contrastada.

INFORMAÇÃO EXPLÍCITA × INFERÊNCIA
Explícita: está escrita diretamente. Inferência: conclusão extraída das informações, mesmo sem as mesmas palavras.
Exemplo: "João saiu de casa levando guarda-chuva e capa impermeável. Ao chegar ao trabalho, guardou os dois objetos molhados." Explícito: levou guarda-chuva e capa. Inferência razoável: provavelmente choveu no trajeto. Conclusão não autorizada: "João chegou atrasado" — sem apoio no texto.
Dica: a alternativa pode parecer lógica na vida real, mas se não for sustentada pelo texto, não é a correta.

CONECTIVOS
Mas/porém/entretanto → oposição ("Estudou, mas errou a questão."). Portanto/logo → conclusão ("Estudou bastante; portanto, estava preparado."). Porque/pois → causa/explicação, conforme o contexto ("Faltou porque estava doente."). Embora/ainda que → concessão ("Embora estivesse cansado, continuou."). Se/caso → condição ("Se estudar, poderá melhorar."). E/além disso → adição ("Leu a teoria e resolveu exercícios."). Para que → finalidade ("Estudou para que pudesse melhorar.").
A classificação exata de alguns conectivos depende do contexto — leia a frase completa.
Oposição × concessão: "Queria sair, mas estava chovendo." (oposição) × "Embora estivesse chovendo, saiu." (concessão) — ambas têm contraste, mas estrutura gramatical diferente.

COMO RESOLVER
Leia o comando da questão. Leia o texto procurando o assunto central. Identifique palavras de oposição, causa ou conclusão. Compare cada alternativa com o texto. Elimine opções que exageram, contradizem ou inventam informações. Não escolha uma alternativa só porque parece "mais bonita ou completa".$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — interpretação e conectivos (Q1 a Q3)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Frações, decimais e porcentagem — cálculo e pegadinhas', 35, $$FRAÇÕES
Numerador (número de cima) indica quantas partes consideramos; denominador (número de baixo) indica em quantas partes o todo foi dividido. Ex.: pizza dividida em 4, você comeu 3 → 3/4 = 0,75 = 75%.
Memorize: 1/2 = 0,5 = 50%. 1/4 = 0,25 = 25%. 3/4 = 0,75 = 75%. 1/5 = 0,2 = 20%. 1/10 = 0,1 = 10%. 1/100 = 0,01 = 1%.

PORCENTAGEM EM DECIMAL
Divida por 100: 35% = 0,35; 8% = 0,08; 125% = 1,25 (maior que 100%, representa valor maior que o total de referência).

CALCULANDO PORCENTAGEM
Fórmula: porcentagem = valor × (p/100). Ex.: 20% de 300 = 300 × 0,20 = 60. 15% de R$ 800 = 800 × 0,15 = 120.
Método mental: separe em partes fáceis — 35% de 200 = 30% (60) + 5% (10) = 70.

AUMENTO PERCENTUAL
Produto de R$ 200 com aumento de 10%: 200 × 0,10 = 20; 200 + 20 = 220. Atalho: 200 × 1,10 = 220. Multiplicadores: +10% → ×1,10; +20% → ×1,20; +5% → ×1,05.

DESCONTO PERCENTUAL
Produto de R$ 400 com desconto de 15%: 400 × 0,15 = 60; 400 − 60 = 340. Atalho: 400 × 0,85 = 340 (restam 85% do original).

PEGADINHA — AUMENTOS E DESCONTOS SUCESSIVOS
Produto de R$ 100 que aumenta 20% e depois tem desconto de 20% NÃO volta a R$ 100. Aumento: 100 × 1,20 = 120. Desconto sobre o novo valor: 120 × 0,80 = 96. O desconto incide sobre R$ 120, não sobre os R$ 100 iniciais. Regra de ouro: em alterações sucessivas, calcule cada etapa sobre o valor já atualizado.

DESCOBRIR QUE PERCENTUAL UM NÚMERO REPRESENTA
Divida a parte pelo total e multiplique por 100. Ex.: prova de 40 questões, 30 acertos: (30/40) × 100 = 75%. De 200 candidatos, 50 aprovados: (50/200) × 100 = 25%.

COMO IDENTIFICAR O QUE A QUESTÃO PEDE
"Quanto é 20% de 300?" → × 0,20. "Aumentou 20%" → × 1,20. "Desconto de 20%" → × 0,80. "Qual o percentual de acertos?" → acertos ÷ total × 100.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — frações, decimais e porcentagem (Q1 a Q4)', 15
  from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Art. 5º aprofundado — igualdade, legalidade, pensamento, domicílio, reunião, Justiça', 30, $$Direito Constitucional estuda a Constituição, a organização do Estado, os poderes públicos e os direitos fundamentais. Hoje o foco é aprofundar o art. 5º, que trata dos direitos e deveres individuais e coletivos.

PRINCÍPIO DA IGUALDADE
O caput do art. 5º estabelece que todos são iguais perante a lei, sem distinção de qualquer natureza, assegurando direitos fundamentais nos termos constitucionais (princípio da igualdade/isonomia). O Estado não pode discriminar arbitrariamente. Mas igualdade não significa tratamento idêntico em qualquer situação — a lei pode estabelecer tratamentos diferenciados com fundamento constitucional e jurídico adequado (ex.: condições de acessibilidade para candidatos com deficiência em concurso, que não violam a igualdade — buscam garantir participação efetiva).

VIDA, LIBERDADE, IGUALDADE, SEGURANÇA E PROPRIEDADE
São direitos fundamentais do art. 5º, mas seu exercício deve observar a Constituição e o ordenamento jurídico — propriedade, por exemplo, não autoriza usar um bem de qualquer maneira, ignorando as limitações legais.

PRINCÍPIO DA LEGALIDADE (inciso II)
"Ninguém será obrigado a fazer ou deixar de fazer alguma coisa senão em virtude de lei." Obrigações e proibições precisam de fundamento jurídico adequado — um órgão público não pode inventar uma obrigação sem base legal. Atenção: a legalidade também aparece no art. 37 (Administração Pública) — a ideia central se conecta, mas o contexto de cada dispositivo deve ser observado.

LIBERDADE DE MANIFESTAÇÃO DO PENSAMENTO (inciso IV)
Protegida, mas é vedado o anonimato — a proteção não elimina a possibilidade de responsabilização por abusos. A liberdade de expressão não autoriza praticar ilícitos contra outras pessoas.

LIBERDADE DE CONSCIÊNCIA E DE CRENÇA
Também protegida pelo art. 5º, incluindo a liberdade religiosa. Cuidado com alternativas que digam que o Estado pode impor uma crença religiosa — isso contraria a Constituição.

INVIOLABILIDADE DE DOMICÍLIO (inciso XI)
A casa é inviolável, mas há exceções constitucionais: flagrante delito, desastre, prestação de socorro, ou durante o dia por determinação judicial. Pegadinha: ordem judicial, por si só, não autoriza ingresso em qualquer horário — só durante o dia.

SIGILO DAS COMUNICAÇÕES (inciso XII)
Protegido, com exceção: interceptação de comunicações telefônicas pode ser autorizada judicialmente, nas condições constitucionais, para investigação criminal ou instrução processual penal, conforme a lei. Não confunda com autorização geral para qualquer pessoa acessar conversas privadas.

ACESSO À JUSTIÇA (inciso XXXV)
"A lei não excluirá da apreciação do Poder Judiciário lesão ou ameaça a direito" — princípio da inafastabilidade da jurisdição. Havendo lesão ou ameaça, a pessoa pode buscar o Judiciário, observadas as regras processuais.

DIREITO DE REUNIÃO
Reunião pacífica, sem armas, em locais abertos ao público, independentemente de autorização, observados os requisitos constitucionais: aviso prévio à autoridade competente e ausência de frustração de outra reunião já convocada para o mesmo local. Atenção: aviso prévio ≠ autorização — a Constituição exige aviso, não autorização geral.

COMO ESTUDAR A CONSTITUIÇÃO
Leia o artigo diretamente no texto constitucional. Destaque regras, exceções e condições. Resolva questões para notar como a banca modifica a redação. Palavras como "sempre", "nunca", "somente" e "independentemente" merecem atenção redobrada.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — art. 5º aprofundado (Q1 a Q4)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'E-mail, anexos, phishing, malware, senhas e backup', 25, $$CORREIO ELETRÔNICO
Permite enviar e receber mensagens pela internet. Campos: remetente, destinatário, assunto, corpo, anexo, Cc (cópia), Cco (cópia oculta).
Cc: os destinatários desse campo ficam visíveis para os demais. Cco: os destinatários desse campo NÃO ficam visíveis uns para os outros (mas os de Cc continuam aparecendo). Ex.: comunicado para 100 candidatos sem divulgar os e-mails de todos → usar Cco. Cco não é criptografia — só oculta os destinatários entre si, não torna a mensagem secreta.

ANEXO
Arquivo enviado junto com a mensagem (Word, PDF, planilha, foto, compactado). Cuidados: não abrir automaticamente todo arquivo recebido; desconfiar quando não esperava a mensagem, o remetente parece estranho, o assunto cria urgência/medo, a extensão é inesperada, ou a mensagem pede senha/dados bancários/código de autenticação. Verifique o endereço completo do remetente, mesmo que o nome exibido pareça conhecido.

PHISHING
Técnica de fraude para enganar a vítima e obter informações, instalar malware ou induzir uma ação. Ex.: "Sua conta será bloqueada em 10 minutos. Clique aqui e informe sua senha." Sinais de alerta: pressa artificial, ameaças de bloqueio, links suspeitos, erros/inconsistências na mensagem, pedido de senha ou código. Como agir: não clicar — acessar o app/site oficial digitando o endereço conhecido.

COMO CONFERIR UM LINK
Observe o endereço real antes de clicar — golpistas criam endereços parecidos trocando letras ou usando domínio diferente. Cadeado/HTTPS protege a comunicação em trânsito, mas não garante que o site seja legítimo — um site fraudulento também pode ter HTTPS.

PRINCIPAIS TIPOS DE MALWARE
Vírus: infecta arquivos, se espalha quando executados/compartilhados. Trojan (cavalo de troia): se disfarça de programa legítimo. Spyware: coleta informações/monitora atividades. Ransomware: pode bloquear/criptografar arquivos e exigir resgate. Worm: pode se propagar entre sistemas e redes sem depender da ação direta do usuário a cada etapa. Antivírus ajuda a detectar ameaças, mas não substitui cuidado, atualizações e backup.

SENHAS E AUTENTICAÇÃO MULTIFATOR (MFA)
Use senhas longas e exclusivas (não reutilizar entre serviços); considere um gerenciador de senhas; ative MFA quando disponível; nunca compartilhe códigos temporários, mesmo com quem se diz "suporte". MFA exige mais de uma forma de comprovar identidade (ex.: senha + confirmação por app autenticador).

BACKUP E ATUALIZAÇÃO
Backup é cópia de segurança para recuperar dados em caso de perda, falha ou ataque. Não confunda com sincronização — um arquivo apagado pode ter a exclusão sincronizada entre dispositivos. Mantenha cópias independentes e teste a recuperação. Atualizações corrigem vulnerabilidades de segurança.$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — e-mail e segurança digital (Q1 a Q4)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 10, 3 questões por matéria (Q13 a Q24)', 40,
    $$Sem consultar a teoria. 12 questões, 3 de cada matéria: Português (interpretação/conectivos), Matemática (porcentagem), Constitucional (art. 5º) e Informática (e-mail/segurança).$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Correção, caderno de erros e meta do dia', 20, $$CORREÇÃO
Não basta responder — descubra por que acertou ou errou. Para cada erro, registre: matéria; assunto (ex.: inferência, porcentagem, legalidade, phishing); causa do erro (não sabia a regra / interpretou errado / errou o cálculo); a regra correta, com suas palavras. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app, com revisão agendada em 24h, 7 dias e 30 dias — visível no Painel.

META DE HOJE
Estudar a teoria das quatro matérias. Resolver as 15 questões de fixação. Resolver as 12 questões do mini-simulado. Corrigir e registrar os erros. Separar os assuntos que precisam de reforço. Marque este bloco como concluído para fechar o Dia 10.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-3)
  ((select id from b_port_ex), 1, 'Português',
   'No trecho "O candidato estudou bastante; portanto, estava preparado", o conectivo "portanto" indica:',
   '{"A":"oposição","B":"conclusão","C":"condição","D":"concessão","E":"finalidade"}'::jsonb,
   'B', '"Portanto" introduz uma conclusão a partir do que foi dito antes.'),

  ((select id from b_port_ex), 2, 'Português',
   'Leia: "Marina estudava diariamente, mas ainda sentia dificuldade em Matemática." A palavra "mas" expressa:',
   '{"A":"conclusão","B":"causa","C":"oposição","D":"finalidade","E":"condição"}'::jsonb,
   'C', '"Mas" é conjunção adversativa — contrapõe o estudo diário à dificuldade persistente.'),

  ((select id from b_port_ex), 3, 'Português',
   'Um texto afirma: "Pedro levou o casaco e voltou para casa com a roupa seca." Qual conclusão é segura?',
   '{"A":"Choveu durante todo o dia.","B":"Pedro ficou doente.","C":"Pedro não precisou trabalhar.","D":"Pedro voltou com a roupa seca.","E":"Pedro esqueceu o casaco no trabalho."}'::jsonb,
   'D', 'É a única informação explicitamente afirmada pelo texto — as demais extrapolam ou inventam dados.'),

  -- Matemática — fixação (Q1-4)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Quanto é 25% de 240?',
   '{"A":"40","B":"50","C":"60","D":"70","E":"80"}'::jsonb,
   'C', '240 × 0,25 = 60.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Um produto custa R$ 500 e recebe desconto de 12%. Qual é o preço final?',
   '{"A":"R$ 400","B":"R$ 420","C":"R$ 440","D":"R$ 450","E":"R$ 488"}'::jsonb,
   'C', '500 × 0,88 = 440.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Uma prova tem 60 questões. Um candidato acertou 45. Qual foi seu percentual de acertos?',
   '{"A":"60%","B":"65%","C":"70%","D":"75%","E":"80%"}'::jsonb,
   'D', '(45/60) × 100 = 75%.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Um produto de R$ 200 sofre aumento de 10% e, depois, desconto de 10%. Qual é o preço final?',
   '{"A":"R$ 180","B":"R$ 198","C":"R$ 200","D":"R$ 202","E":"R$ 220"}'::jsonb,
   'B', '200 × 1,10 × 0,90 = 198 — não volta aos R$ 200 originais.'),

  -- Constitucional — fixação (Q1-4)
  ((select id from b_const_ex), 1, 'Constitucional',
   'Segundo o princípio da legalidade previsto no artigo 5º, inciso II, da Constituição:',
   '{"A":"qualquer pessoa pode criar obrigações públicas.","B":"ninguém pode ser obrigado a fazer ou deixar de fazer algo senão em virtude de lei.","C":"o Estado pode ignorar a lei em situações comuns.","D":"somente servidores públicos possuem direitos.","E":"todo ato administrativo dispensa fundamento jurídico."}'::jsonb,
   'B', 'É a literalidade do inciso II: ninguém será obrigado a fazer ou deixar de fazer algo senão em virtude de lei.'),

  ((select id from b_const_ex), 2, 'Constitucional',
   'A Constituição protege a liberdade de manifestação do pensamento, mas prevê:',
   '{"A":"proibição de qualquer opinião crítica.","B":"obrigatoriedade de autorização prévia para toda opinião.","C":"vedação ao anonimato.","D":"impossibilidade de responsabilização por abusos.","E":"proibição de manifestação política."}'::jsonb,
   'C', 'Inciso IV: é livre a manifestação do pensamento, mas é vedado o anonimato.'),

  ((select id from b_const_ex), 3, 'Constitucional',
   'A inviolabilidade domiciliar admite, entre outras hipóteses constitucionais:',
   '{"A":"entrada livre de qualquer agente público a qualquer hora.","B":"entrada por mera curiosidade de um vizinho.","C":"entrada por determinação judicial durante o dia, observadas as regras constitucionais.","D":"entrada obrigatória sempre que houver denúncia anônima.","E":"entrada sem consentimento em qualquer situação."}'::jsonb,
   'C', 'O mandado judicial só autoriza entrada durante o dia — é uma das exceções constitucionais à inviolabilidade domiciliar.'),

  ((select id from b_const_ex), 4, 'Constitucional',
   'O direito de reunião previsto no artigo 5º protege, nos termos constitucionais, reuniões:',
   '{"A":"pacíficas e sem armas, observadas as condições constitucionais.","B":"sempre armadas.","C":"que dispensem qualquer condição constitucional.","D":"que impeçam necessariamente toda reunião posterior.","E":"somente realizadas dentro de prédios públicos."}'::jsonb,
   'A', 'Reunião pacífica, sem armas, em local aberto ao público, com aviso prévio — essas são as condições constitucionais.'),

  -- Informática — fixação (Q1-4)
  ((select id from b_info_ex), 1, 'Informática',
   'O campo Cco de um e-mail serve para:',
   '{"A":"excluir o assunto.","B":"ocultar os destinatários incluídos nesse campo dos demais destinatários da mensagem.","C":"criptografar obrigatoriamente a mensagem.","D":"impedir qualquer encaminhamento.","E":"bloquear automaticamente todos os vírus."}'::jsonb,
   'B', 'Cco (cópia oculta): os destinatários desse campo não ficam visíveis uns para os outros.'),

  ((select id from b_info_ex), 2, 'Informática',
   'Phishing é:',
   '{"A":"uma cópia de segurança.","B":"uma ferramenta de edição de texto.","C":"uma tentativa de enganar o usuário para obter dados ou induzi-lo a uma ação.","D":"um tipo de impressora.","E":"um método de compactação."}'::jsonb,
   'C', 'É a definição clássica de phishing.'),

  ((select id from b_info_ex), 3, 'Informática',
   'Qual alternativa descreve corretamente o ransomware?',
   '{"A":"É sempre um programa de backup.","B":"É um navegador de internet.","C":"É uma planilha eletrônica.","D":"É um tipo de malware que pode bloquear ou criptografar arquivos e exigir resgate.","E":"É um protocolo exclusivo de e-mail."}'::jsonb,
   'D', 'Ransomware pode bloquear/criptografar arquivos e exigir pagamento (resgate) para liberar o acesso.'),

  ((select id from b_info_ex), 4, 'Informática',
   'Sobre o HTTPS, assinale a alternativa correta:',
   '{"A":"Garante que qualquer site seja honesto.","B":"Impede todos os golpes digitais.","C":"Protege a comunicação, mas não garante que o site seja legítimo.","D":"Substitui o antivírus.","E":"Impede que o usuário envie dados pessoais."}'::jsonb,
   'C', 'HTTPS protege a comunicação em trânsito — um site fraudulento também pode usar HTTPS.'),

  -- Mini-simulado (Q13-24)
  ((select id from b_simulado), 1, 'Português',
   'Leia o trecho: "Apesar das dificuldades iniciais, a candidata manteve a rotina de estudos e melhorou seu desempenho." A expressão "apesar das" indica uma relação de:',
   '{"A":"causa.","B":"concessão.","C":"conclusão.","D":"finalidade.","E":"adição."}'::jsonb,
   'B', '"Apesar das" introduz uma concessão: mesmo com as dificuldades, ela manteve a rotina.'),

  ((select id from b_simulado), 2, 'Português',
   'Assinale a alternativa que apresenta uma conclusão sustentada pelo trecho: "Os funcionários participaram de um treinamento sobre segurança digital. Depois, passaram a reconhecer melhor as mensagens fraudulentas."',
   '{"A":"Todos os funcionários foram promovidos.","B":"O treinamento eliminou todos os golpes.","C":"O treinamento contribuiu para melhorar o reconhecimento de mensagens fraudulentas.","D":"As mensagens fraudulentas deixaram de existir.","E":"Nenhum funcionário teve dúvidas."}'::jsonb,
   'C', 'É a única conclusão sustentada diretamente pelo texto — as demais extrapolam ("todos", "eliminou", "deixaram de existir").'),

  ((select id from b_simulado), 3, 'Português',
   'Em "O sistema estava atualizado; portanto, recebeu as correções de segurança disponíveis", o conectivo "portanto" expressa:',
   '{"A":"oposição.","B":"condição.","C":"concessão.","D":"conclusão.","E":"comparação."}'::jsonb,
   'D', '"Portanto" introduz uma conclusão.'),

  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Quanto é 15% de 600?',
   '{"A":"60","B":"75","C":"90","D":"100","E":"120"}'::jsonb,
   'C', '600 × 0,15 = 90.'),

  ((select id from b_simulado), 5, 'Matemática/RLM',
   'Um produto custa R$ 800 e recebe desconto de 25%. Qual é o preço final?',
   '{"A":"R$ 500","B":"R$ 550","C":"R$ 600","D":"R$ 650","E":"R$ 700"}'::jsonb,
   'C', '800 × 0,75 = 600.'),

  ((select id from b_simulado), 6, 'Matemática/RLM',
   'Um candidato acertou 36 questões de uma prova com 48 questões. Qual foi o percentual de acertos?',
   '{"A":"60%","B":"65%","C":"70%","D":"75%","E":"80%"}'::jsonb,
   'D', '(36/48) × 100 = 75%.'),

  ((select id from b_simulado), 7, 'Constitucional',
   'O princípio da igualdade está relacionado à ideia de que:',
   '{"A":"todas as pessoas devem receber sempre tratamento absolutamente idêntico, sem exceções.","B":"o Estado pode discriminar livremente qualquer pessoa.","C":"todos são iguais perante a lei, observados os princípios e as regras constitucionais.","D":"apenas servidores públicos possuem direitos fundamentais.","E":"a Constituição não limita a atuação do Estado."}'::jsonb,
   'C', 'É a síntese correta do caput do art. 5º — igualdade não significa tratamento idêntico em qualquer situação, mas sim perante a lei, nos termos constitucionais.'),

  ((select id from b_simulado), 8, 'Constitucional',
   'Segundo o artigo 5º da Constituição, a liberdade de manifestação do pensamento está associada à:',
   '{"A":"proibição absoluta de críticas.","B":"vedação ao anonimato.","C":"necessidade de autorização prévia para qualquer opinião.","D":"impossibilidade de responsabilização por abusos.","E":"proibição de opiniões políticas."}'::jsonb,
   'B', 'Inciso IV: livre a manifestação do pensamento, vedado o anonimato.'),

  ((select id from b_simulado), 9, 'Constitucional',
   'A garantia de que a lei não excluirá da apreciação do Poder Judiciário lesão ou ameaça a direito está relacionada ao:',
   '{"A":"princípio da inafastabilidade da jurisdição.","B":"princípio da anterioridade tributária.","C":"direito exclusivo dos servidores públicos.","D":"poder regulamentar.","E":"princípio da eficiência administrativa."}'::jsonb,
   'A', 'É exatamente o princípio da inafastabilidade da jurisdição (art. 5º, XXXV).'),

  ((select id from b_simulado), 10, 'Informática',
   'Uma mensagem inesperada pede que você clique em um link para informar sua senha bancária. A conduta mais segura é:',
   '{"A":"clicar rapidamente para evitar bloqueio.","B":"responder com a senha para confirmar a identidade.","C":"encaminhar a senha para o remetente.","D":"acessar o serviço por canal oficial e verificar a autenticidade da mensagem.","E":"desativar as atualizações do computador."}'::jsonb,
   'D', 'A conduta segura é nunca clicar no link suspeito e verificar a situação diretamente pelo canal oficial.'),

  ((select id from b_simulado), 11, 'Informática',
   'A principal finalidade de um backup é:',
   '{"A":"aumentar automaticamente a velocidade da internet.","B":"recuperar informações em caso de perda ou dano.","C":"impedir todos os tipos de malware.","D":"substituir senhas fortes.","E":"ocultar os destinatários de e-mail."}'::jsonb,
   'B', 'Backup é a cópia de segurança para recuperar dados em caso de perda, falha ou ataque.'),

  ((select id from b_simulado), 12, 'Informática',
   'Qual alternativa apresenta uma boa prática de segurança?',
   '{"A":"Reutilizar a mesma senha em todos os serviços.","B":"Compartilhar códigos de autenticação com pessoas que se identificam como suporte.","C":"Abrir qualquer anexo recebido.","D":"Ignorar atualizações de segurança.","E":"Utilizar senhas exclusivas e ativar autenticação multifator."}'::jsonb,
   'E', 'Senhas exclusivas por serviço e autenticação multifator são boas práticas recomendadas — as demais são exatamente o que se deve evitar.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
