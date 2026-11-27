-- TJSP — Bloco I (Língua Portuguesa) — Módulo 2: estruturação do texto, coesão, coerência e relações entre ideias.
-- Pré-requisito: db/migracao_trilhas.sql já executado. Trilha 'tjsp', week = 101 (Bloco I), day_number = 2 (Módulo 2).
delete from days where track = 'tjsp' and week = 101 and day_number = 2;

with d as (
  insert into days (track, week, day_number, title)
  values ('tjsp', 101, 2, 'Estruturação do texto, coesão, coerência, referenciação, conectivos e reescrita')
  returning id
),
b_t1 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Língua Portuguesa', 'teoria', 'Estruturação do texto, coesão e coerência', 25, $$POR QUE ESTE MÓDULO IMPORTA
A banca não cobra só o significado de uma palavra: cobra como uma frase se relaciona com outra, como um pronome retoma um termo e como a troca de um conectivo pode alterar completamente o sentido de um texto. Objetivo do módulo: identificar como frases e parágrafos se conectam, entender a função dos conectivos, reconhecer retomadas e resolver questões de reescrita e interpretação.

O QUE SIGNIFICA ESTRUTURAR UM TEXTO
Um texto não é um conjunto de frases colocadas uma após a outra: as ideias precisam estar organizadas de forma lógica — introdução de um assunto, apresentação de informações, explicação, exemplificação, comparação, contraste, causa e consequência, conclusão.
Exemplo bem estruturado: "O atendimento digital foi ampliado pelo tribunal. Muitos cidadãos passaram a realizar consultas pela internet. Entretanto, parte da população ainda encontra dificuldades de acesso. Por isso, o atendimento presencial continua sendo necessário." Sequência: apresenta-se uma mudança, um benefício, uma limitação e uma conclusão — o leitor acompanha o raciocínio.
Exemplo mal estruturado: "O atendimento digital foi ampliado pelo tribunal. Os cidadãos realizam consultas. O atendimento presencial é necessário. A internet existe. A população tem dificuldades." As frases não são necessariamente falsas, mas faltam conexões e uma sequência lógica clara.

COESÃO TEXTUAL
Coesão é a ligação entre palavras, frases, orações e parágrafos; estabelece conexões linguísticas e evita que o texto fique fragmentado. Recursos: pronomes, conjunções, preposições, advérbios, sinônimos, repetição de palavras, substituição de expressões, elipse, referenciação e conectivos.
Sem coesão: "Maria foi ao fórum. Maria entregou documentos. Maria aguardou atendimento. Maria recebeu protocolo." Com coesão: "Maria foi ao fórum, entregou os documentos e aguardou atendimento. Posteriormente, recebeu o protocolo."

COESÃO × COERÊNCIA — NÃO CONFUNDA
Coesão: ligação linguística entre partes do texto (pronomes, conectivos, substituições; organização das frases; recursos gramaticais). Coerência: relação lógica e compatibilidade das ideias (sentido global; ausência de contradições; raciocínio e lógica).
Texto coeso, mas incoerente: "João estava com muito frio. Por isso, colocou um casaco e abriu todas as janelas para deixar o vento entrar." O conectivo "por isso" faz a ligação linguística, mas abrir as janelas para o vento entrar não é consequência adequada de sentir frio.
Texto coerente, mas com pouca coesão: "João estava com frio. Colocou casaco. Fechou janela. Melhorou." Dá para entender a sequência, mas poderia ser mais bem conectado.
Com coesão e coerência: "Como estava com frio, João colocou um casaco e fechou a janela. Com isso, sentiu-se mais confortável."$$
  from d returning id
),
b_t2 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 2, 'Língua Portuguesa', 'teoria', 'Referenciação: anáfora, catáfora, pronomes, retomadas e elipse', 25, $$REFERENCIAÇÃO
Referenciar é usar uma palavra ou expressão para indicar, recuperar ou antecipar outro elemento do texto. É um dos recursos mais cobrados. Situações: anáfora (retoma o que já foi mencionado), catáfora (antecipa o que será mencionado) e referenciação externa (aponta elementos da situação comunicativa).

ANÁFORA
A palavra ou expressão retoma uma informação anteriormente apresentada. "O servidor entregou o relatório ao juiz. Ele analisou o documento." (o pronome "ele" pode retomar "o juiz", conforme o contexto). "A empresa apresentou uma nova plataforma digital. A ferramenta permitirá consultas mais rápidas." ("a ferramenta" retoma "uma nova plataforma digital"). "A decisão foi publicada ontem. Isso gerou diversas manifestações." ("isso" retoma o fato anteriormente descrito). "O sistema ficou indisponível durante toda a manhã. Esse problema prejudicou o atendimento." ("esse problema" retoma a indisponibilidade).

TIPOS DE RETOMADA ANAFÓRICA
Pronome: "Carla recebeu o documento. Ela o encaminhou ao setor responsável." (ela = Carla; o = documento). Sinônimo: "O magistrado apresentou a decisão. O juiz explicou os fundamentos." Expressão equivalente: "O Brasil anunciou novas medidas econômicas. O país pretende ampliar os investimentos." Expressão resumitiva: "Os funcionários participaram da reunião, apresentaram propostas e discutiram os problemas do setor. Essas iniciativas contribuíram para a elaboração de um plano." Pronome demonstrativo: "A empresa mudou seus procedimentos. Essa mudança exigiu treinamento."

