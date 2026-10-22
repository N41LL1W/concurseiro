-- Cadastra o Dia 17 (versão completa e robusta).
delete from days where week = 4 and day_number = 3;

with d as (
  insert into days (week, day_number, title)
  values (4, 3, 'Classes de palavras + porcentagem (sucessivos/variação) + art. 5º e remédios constitucionais + segurança da informação')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Substantivo, adjetivo, verbo, advérbio e pronome — identificação pelo contexto', 30, $$SUBSTANTIVO
Nomeia seres, objetos, lugares, sentimentos, ideias e fenômenos: pessoa (servidor, candidato), objeto (computador, documento), lugar (agência, tribunal), sentimento (alegria, medo), ideia (liberdade, justiça).
Tipos: comum (cidade), próprio (Brodowski), concreto (computador, fada), abstrato (estudo, tristeza, beleza — ação/estado/qualidade/sentimento), coletivo (equipe, biblioteca, cardume). Atenção: abstrato não é só "o que não se toca" — palavras como corrida, trabalho e crescimento são abstratas por expressarem ação/processo.

ADJETIVO
Caracteriza ou atribui qualidade ao substantivo: documento digital, servidor atencioso, prova difícil, atendimento rápido.
Compare: "O servidor atencioso resolveu o problema." (atencioso = adjetivo, caracteriza o servidor) × "O servidor resolveu o problema atenciosamente." (atenciosamente = advérbio, modifica a ação).

VERBO
Expressa ação (estudar, escrever, analisar), estado (ser, estar, permanecer), mudança de estado (ficar, tornar-se) ou fenômeno da natureza (chover, anoitecer). Tempos: presente (estuda), pretérito (estudou), futuro (estudará).
Atenção ao subjuntivo: "Quando ele chegar, começaremos." (futuro do subjuntivo); "Se ele estudasse, teria mais segurança." (pretérito imperfeito do subjuntivo) — o subjuntivo costuma expressar hipótese, dúvida, desejo ou condição.

ADVÉRBIO
Modifica verbo, adjetivo ou outro advérbio, indicando circunstância: tempo (hoje, ontem, amanhã), lugar (aqui, ali, longe), modo (bem, mal, rapidamente), intensidade (muito, pouco, bastante), negação (não, nunca), afirmação (sim, certamente), dúvida (talvez, possivelmente).
Ex.: "O candidato respondeu rapidamente." (modo). "A prova estava muito difícil." (intensidade, modifica o adjetivo "difícil"). "Ele nunca faltou." (negação).
Pegadinha: nem toda palavra terminada em "-mente" deve ser analisada só pela terminação — observe a função no contexto (claramente, cuidadosamente geralmente são advérbios, mas confira).

PRONOME
Acompanha ou substitui um substantivo: pessoais (eu, tu, ele, nós, eles), possessivos (meu, sua, nosso), demonstrativos (este, esse, aquele), indefinidos (alguém, ninguém, tudo, algum), interrogativos (quem, qual, quanto), relativos (que, quem, cujo, onde).
Ex.: "Meu material está na mesa." (possessivo). "Aquele candidato chegou cedo." (demonstrativo). "O documento que recebi está completo." (relativo, retoma "documento").

UMA PALAVRA PODE MUDAR DE CLASSE
"O jantar estava pronto." (jantar = substantivo) × "Vamos jantar cedo." (jantar = verbo). "Ele fala baixo." (baixo = advérbio, como ele fala) × "O muro é baixo." (baixo = adjetivo, caracteriza o muro).
Estratégia: não identifique a classe só pela aparência — observe a função que a palavra exerce na frase.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — classes de palavras (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Porcentagem: atalhos, aumentos/descontos sucessivos e variação percentual', 35, $$PORCENTAGEM
10%=0,10; 25%=0,25; 50%=0,50; 75%=0,75; 100%=1. Para calcular, multiplique o valor pela porcentagem em decimal. Ex.: 20% de 800 = 800×0,20=160. 15% de 240 = 240×0,15=36.

ATALHOS MENTAIS
10%: divida por 10. 1%: divida por 100. 5%: calcule 10% e divida por 2. 20%: divida por 5. 25%: divida por 4. 50%: divida por 2. Ex.: 5% de 600 → 10% de 600=60 → metade=30.

AUMENTO PERCENTUAL
Soma-se ao valor inicial a porcentagem calculada sobre ele. Ex.: salário de R$ 2.000 com aumento de 8%: 2000×0,08=160; 2000+160=2160. Fator multiplicativo: 2000×1,08=2160. Para aumento de p%, fator = 1+(p/100).

DESCONTO PERCENTUAL
Subtrai-se do valor inicial a porcentagem calculada. Ex.: produto de R$ 500 com desconto de 12%: 500×0,12=60; 500−60=440. Fator: 500×0,88=440. Para desconto de p%, fator = 1−(p/100).

AUMENTOS E DESCONTOS SUCESSIVOS
Percentuais sucessivos incidem sobre o valor ATUALIZADO, não sobre o original. Ex.: R$ 100 aumenta 10% e depois tem desconto de 10%: 100×1,10=110; 110×0,90=99 (não volta a R$ 100 — o aumento incidiu sobre 100, o desconto sobre 110).
Outro ex.: R$ 200 com dois descontos sucessivos de 10%: 200×0,90×0,90=162 — desconto total de R$ 38, ou seja, 19% do preço inicial, não 20%.

VARIAÇÃO PERCENTUAL
Fórmula: variação % = [(valor final − valor inicial) / valor inicial] × 100. Ex.: atendimentos de 80 para 100: (100−80)/80×100=25% (aumento). De 100 para 80: (80−100)/100×100=−20% (redução).
Atenção: aumentar de 80 para 100 é 25%, mas cair de 100 para 80 é 20% — o percentual depende de qual valor é usado como base (o inicial).$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — porcentagem (Q1 a Q4)', 15
  from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Direitos × garantias, art. 5º (igualdade, legalidade, expressão, domicílio, sigilo) e remédios constitucionais', 30, $$DIREITOS × GARANTIAS
Direitos fundamentais: bens e liberdades protegidos (vida, liberdade, igualdade, segurança, propriedade). Garantias fundamentais: instrumentos que protegem esses direitos (habeas corpus, mandado de segurança). Ex.: liberdade de locomoção é direito; habeas corpus é a garantia que pode protegê-la.

PRINCÍPIO DA IGUALDADE
Todos são iguais perante a lei, sem distinção, observadas as disposições constitucionais. Igualdade não significa tratamento idêntico em toda situação — medidas diferenciadas podem ser legítimas quando corrigem desigualdades e respeitam a Constituição.

LEGALIDADE (inciso II)
"Ninguém será obrigado a fazer ou deixar de fazer alguma coisa senão em virtude de lei" — toda obrigação precisa de fundamento jurídico. Para agentes públicos, a legalidade também é princípio central da Administração: atuar dentro das competências e autorizações do ordenamento.

LIBERDADE DE EXPRESSÃO E DIREITO DE RESPOSTA
Protegida a manifestação do pensamento, vedado o anonimato. Protegida a expressão intelectual, artística, científica e de comunicação, sem censura ou licença. Isso não é liberdade ilimitada para violar direitos de terceiros — a Constituição também protege honra, imagem e intimidade, prevendo direito de resposta e indenização cabível.

INVIOLABILIDADE DA CASA
Asilo inviolável — ninguém entra sem consentimento, salvo: flagrante delito; desastre; prestação de socorro; durante o dia, por determinação judicial. Pegadinha: só o mandado judicial exige "durante o dia" — as demais exceções têm disciplina própria (podem ocorrer a qualquer hora).

SIGILO DAS COMUNICAÇÕES
Protegido (correspondência, telefone), com exceção para interceptação telefônica: autorização judicial, nas hipóteses e forma da lei, para investigação criminal ou instrução processual penal. Não confunda interceptação telefônica com qualquer acesso a dados ou registros — são situações diferentes.

REMÉDIOS CONSTITUCIONAIS
Habeas corpus: protege a liberdade de locomoção contra ilegalidade/abuso de poder — não exige, em regra, advogado para ser impetrado.
Habeas data: conhecer/retificar informações pessoais em registros constitucionalmente previstos.
Mandado de segurança: protege direito líquido e certo, quando cabível e não amparado por HC/HD.
Mandado de injunção: combate falta de norma regulamentadora que inviabilize direitos e liberdades constitucionais.
Ação popular: cidadão busca anular atos lesivos a bens/interesses protegidos pela Constituição — não é aberta a qualquer pessoa indistintamente, é instrumento do cidadão.

DIREITOS FUNDAMENTAIS NÃO SÃO ABSOLUTOS
Devem ser compreendidos em conjunto com outros direitos e regras constitucionais — liberdade de expressão não autoriza ameaçar alguém, cometer crimes ou violar impunemente direitos de terceiros.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — art. 5º e remédios constitucionais (Q1 a Q4)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'Segurança da informação: CID, malware, phishing, engenharia social, autenticação e backup', 25, $$TRÍADE CID
Confidencialidade: só pessoas autorizadas acessam a informação (ex.: restringir acesso a dados bancários). Integridade: a informação permanece correta, sem alteração indevida (ex.: impedir modificação não autorizada de uma transação). Disponibilidade: informação/serviços acessíveis quando necessário (ex.: manter o sistema bancário funcionando).

MALWARE
Programa/código malicioso para causar dano, obter acesso indevido ou ações não autorizadas. Vírus: infecta arquivos/programas, propaga ao executar. Worm: propaga-se automaticamente entre sistemas/redes. Trojan: disfarça-se de programa legítimo. Ransomware: bloqueia/criptografa dados e exige resgate. Spyware: espiona/coleta informações. Keylogger: registra teclas digitadas, podendo capturar senhas. Adware: exibe publicidade, pode ser invasivo. Atenção: ransomware não é só "vírus que mostra anúncio" — sua marca é bloquear/criptografar para extorquir.

PHISHING
Tentativa de enganar a vítima para obter informações ou fazê-la agir, geralmente por mensagem falsa. Ex.: e-mail dizendo que a conta será bloqueada, com link para página falsa do banco. Sinais: urgência exagerada/ameaça de bloqueio; remetente estranho; domínio diferente do oficial; anexo inesperado; pedido de senha/código/dados financeiros. Mensagens fraudulentas podem parecer profissionais e usar logotipos reais — não confie só na aparência.

ENGENHARIA SOCIAL
Manipulação de pessoas para obter acesso, informações ou ação indevida. Ex.: ligação fingindo ser do suporte técnico, pedindo o código enviado ao celular. Defesa: verificar identidade por canais oficiais; nunca compartilhar senha/código.

AUTENTICAÇÃO E SENHAS
Autenticação verifica a identidade de quem acessa. MFA usa dois ou mais fatores de categorias diferentes (ex.: senha + chave física). Senha forte: longa, exclusiva por serviço, difícil de adivinhar. Gerenciador de senhas ajuda a criar/armazenar senhas exclusivas. Atualizações corrigem falhas conhecidas. Atenção: duas senhas não são automaticamente dois fatores diferentes — MFA exige categorias distintas.

BACKUP
Cópia de segurança para recuperar dados perdidos/danificados. Boas práticas: cópias em locais/sistemas diferentes; proteger contra acesso indevido; manter cópia desconectada ou protegida contra alteração quando possível; testar a restauração periodicamente. Sincronização não é necessariamente backup — se um arquivo é apagado e a exclusão se propaga entre dispositivos, a pasta sincronizada pode não recuperar o arquivo. Por isso, backups com histórico/versões e testes de restauração são importantes.

MEDIDAS PRÁTICAS
Verificar o endereço real dos sites antes de informar dados; acessar o banco pelo app oficial ou endereço conhecido; não abrir anexos inesperados sem checar origem; manter sistema/navegador/apps atualizados; bloquear a tela e encerrar sessão em computador compartilhado; não instalar programas de fonte desconhecida; não compartilhar código de autenticação; desconfiar de pedidos de pagamento urgentes fora do procedimento normal.$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — segurança da informação (Q1 a Q4)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 17, 5 alternativas por questão (Q17 a Q28)', 40,
    $$Sem consulta. 12 questões, agora com cinco alternativas cada (A a E), misturando classes de palavras, porcentagem, remédios constitucionais, inviolabilidade de domicílio e segurança da informação.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Caderno de erros, cronograma de revisão e checklist do Dia 17', 20, $$CADERNO DE ERROS
Para cada erro, registre a matéria, a dúvida/questão e o porquê do erro. Qual matéria exigiu mais esforço hoje: Português (classes de palavras), Matemática (porcentagem), Constitucional (art. 5º) ou Informática (segurança da informação)? As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app.

CRONOGRAMA DE REVISÃO
Amanhã: 10–15 min para relembrar os conceitos e refazer as questões erradas.
Daqui a 7 dias: refaça as questões sem consultar o material, priorizando o que exigiu mais esforço.
Daqui a 30 dias: simulado misto dos conteúdos estudados ao longo dos dias anteriores.
(O app já agenda isso sozinho via o caderno de erros — 24h, 7 dias e 30 dias, visíveis no Painel.)

CHECKLIST DO DIA 17
Estudei as classes de palavras e fiz os exercícios de Português. Resolvi os cálculos de porcentagem sem consultar os exemplos. Revisei os direitos fundamentais e os remédios constitucionais. Estudei malware, phishing, autenticação e backup. Corrigi o mini-simulado e registrei minhas dúvidas. Marque este bloco como concluído para fechar o Dia 17.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Em "O atendimento foi extremamente rápido", a palavra "extremamente" é:',
   '{"A":"Substantivo","B":"Adjetivo","C":"Advérbio de intensidade","D":"Verbo"}'::jsonb,
   'C', '"Extremamente" modifica o adjetivo "rápido", indicando intensidade — é advérbio.'),

  ((select id from b_port_ex), 2, 'Português',
   'Em "Aquela funcionária organizou os documentos", a palavra "aquela" é:',
   '{"A":"Pronome demonstrativo","B":"Pronome possessivo","C":"Advérbio","D":"Substantivo"}'::jsonb,
   'A', '"Aquela" indica posição/relação com o discurso — pronome demonstrativo.'),

  ((select id from b_port_ex), 3, 'Português',
   'Em "O estudar exige disciplina", a palavra "estudar" foi empregada como:',
   '{"A":"Adjetivo","B":"Substantivo","C":"Advérbio","D":"Pronome"}'::jsonb,
   'B', 'Puxado pelo artigo "o", o verbo "estudar" está substantivado.'),

  ((select id from b_port_ex), 4, 'Português',
   'Em "O candidato respondeu cuidadosamente", "cuidadosamente" indica:',
   '{"A":"Lugar","B":"Tempo","C":"Modo","D":"Negação"}'::jsonb,
   'C', '"Cuidadosamente" indica o modo como o candidato respondeu.'),

  -- Matemática — fixação (Q1-4)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Quanto é 15% de R$ 400?',
   '{"A":"R$ 40","B":"R$ 50","C":"R$ 60","D":"R$ 80"}'::jsonb,
   'C', '400 × 0,15 = 60.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Um produto de R$ 300 recebe desconto de 20%. Qual é o preço final?',
   '{"A":"R$ 240","B":"R$ 260","C":"R$ 280","D":"R$ 200"}'::jsonb,
   'A', '300 × 0,80 = 240.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Um valor de R$ 100 aumenta 20% e depois diminui 20%. Qual é o valor final?',
   '{"A":"R$ 100","B":"R$ 96","C":"R$ 98","D":"R$ 80"}'::jsonb,
   'B', '100 × 1,20 × 0,80 = 96 — o desconto incide sobre o valor já aumentado.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Uma quantidade passa de 50 para 60. Qual foi o aumento percentual?',
   '{"A":"10%","B":"15%","C":"20%","D":"25%"}'::jsonb,
   'C', '(60−50)/50 × 100 = 20%.'),

  -- Constitucional — fixação (Q1-4)
  ((select id from b_const_ex), 1, 'Constitucional',
   'Uma pessoa sofre ameaça ilegal à sua liberdade de locomoção. Qual instrumento constitucional é especialmente adequado?',
   '{"A":"Habeas data","B":"Habeas corpus","C":"Ação popular","D":"Mandado de injunção"}'::jsonb,
   'B', 'Habeas corpus protege a liberdade de locomoção contra ilegalidade ou abuso de poder.'),

  ((select id from b_const_ex), 2, 'Constitucional',
   'Segundo a Constituição, a casa pode ser invadida sem consentimento do morador:',
   '{"A":"Por ordem judicial, a qualquer hora do dia ou da noite","B":"Somente com autorização escrita do proprietário","C":"Em caso de flagrante delito","D":"Nunca, em nenhuma circunstância"}'::jsonb,
   'C', 'Flagrante delito é uma das exceções constitucionais à inviolabilidade domiciliar, podendo ocorrer a qualquer hora.'),

  ((select id from b_const_ex), 3, 'Constitucional',
   'O instrumento voltado a conhecer ou retificar informações pessoais nos registros previstos constitucionalmente é:',
   '{"A":"Habeas corpus","B":"Ação popular","C":"Mandado de injunção","D":"Habeas data"}'::jsonb,
   'D', 'Habeas data trata de informações pessoais em registros.'),

  ((select id from b_const_ex), 4, 'Constitucional',
   'A liberdade de expressão:',
   '{"A":"É absoluta em qualquer situação","B":"Não afasta a proteção de outros direitos fundamentais","C":"Permite manifestação anônima em qualquer circunstância","D":"Elimina toda responsabilidade por danos causados a terceiros"}'::jsonb,
   'B', 'A liberdade de expressão coexiste com a proteção de honra, imagem e intimidade — não é absoluta.'),

  -- Informática — fixação (Q1-4)
  ((select id from b_info_ex), 1, 'Informática',
   'Qual pilar da segurança da informação busca impedir alterações indevidas nos dados?',
   '{"A":"Disponibilidade","B":"Integridade","C":"Confidencialidade","D":"Publicidade"}'::jsonb,
   'B', 'Integridade: a informação permanece correta, protegida contra alterações indevidas.'),

  ((select id from b_info_ex), 2, 'Informática',
   'Um programa que criptografa arquivos e exige pagamento para liberá-los é geralmente classificado como:',
   '{"A":"Ransomware","B":"Adware","C":"Navegador","D":"Firewall"}'::jsonb,
   'A', 'É a definição de ransomware.'),

  ((select id from b_info_ex), 3, 'Informática',
   'Uma mensagem falsa induz o usuário a entrar em uma página bancária fraudulenta. Isso é um exemplo de:',
   '{"A":"Backup","B":"Desfragmentação","C":"Phishing","D":"Atualização legítima"}'::jsonb,
   'C', 'É a definição clássica de phishing.'),

  ((select id from b_info_ex), 4, 'Informática',
   'Qual afirmação sobre backup e sincronização está correta?',
   '{"A":"São sempre a mesma coisa","B":"A sincronização garante que nenhum arquivo será perdido","C":"Backup é desnecessário quando há senha forte","D":"A sincronização não substitui necessariamente uma cópia de segurança recuperável"}'::jsonb,
   'D', 'Sincronização pode propagar exclusões/danos — não substitui necessariamente um backup recuperável.'),

  -- Mini-simulado (Q17-28, 5 alternativas)
  ((select id from b_simulado), 1, 'Português',
   'Na frase "O servidor trabalhou silenciosamente", a palavra "silenciosamente" é:',
   '{"A":"Substantivo","B":"Adjetivo","C":"Advérbio de modo","D":"Verbo","E":"Pronome"}'::jsonb,
   'C', '"Silenciosamente" indica o modo como o servidor trabalhou — advérbio de modo.'),

  ((select id from b_simulado), 2, 'Matemática/RLM',
   'Um produto de R$ 800 recebe desconto de 15%. O preço final será:',
   '{"A":"R$ 680","B":"R$ 700","C":"R$ 720","D":"R$ 740","E":"R$ 650"}'::jsonb,
   'A', '800 × 0,85 = 680.'),

  ((select id from b_simulado), 3, 'Matemática/RLM',
   'Uma mercadoria de R$ 200 sofre aumento de 10%. O novo preço é:',
   '{"A":"R$ 210","B":"R$ 220","C":"R$ 230","D":"R$ 240","E":"R$ 200"}'::jsonb,
   'B', '200 × 1,10 = 220.'),

  ((select id from b_simulado), 4, 'Constitucional',
   'Qual remédio constitucional protege a liberdade de locomoção contra ilegalidade ou abuso de poder?',
   '{"A":"Ação popular","B":"Habeas data","C":"Mandado de segurança","D":"Habeas corpus","E":"Mandado de injunção"}'::jsonb,
   'D', 'Habeas corpus protege a liberdade de ir e vir.'),

  ((select id from b_simulado), 5, 'Constitucional',
   'A entrada forçada em uma casa por determinação judicial, conforme a regra constitucional, pode ocorrer:',
   '{"A":"A qualquer hora","B":"Somente aos domingos","C":"Durante o dia","D":"Apenas com autorização do vizinho","E":"Nunca"}'::jsonb,
   'C', 'O mandado judicial só autoriza a entrada durante o dia.'),

  ((select id from b_simulado), 6, 'Informática',
   'Uma pessoa recebe uma mensagem falsa pedindo sua senha bancária por meio de um link. A tentativa é conhecida como:',
   '{"A":"Backup","B":"Phishing","C":"Formatação","D":"Compactação","E":"Sincronização"}'::jsonb,
   'B', 'É a definição clássica de phishing.'),

  ((select id from b_simulado), 7, 'Informática',
   'Qual dos itens a seguir é um tipo de malware que pode se propagar automaticamente pela rede?',
   '{"A":"Planilha","B":"Firewall","C":"Worm","D":"Backup","E":"Navegador"}'::jsonb,
   'C', 'Worm se propaga automaticamente entre sistemas e redes.'),

  ((select id from b_simulado), 8, 'Matemática/RLM',
   'Um valor passou de R$ 400 para R$ 500. A variação percentual foi de:',
   '{"A":"10%","B":"20%","C":"25%","D":"30%","E":"40%"}'::jsonb,
   'C', '(500−400)/400 × 100 = 25%.'),

  ((select id from b_simulado), 9, 'Português',
   'Na frase "Aquela prova foi difícil", a palavra "aquela" é:',
   '{"A":"Advérbio","B":"Verbo","C":"Substantivo","D":"Pronome demonstrativo","E":"Adjetivo"}'::jsonb,
   'D', '"Aquela" acompanha o substantivo "prova" indicando posição — pronome demonstrativo.'),

  ((select id from b_simulado), 10, 'Informática',
   'Qual alternativa apresenta corretamente os três pilares clássicos da segurança da informação?',
   '{"A":"Cadastro, Internet e Dados","B":"Confidencialidade, Integridade e Disponibilidade","C":"Senha, Vírus e Navegador","D":"Hardware, Software e Usuário","E":"Acesso, Instalação e Exclusão"}'::jsonb,
   'B', 'A tríade CID: confidencialidade, integridade e disponibilidade.'),

  ((select id from b_simulado), 11, 'Matemática/RLM',
   'Um produto custa R$ 100, recebe desconto de 10% e depois outro desconto de 10%. O preço final é:',
   '{"A":"R$ 80","B":"R$ 81","C":"R$ 82","D":"R$ 90","E":"R$ 79"}'::jsonb,
   'B', '100 × 0,90 × 0,90 = 81.'),

  ((select id from b_simulado), 12, 'Informática',
   'Qual prática é mais segura para proteger uma conta importante?',
   '{"A":"Usar a mesma senha em todos os serviços","B":"Compartilhar o código de autenticação com o suporte por mensagem","C":"Desativar todas as atualizações","D":"Usar senha exclusiva e autenticação multifator","E":"Salvar a senha em um computador público"}'::jsonb,
   'D', 'Senha exclusiva e MFA são as práticas recomendadas — as demais são o que se deve evitar.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