CATÁFORA
A palavra antecipa algo que ainda será apresentado. "Isto é fundamental: todos os documentos devem ser conferidos antes do protocolo." ("isto" antecipa a informação após os dois-pontos). "O servidor apresentou dois motivos para justificar sua decisão: a falta de documentos e o descumprimento do prazo." ("dois motivos" antecipa a explicação). "Ela foi responsável pela elaboração do relatório: Mariana." ("ela" antecipa "Mariana").
Macete: anáfora olha para trás (termo utilizado → informação anterior); catáfora olha para a frente (termo utilizado → informação posterior). Ex. anáfora: "O tribunal publicou uma decisão. Ela foi divulgada ontem." Ex. catáfora: "Isto foi determinado: os documentos deverão ser entregues amanhã."

PRONOMES PESSOAIS QUE RETOMAM
Ele/ela: "O servidor chegou. Ele iniciou o atendimento." Eles/elas: "As funcionárias chegaram. Elas foram encaminhadas." O/a: "O documento foi entregue. O servidor o recebeu." Os/as: "Os relatórios foram enviados. O setor os analisou." Lhe/lhes: "O servidor entregou-lhe o documento."
Atenção à ambiguidade referencial: "Pedro conversou com Carlos depois que ele saiu do tribunal." Quem saiu — Pedro ou Carlos? O pronome não deixa claro o referente. Reescritas mais claras: "Pedro conversou com Carlos depois que Carlos saiu do tribunal." ou "Após sair do tribunal, Pedro conversou com Carlos." A banca pode perguntar se uma reescrita elimina a ambiguidade.

PRONOMES DEMONSTRATIVOS
Este, esta, isto: apontam algo próximo, apresentam uma informação ou antecipam conteúdo — "Isto precisa ser observado: o prazo termina amanhã." (antecipação). Esse, essa, isso: frequentemente retomam o que foi mencionado — "O prazo termina amanhã. Isso exige atenção." (retomada). Exemplo de prova: "A administração decidiu ampliar o atendimento. Essa medida beneficiará os usuários." ("essa medida" retoma a decisão de ampliar o atendimento).

ELIPSE
Omissão de uma palavra ou expressão que pode ser identificada pelo contexto. "Ana estudou Direito; Pedro, Administração." (o verbo "estudou" foi omitido na segunda oração; forma completa: "Pedro estudou Administração"). "Na sala, havia servidores; no corredor, usuários." (omitido "havia"). "João chegou às 8h; Maria, às 9h." (omitido "chegou").
Efeitos: evita repetição, deixa o texto mais conciso, preserva a compreensão e contribui para a coesão. Pegadinha: elipse não significa que o texto esteja incompleto ou incorreto — é um recurso linguístico adequado.$$
  from d returning id
),
b_t3 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Língua Portuguesa', 'teoria', 'Substituição de termos, hiperônimos e hipônimos', 15, $$SUBSTITUIÇÃO DE PALAVRAS
Um texto pode substituir termos por outras expressões para evitar repetições. "O tribunal publicou uma nova decisão. O órgão também divulgou orientações sobre o procedimento." ("o órgão" substitui "o tribunal"). "O servidor elaborou o documento. O relatório foi encaminhado à chefia." (dependendo do contexto, "o relatório" substitui ou especifica o documento).
Tipos de substituição: pronome, sinônimo, hiperônimo, expressão equivalente, nome genérico e expressão resumitiva.

HIPERÔNIMO E HIPÔNIMO
Hiperônimo: palavra de significado mais abrangente (animal, veículo, documento, fruta). Hipônimo: palavra de significado mais específico (cachorro, automóvel, relatório, maçã). Ex.: cachorro → animal; automóvel → veículo; relatório → documento; maçã → fruta.
No texto: "O servidor recebeu um relatório. O documento foi arquivado." — "documento" é mais abrangente que "relatório"; a substituição é adequada porque todo relatório é um documento, embora nem todo documento seja um relatório.
Cuidado com substituições inadequadas: "O servidor recebeu um relatório. O objeto foi arquivado." — "objeto" pode ser genérico demais e prejudicar a precisão.$$
  from d returning id
),
b_t4 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 4, 'Língua Portuguesa', 'teoria', 'Conectivos e relações entre ideias (13 relações) e quadro de memorização', 30, $$O QUE SÃO CONECTIVOS
Palavras ou expressões que estabelecem relações entre ideias: adição, oposição, conclusão, explicação, causa, consequência, condição, concessão, finalidade, comparação, alternância, proporção e tempo. Em concursos, é fundamental entender o sentido do conectivo dentro do contexto, e não apenas decorar uma lista.

ADIÇÃO
Acréscimo de informações: e, também, além disso, ademais, ainda, não só... mas também, bem como. "O sistema agilizou o atendimento e reduziu custos." "O tribunal modernizou os equipamentos. Além disso, capacitou os servidores." "O programa beneficia não só os usuários, mas também os funcionários." Questão típica: "além disso" pode ser substituído por "ademais", "também", "ainda", "igualmente", desde que a relação de adição seja preservada.

OPOSIÇÃO (ADVERSIDADE)
Contraste entre ideias: mas, porém, contudo, entretanto, todavia, no entanto. "O procedimento é simples, mas exige atenção." (a primeira ideia apresenta simplicidade; a segunda, uma ressalva). "O sistema é eficiente. Entretanto, ainda apresenta falhas." Em muitos contextos, entretanto = contudo = todavia = porém = no entanto, mas a substituição precisa respeitar a estrutura e a pontuação da frase.

CONCESSÃO
Apresenta uma ideia que poderia dificultar ou contrariar a outra, mas que não a impede: embora, ainda que, mesmo que, apesar de, conquanto, não obstante. "Embora o sistema seja complexo, os servidores conseguem utilizá-lo." "Apesar de apresentar dificuldades, o procedimento foi concluído."
Adversidade × concessão. Adversidade: "O sistema é eficiente, mas apresenta falhas." — duas ideias contrastantes. Concessão: "Embora o sistema apresente falhas, é eficiente." — uma ideia é admitida, mas a ideia principal permanece. A banca pode explorar a alteração de estrutura.

CAUSA
Motivo de um acontecimento: porque, já que, visto que, uma vez que, como, pois. "O atendimento foi suspenso porque o sistema estava indisponível." (causa: sistema indisponível; consequência: suspensão). "Como o documento estava incompleto, o pedido não foi processado." (a oração com "como" apresenta a causa). "O processo foi encaminhado, visto que os documentos estavam corretos."

CONSEQUÊNCIA
Resultado de uma situação: portanto, consequentemente, por isso, de modo que, de forma que, assim, tanto... que. "O sistema apresentou falhas, por isso o atendimento foi interrompido." "A demanda aumentou tanto que foi necessário ampliar a equipe." Causa × consequência: "A falta de energia provocou a suspensão do atendimento." (causa: falta de energia; consequência: suspensão).

CONCLUSÃO
Conclusão decorrente das informações anteriores: portanto, logo, assim, dessa forma, desse modo, por conseguinte. "Os documentos estão incompletos. Portanto, o pedido deverá ser corrigido." "As medidas foram implementadas e os resultados melhoraram. Assim, conclui-se que o programa apresentou benefícios." Atenção: "portanto" geralmente introduz conclusão — não significa causa.

EXPLICAÇÃO
Justificativa ou esclarecimento: porque, pois, que, porquanto. "Não saia agora, porque está chovendo." (a segunda oração explica a orientação). "O procedimento deve ser revisado, pois contém inconsistências."

CONDIÇÃO
Condição necessária ou hipótese: se, caso, desde que, contanto que, a menos que, salvo se. "Se os documentos estiverem completos, o pedido será encaminhado." "O procedimento será autorizado desde que sejam atendidos os requisitos." Pegadinha: "Se o servidor apresentar o documento, o pedido será analisado" não significa que o pedido será necessariamente aprovado — a condição garante análise, não aprovação.

FINALIDADE
Objetivo ou propósito: para, para que, a fim de, com o objetivo de, com a finalidade de. "O tribunal ampliou o atendimento para facilitar o acesso da população." "Os servidores receberam treinamento a fim de melhorar a qualidade do atendimento."

COMPARAÇÃO
Semelhança ou diferença: como, assim como, tal qual, mais... que, menos... que, tanto quanto. "O sistema atual é mais rápido que o anterior." "Assim como os servidores, os usuários precisam receber orientações."

ALTERNÂNCIA
Escolha ou alternância: ou, ou... ou, ora... ora, quer... quer. "O atendimento poderá ocorrer presencialmente ou pela internet." "Ou o usuário apresenta os documentos, ou deverá complementar a solicitação."

PROPORÇÃO
Acontecimentos que variam simultaneamente: à medida que, à proporção que, quanto mais... mais, quanto menos... menos. "À medida que o sistema foi aprimorado, o número de erros diminuiu." "Quanto mais os servidores treinavam, mais segurança demonstravam."

TEMPO
Quando os fatos acontecem: quando, enquanto, assim que, depois que, antes que, logo que, desde que. "Quando o documento foi recebido, o servidor iniciou a análise." "O sistema permaneceu disponível enquanto a manutenção não foi iniciada." Observação: "desde que" pode indicar tempo ("desde que cheguei") ou condição ("desde que cumpra os requisitos"), conforme o contexto.

QUADRO PARA MEMORIZAÇÃO
Adição: e, também, além disso, ademais. Oposição: mas, porém, contudo, entretanto. Concessão: embora, ainda que, mesmo que. Causa: porque, visto que, já que. Consequência: por isso, de modo que, tanto que. Conclusão: portanto, logo, assim. Explicação: pois, porque, porquanto. Condição: se, caso, desde que. Finalidade: para, a fim de que. Comparação: como, tal qual, assim como. Alternância: ou, ora... ora. Proporção: à medida que, quanto mais. Tempo: quando, enquanto, depois que.$$
  from d returning id
),
b_t5 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Língua Portuguesa', 'teoria', 'Troca de conectivos, reescrita e preservação do sentido', 25, $$TROCA DE CONECTIVOS SEM ALTERAR O SENTIDO
Exemplo 1 — causa: "O atendimento foi suspenso porque o sistema apresentou falhas." → "O atendimento foi suspenso, visto que o sistema apresentou falhas." Exemplo 2 — consequência: "O sistema apresentou falhas, portanto o atendimento foi suspenso." → "O sistema apresentou falhas, por isso o atendimento foi suspenso." Exemplo 3 — concessão: "Embora o procedimento seja complexo, ele pode ser realizado." → "Ainda que o procedimento seja complexo, ele pode ser realizado."

TROCAS QUE ALTERAM O SENTIDO
"O sistema apresentou falhas, portanto o atendimento foi suspenso." (consequência) × "O sistema apresentou falhas, embora o atendimento tenha sido suspenso." (concessão — outra lógica). Pegadinha: "O servidor não compareceu porque estava doente." × "O servidor não compareceu, embora estivesse doente." — na original, a doença é a causa da ausência; na reescrita, a doença aparece como circunstância que não impediria o comparecimento (concessão). O sentido não foi preservado.

O QUE A BANCA QUER SABER NA REESCRITA
Verifique: 1) se a informação continua igual; 2) se a relação lógica continua igual; 3) se os sujeitos permanecem os mesmos; 4) se houve alteração de causa ou consequência; 5) de intensidade; 6) de tempo; 7) de condição; 8) de certeza; 9) mudança de negação; 10) se a nova frase continua gramaticalmente correta.
Exemplo: "Todos os candidatos que entregaram os documentos foram convocados." × "Todos os candidatos foram convocados, inclusive aqueles que não entregaram os documentos." — a original restringe a convocação a quem entregou; a reescrita amplia.

ALTERAÇÃO DE INTENSIDADE
"A medida pode reduzir os custos." × "A medida reduzirá os custos." — a primeira apresenta possibilidade; a segunda, certeza ou previsão afirmativa. Possibilidade: pode, talvez, possivelmente, é provável, tende a. Certeza ou afirmação: certamente, com certeza, sempre, garantirá, necessariamente. Essas trocas podem tornar uma alternativa incorreta.

ALTERAÇÃO DE NEGAÇÃO
"Nem todos os servidores participaram da reunião." (alguns participaram, outros não — não é verdade que todos participaram) × "Nenhum servidor participou da reunião." (zero participantes) — significado completamente diferente. Nem todos = não é verdade que todos; nenhum = zero participantes; todos = totalidade. Muito explorado em lógica e interpretação.

ALTERAÇÃO DE QUANTIDADE
"Muitos usuários solicitaram atendimento." × "Todos os usuários solicitaram atendimento." — o sentido mudou. Quantificadores: todos (totalidade); nenhum (ausência total); alguns (parte); muitos (grande quantidade, não necessariamente total); poucos (pequena quantidade); a maioria (mais da metade); nem todos (não totalidade).$$
  from d returning id
),
b_t6 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 6, 'Língua Portuguesa', 'teoria', 'Progressão textual, ambiguidade, coerência e pontuação', 25, $$PROGRESSÃO TEXTUAL
É o desenvolvimento gradual das informações ao longo do texto. Um texto bem construído não repete a mesma ideia sem acrescentar nada: apresenta informações novas e desenvolve o assunto.
Exemplo: introdução — "A tecnologia tem transformado os serviços públicos." Desenvolvimento — "Sistemas eletrônicos permitem que diversos procedimentos sejam realizados pela internet." Exemplo — "O cidadão pode consultar processos e acompanhar solicitações sem precisar se deslocar." Conclusão — "Dessa forma, a digitalização contribui para ampliar a eficiência administrativa."

REPETIÇÃO DESNECESSÁRIA
Exemplo ruim: "O atendimento foi melhorado. A melhoria do atendimento trouxe benefícios. O atendimento melhor trouxe resultados positivos." Melhor: "A melhoria do atendimento trouxe benefícios aos usuários, como redução do tempo de espera e maior facilidade para realizar solicitações."
Atenção: a repetição nem sempre é erro. Pode servir para enfatizar, esclarecer, manter o assunto, evitar ambiguidade e, em textos técnicos e jurídicos, garantir precisão. Não existe regra absoluta de que repetir palavras seja sempre inadequado.

AMBIGUIDADE
Ocorre quando uma expressão ou frase permite mais de uma interpretação. Causas: pronome sem referente claro, ordem inadequada das palavras, pontuação, palavras com mais de um significado, estrutura sintática.
Por pronome: "João informou Pedro que ele seria transferido." — quem seria transferido? Reescritas: "João informou a Pedro que Pedro seria transferido." ou "...que João seria transferido."
Por posição: "O servidor encontrou o advogado com o documento." — quem estava com o documento? Reescritas: "Com o documento em mãos, o servidor encontrou o advogado." ou "O servidor encontrou o advogado que estava com o documento."
Lexical: "O banco estava fechado." (instituição financeira ou banco para sentar); "A manga estava madura." (fruta) × "A manga da camisa estava rasgada." (parte da roupa). O contexto normalmente resolve. Em provas: sentido contextual, interpretação da palavra, ocorrência de ambiguidade, possibilidade de mais de uma leitura.

COERÊNCIA TEXTUAL
Organização lógica das ideias, de modo que o texto tenha sentido. Evita contradições, informações incompatíveis, conclusões sem fundamento, mudanças injustificadas de assunto, argumentos desconectados e incompatibilidade entre causa e consequência.
Incoerente: "O servidor não compareceu ao trabalho. Por isso, esteve presente em todas as reuniões daquele dia." Coerente: "O servidor não compareceu ao trabalho. Por isso, não participou das reuniões presenciais daquele dia."
Coerência lógica: "O documento estava incompleto. Por isso, foi devolvido para correção." (coerente) × "O documento estava incompleto. Por isso, foi aprovado sem ressalvas." (relação logicamente inesperada, sem explicação).
Coerência temática: sem — "O sistema judicial foi modernizado. Os servidores receberam treinamento. A população utiliza transporte público. Os computadores possuem memória." Com — "O sistema judicial foi modernizado. Para utilizar as novas ferramentas, os servidores receberam treinamento. A capacitação contribuiu para melhorar o atendimento aos usuários."

PONTUAÇÃO E COESÃO
"O sistema apresentou falhas, porém o atendimento continuou." (a vírgula separa as orações conectadas por "porém"). "O sistema apresentou falhas. Entretanto, o atendimento continuou." ("entretanto" no início da segunda oração, com vírgula). "O sistema apresentou falhas; entretanto, o atendimento continuou." (o ponto e vírgula separa orações mais extensas, mantendo a relação entre elas).
A vírgula pode alterar o sentido: "Os servidores que participaram do treinamento receberam certificados." (restringe o grupo) × "Os servidores, que participaram do treinamento, receberam certificados." (explicativa: os servidores mencionados participaram do treinamento). A pontuação será aprofundada no módulo específico.$$
  from d returning id
),
b_t7 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Língua Portuguesa', 'teoria', 'Pegadinhas, mapa mental e como estudar o módulo', 10, $$PEGADINHAS QUE VOCÊ PRECISA MEMORIZAR
1) "Mas" não é conclusão: indica oposição ou contraste. 2) "Portanto" não é causa: indica conclusão. 3) "Embora" não é causa: indica concessão. 4) "Para que" não é consequência: indica finalidade. 5) "Além disso" não é oposição: indica adição. 6) "Porque" normalmente apresenta causa ou explicação. 7) "Se" normalmente apresenta condição. 8) Anáfora retoma informação anterior. 9) Catáfora antecipa informação posterior. 10) Elipse omite um termo que pode ser recuperado pelo contexto. 11) Coesão é ligação linguística; coerência é lógica e sentido. 12) Uma frase pode ser gramaticalmente correta e, mesmo assim, incoerente.

MAPA MENTAL PARA REVISÃO
Coesão: pronomes, conectivos, substituição, sinônimos, referenciação, elipse, repetição. Referenciação: anáfora (retoma), catáfora (antecipa), pronome (substitui), expressão resumitiva (sintetiza), elipse (omite). Relações entre ideias: adição, oposição, concessão, causa, consequência, conclusão, explicação, condição, finalidade, comparação, proporção, tempo. Coerência: lógica, ausência de contradição, progressão textual, unidade temática, compatibilidade das ideias.

COMO ESTUDAR ESTE MÓDULO (3 SESSÕES DE 1 HORA)
Sessão 1: estruturação, coesão, coerência, anáfora, catáfora, elipse e referenciação; faça as questões 1 a 5. Sessão 2: conectivos e relações de sentido (causa, consequência, conclusão, concessão, oposição, condição, finalidade); faça as questões 6 a 15. Sessão 3: reescrita, ambiguidade, progressão textual, preservação de sentido e coerência; faça as questões 16 a 30 e corrija.$$
  from d returning id
),
b_x1 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 8, 'Língua Portuguesa', 'exercicios', 'Questões 1 a 5 — Coesão e referenciação', 8,
    $$Cada questão traz o seu texto no enunciado.$$
  from d returning id
),
b_x2 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Língua Portuguesa', 'exercicios', 'Questões 6 a 10 — Conectivos', 8,
    $$Identifique a relação de sentido que o conectivo estabelece.$$
  from d returning id
),
b_x3 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Língua Portuguesa', 'exercicios', 'Questões 11 a 15 — Coerência, ambiguidade e reescrita', 8,
    $$Atenção à preservação do sentido e à relação lógica.$$
  from d returning id
),
b_x4 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 11, 'Língua Portuguesa', 'exercicios', 'Questões 16 a 20 — Nível mais avançado', 8,
    $$Retomadas, consequência, substituição e coerência em nível de prova.$$
  from d returning id
),
b_x5 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 12, 'Língua Portuguesa', 'exercicios', 'Simulado final do módulo — Questões 21 a 30', 15,
    $$Dez questões misturando os conceitos do módulo, sem consulta.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 13, 'Língua Portuguesa', 'revisao', 'Meta de desempenho, caderno de erros e checklist do Módulo 2', 8, $$META DE DESEMPENHO (30 QUESTÕES)
27 a 30 acertos: excelente domínio. 24 a 26: bom domínio; revise os erros. 20 a 23: precisa reforçar conectivos e referenciação. Abaixo de 20: releia a teoria e refaça as questões em 2 ou 3 dias. Os erros entram automaticamente no caderno de erros do app, com revisão em 24h, 7 e 30 dias.

CHECKLIST DE CONCLUSÃO
Entendo o que é coesão e o que é coerência e sei diferenciá-las. Identifico anáfora e catáfora. Compreendo a elipse. Identifico pronomes que retomam termos e reconheço substituição por sinônimos, hiperônimos e hipônimos. Identifico adição, oposição, concessão, causa, consequência, conclusão, condição, finalidade, comparação e proporção. Consigo identificar ambiguidade, avaliar coerência e resolver questões de reescrita.

PRÓXIMO CONTEÚDO
Módulo 3 — significação contextual das palavras, sinônimos, antônimos, sentido próprio e figurado: polissemia, denotação, conotação, sinonímia contextual, antonímia, expressões idiomáticas e interpretação de vocabulário em textos.
Marque este bloco como concluído para fechar o Módulo 2.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_x1), 1, 'Língua Portuguesa',
   'Leia: “O tribunal implantou um novo sistema eletrônico. A ferramenta permitirá maior rapidez na consulta de processos.” A expressão “A ferramenta” retoma:',
   '{"A":"A consulta.","B":"O processo.","C":"O tribunal.","D":"O novo sistema eletrônico.","E":"A rapidez."}'::jsonb,
   'D', '"A ferramenta" retoma "o novo sistema eletrônico": substituição nominal que evita repetir a expressão.'),
  ((select id from b_x1), 2, 'Língua Portuguesa',
   'Leia: “Os servidores participaram da capacitação. Eles aprenderam a utilizar o novo programa.” O pronome “Eles” refere-se:',
   '{"A":"Aos usuários.","B":"Aos servidores.","C":"Aos programas.","D":"Aos tribunais.","E":"Aos documentos."}'::jsonb,
   'B', '"Eles" retoma "os servidores"; o pronome está no masculino plural, concordando com o termo retomado.'),
  ((select id from b_x1), 3, 'Língua Portuguesa',
   'Assinale a alternativa que apresenta catáfora.',
   '{"A":"O documento foi recebido. Ele será analisado.","B":"A decisão foi publicada. Essa medida gerou repercussão.","C":"Isso foi determinado: os documentos deverão ser entregues amanhã.","D":"O servidor apresentou o relatório. O documento foi arquivado.","E":"A empresa realizou a mudança. Ela foi necessária."}'::jsonb,
   'C', '"Isso" antecipa a informação que aparece depois dos dois-pontos: é catáfora. As demais retomam algo já dito (anáfora).'),
  ((select id from b_x1), 4, 'Língua Portuguesa',
   'Leia: “O atendimento foi ampliado. Essa iniciativa beneficiou os usuários.” A expressão “Essa iniciativa” retoma:',
   '{"A":"Os usuários.","B":"O atendimento ampliado.","C":"O benefício.","D":"A instituição.","E":"O funcionário."}'::jsonb,
   'B', '"Essa iniciativa" retoma a ampliação do atendimento.'),
  ((select id from b_x1), 5, 'Língua Portuguesa',
   'Assinale a alternativa em que ocorre elipse.',
   '{"A":"Maria chegou cedo. Ela iniciou o trabalho.","B":"João estudou Direito; Pedro, Administração.","C":"O servidor entregou o documento.","D":"O tribunal publicou a decisão.","E":"O relatório foi encaminhado."}'::jsonb,
   'B', 'Em "João estudou Direito; Pedro, Administração", o verbo "estudou" foi omitido na segunda oração.'),

  ((select id from b_x2), 6, 'Língua Portuguesa',
   'Assinale a alternativa em que “portanto” apresenta sentido de conclusão.',
   '{"A":"O sistema falhou porque houve falta de energia.","B":"O sistema falhou, mas o atendimento continuou.","C":"O sistema falhou; portanto, o atendimento foi interrompido.","D":"Embora o sistema falhasse, o atendimento continuou.","E":"O sistema falhou quando o atendimento começou."}'::jsonb,
   'C', '"Portanto" indica conclusão: as falhas no sistema levaram à interrupção do atendimento.'),
  ((select id from b_x2), 7, 'Língua Portuguesa',
   'Em “Embora o procedimento seja complexo, sua realização é possível.”, o conectivo “Embora” expressa:',
   '{"A":"Causa.","B":"Consequência.","C":"Adição.","D":"Concessão.","E":"Finalidade."}'::jsonb,
   'D', '"Embora" é conectivo concessivo.'),
  ((select id from b_x2), 8, 'Língua Portuguesa',
   'Assinale a alternativa que apresenta relação de finalidade.',
   '{"A":"O servidor foi treinado porque precisava utilizar o sistema.","B":"O servidor foi treinado, portanto utilizou o sistema.","C":"O servidor foi treinado, embora utilizasse o sistema.","D":"O servidor foi treinado para utilizar o sistema.","E":"O servidor foi treinado, mas utilizou o sistema."}'::jsonb,
   'D', '"Para utilizar" apresenta a finalidade do treinamento.'),
  ((select id from b_x2), 9, 'Língua Portuguesa',
   'A expressão “Além disso” pode ser substituída, sem alteração da relação de sentido, por:',
   '{"A":"Entretanto.","B":"Portanto.","C":"Ademais.","D":"Embora.","E":"Por conseguinte."}'::jsonb,
   'C', '"Ademais" tem sentido de adição, assim como "além disso".'),
  ((select id from b_x2), 10, 'Língua Portuguesa',
   'Leia: “O sistema foi implantado, mas ainda apresenta dificuldades de utilização.” O conectivo “mas” pode ser substituído, mantendo a relação de oposição, por:',
   '{"A":"Portanto.","B":"Contudo.","C":"Porque.","D":"Assim.","E":"Logo."}'::jsonb,
   'B', '"Contudo" estabelece oposição, assim como "mas".'),

  ((select id from b_x3), 11, 'Língua Portuguesa',
   'Assinale a frase que apresenta ambiguidade.',
   '{"A":"O servidor encaminhou o documento ao setor responsável.","B":"O juiz analisou cuidadosamente os autos.","C":"Pedro informou Carlos de que ele deveria comparecer.","D":"A decisão foi publicada no Diário da Justiça.","E":"O atendimento começou às 13 horas."}'::jsonb,
   'C', 'Não é possível saber com segurança quem deveria comparecer: Pedro ou Carlos.'),
  ((select id from b_x3), 12, 'Língua Portuguesa',
   'Assinale a alternativa que apresenta uma relação lógica de causa e consequência.',
   '{"A":"O sistema apresentou falhas, embora o atendimento tenha continuado.","B":"O sistema apresentou falhas, por isso o atendimento foi interrompido.","C":"O sistema apresentou falhas, mas o atendimento foi interrompido.","D":"O sistema apresentou falhas, enquanto o atendimento foi interrompido.","E":"O sistema apresentou falhas, a fim de que o atendimento fosse interrompido."}'::jsonb,
   'B', 'Causa: falhas do sistema. Consequência: interrupção do atendimento ("por isso").'),
  ((select id from b_x3), 13, 'Língua Portuguesa',
   'Assinale a alternativa que mantém o sentido da frase: “Embora estivesse cansado, o servidor concluiu o trabalho.”',
   '{"A":"Como estava cansado, o servidor concluiu o trabalho.","B":"O servidor concluiu o trabalho porque estava cansado.","C":"Apesar de estar cansado, o servidor concluiu o trabalho.","D":"O servidor concluiu o trabalho, portanto estava cansado.","E":"O servidor concluiu o trabalho, desde que estivesse cansado."}'::jsonb,
   'C', '"Apesar de estar cansado" preserva a concessão de "Embora estivesse cansado". As demais transformam a ideia em causa, conclusão ou condição.'),
  ((select id from b_x3), 14, 'Língua Portuguesa',
   'Leia: “A administração ampliou o número de atendimentos. Além disso, reduziu o tempo de espera.” A expressão “Além disso” indica:',
   '{"A":"Contradição.","B":"Causa.","C":"Consequência.","D":"Adição.","E":"Concessão."}'::jsonb,
   'D', '"Além disso" acrescenta uma nova informação.'),
  ((select id from b_x3), 15, 'Língua Portuguesa',
   'Assinale a alternativa em que a substituição preserva o sentido de “O procedimento foi realizado porque os documentos estavam completos.”',
   '{"A":"O procedimento foi realizado, embora os documentos estivessem completos.","B":"O procedimento foi realizado, visto que os documentos estavam completos.","C":"O procedimento foi realizado, apesar de os documentos estarem completos.","D":"O procedimento foi realizado, mas os documentos estavam completos.","E":"O procedimento foi realizado, a fim de que os documentos estivessem completos."}'::jsonb,
   'B', '"Visto que" apresenta causa ou justificativa, mantendo a relação expressa por "porque".'),

  ((select id from b_x4), 16, 'Língua Portuguesa',
   'Leia: “O sistema eletrônico reduziu o tempo necessário para a realização de diversos procedimentos. Essa melhoria, contudo, não eliminou a necessidade de capacitação dos servidores.” A expressão “Essa melhoria” retoma:',
   '{"A":"A capacitação dos servidores.","B":"A necessidade de procedimentos.","C":"A redução do tempo de realização dos procedimentos.","D":"A eliminação do atendimento.","E":"A utilização de documentos físicos."}'::jsonb,
   'C', '"Essa melhoria" retoma a redução do tempo necessário para a realização dos procedimentos.'),
  ((select id from b_x4), 17, 'Língua Portuguesa',
   'Assinale a alternativa em que o conectivo estabelece corretamente uma relação de consequência.',
   '{"A":"O atendimento foi suspenso, embora o sistema estivesse indisponível.","B":"O atendimento foi suspenso, porque o sistema estava indisponível.","C":"O sistema estava indisponível, portanto o atendimento foi suspenso.","D":"O sistema estava indisponível, contudo o atendimento foi suspenso.","E":"O sistema estava indisponível, a fim de que o atendimento fosse suspenso."}'::jsonb,
   'C', '"Portanto" estabelece consequência ou conclusão: a indisponibilidade levou à suspensão. Em B, "porque" indica causa.'),
  ((select id from b_x4), 18, 'Língua Portuguesa',
   'Leia: “Os documentos estavam incompletos. O pedido, portanto, não poderia ser processado.” A palavra “portanto” poderia ser substituída, sem alteração essencial do sentido, por:',
   '{"A":"Entretanto.","B":"Embora.","C":"Todavia.","D":"Consequentemente.","E":"Apesar disso."}'::jsonb,
   'D', '"Consequentemente" mantém o sentido de conclusão decorrente da informação anterior.'),
  ((select id from b_x4), 19, 'Língua Portuguesa',
   'Assinale a alternativa que apresenta uma construção coerente.',
   '{"A":"O servidor não compareceu, por isso participou presencialmente de todas as reuniões.","B":"O documento estava incompleto, portanto foi aprovado sem necessidade de correção.","C":"O sistema estava indisponível, de modo que o atendimento eletrônico foi prejudicado.","D":"A equipe recebeu treinamento, embora o treinamento tenha sido realizado antes de sua contratação, sem qualquer outra explicação.","E":"A instituição ampliou o atendimento para reduzir o acesso dos usuários."}'::jsonb,
   'C', 'A indisponibilidade do sistema prejudica o atendimento eletrônico: há relação lógica entre os fatos. As demais contêm contradições ou incompatibilidades.'),
  ((select id from b_x4), 20, 'Língua Portuguesa',
   'Leia: “A medida foi considerada positiva por parte dos usuários. Entretanto, alguns cidadãos apontaram dificuldades na utilização do sistema.” A relação estabelecida por “Entretanto” é de:',
   '{"A":"Conclusão.","B":"Causa.","C":"Explicação.","D":"Adição.","E":"Contraste."}'::jsonb,
   'E', '"Entretanto" apresenta contraste entre a avaliação positiva e as dificuldades apontadas.'),

  ((select id from b_x5), 21, 'Língua Portuguesa',
   'Leia: “A ampliação dos serviços digitais representa uma importante iniciativa para facilitar o acesso da população aos serviços públicos. Essa medida, entretanto, deve ser acompanhada de ações que garantam a inclusão daqueles que enfrentam dificuldades tecnológicas.” A expressão “Essa medida” retoma:',
   '{"A":"As dificuldades tecnológicas.","B":"As ações de inclusão.","C":"A ampliação dos serviços digitais.","D":"A população.","E":"Os serviços públicos."}'::jsonb,
   'C', '"Essa medida" retoma a ampliação dos serviços digitais.'),
  ((select id from b_x5), 22, 'Língua Portuguesa',
   'Leia: “O servidor analisou o processo e encaminhou o documento à chefia. Posteriormente, recebeu a resposta.” O sujeito oculto de “recebeu” é:',
   '{"A":"O processo.","B":"O documento.","C":"A chefia.","D":"O servidor.","E":"A resposta."}'::jsonb,
   'D', 'A sequência é: o servidor analisou, o servidor encaminhou, o servidor recebeu.'),
  ((select id from b_x5), 23, 'Língua Portuguesa',
   'Assinale a alternativa que apresenta uma relação de concessão.',
   '{"A":"O sistema foi atualizado porque apresentava falhas.","B":"O sistema foi atualizado, portanto as falhas diminuíram.","C":"Embora apresentasse falhas, o sistema continuou sendo utilizado.","D":"O sistema foi atualizado para reduzir falhas.","E":"O sistema foi atualizado quando as falhas foram identificadas."}'::jsonb,
   'C', '"Embora apresentasse falhas" é oração concessiva.'),
  ((select id from b_x5), 24, 'Língua Portuguesa',
   'Leia: “A capacitação dos servidores contribuiu para a melhoria do atendimento. Além de ampliar o conhecimento técnico, favoreceu a utilização mais eficiente dos sistemas.” A expressão “Além de” indica:',
   '{"A":"Oposição.","B":"Adição.","C":"Consequência.","D":"Condição.","E":"Conclusão."}'::jsonb,
   'B', '"Além de" acrescenta informação.'),
  ((select id from b_x5), 25, 'Língua Portuguesa',
   'Assinale a alternativa que mantém o sentido da frase: “Caso os documentos sejam apresentados, o requerimento será analisado.”',
   '{"A":"Embora os documentos sejam apresentados, o requerimento será analisado.","B":"Porque os documentos sejam apresentados, o requerimento será analisado.","C":"Se os documentos forem apresentados, o requerimento será analisado.","D":"Os documentos serão apresentados, portanto o requerimento será analisado.","E":"Os documentos serão apresentados, mas o requerimento será analisado."}'::jsonb,
   'C', '"Se" mantém o sentido de condição de "caso".'),
  ((select id from b_x5), 26, 'Língua Portuguesa',
   'Leia: “O tribunal adotou novas ferramentas tecnológicas. Elas permitiram reduzir o tempo de tramitação de diversos procedimentos.” O pronome “Elas” retoma:',
   '{"A":"As ferramentas tecnológicas.","B":"As tramitações.","C":"Os tribunais.","D":"Os procedimentos.","E":"As decisões."}'::jsonb,
   'A', '"Elas" retoma "novas ferramentas tecnológicas".'),
  ((select id from b_x5), 27, 'Língua Portuguesa',
   'Assinale a alternativa em que a expressão destacada apresenta sentido de finalidade.',
   '{"A":"O sistema foi atualizado porque apresentava falhas.","B":"O sistema foi atualizado, portanto as falhas diminuíram.","C":"O sistema foi atualizado, embora apresentasse falhas.","D":"O sistema foi atualizado para reduzir as falhas.","E":"O sistema foi atualizado, mas as falhas continuaram."}'::jsonb,
   'D', '"Para reduzir" indica finalidade.'),
  ((select id from b_x5), 28, 'Língua Portuguesa',
   'Leia: “O atendimento foi ampliado. Os usuários passaram a ter mais opções de acesso. A mudança também reduziu a necessidade de deslocamentos.” A expressão “A mudança” retoma:',
   '{"A":"Os usuários.","B":"A necessidade de deslocamentos.","C":"A ampliação do atendimento.","D":"As opções de acesso.","E":"O deslocamento."}'::jsonb,
   'C', '"A mudança" retoma a ampliação do atendimento.'),
  ((select id from b_x5), 29, 'Língua Portuguesa',
   'Assinale a alternativa em que ocorre ambiguidade.',
   '{"A":"O funcionário arquivou o documento recebido.","B":"O servidor informou ao diretor que ele deveria revisar o relatório.","C":"O relatório foi encaminhado ontem.","D":"A decisão foi publicada oficialmente.","E":"Os documentos foram conferidos pela equipe."}'::jsonb,
   'B', 'O pronome "ele" pode retomar o servidor ou o diretor.'),
  ((select id from b_x5), 30, 'Língua Portuguesa',
   'Leia: “A instituição investiu em tecnologia. Contudo, os resultados dependeram também da preparação dos profissionais.” A palavra “Contudo” pode ser substituída, mantendo o sentido, por:',
   '{"A":"Portanto.","B":"Porque.","C":"Ademais.","D":"Todavia.","E":"Assim."}'::jsonb,
   'D', '"Todavia" é equivalente a "contudo": indica contraste.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
