-- TJSP — Bloco I (Língua Portuguesa) — Módulo 1: interpretação, compreensão, inferência e ponto de vista.
-- Pré-requisito: rodar db/migracao_trilhas.sql uma vez (cria a coluna "track" em days).
-- Convenção da trilha TJSP: track = 'tjsp', week = 100 + nº do bloco, day_number = nº do módulo.
delete from days where track = 'tjsp' and week = 101 and day_number = 1;

with d as (
  insert into days (track, week, day_number, title)
  values ('tjsp', 101, 1, 'Interpretação e compreensão de textos, informações literais, inferências e ponto de vista do autor')
  returning id
),
b_a as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Língua Portuguesa', 'teoria', 'Compreensão, informação explícita, inferência e interpretação', 25, $$COMPREENSÃO DE TEXTO: O QUE É?
Compreender um texto é identificar aquilo que o autor efetivamente escreveu, considerando as informações expressas diretamente nele. A compreensão exige identificar: o assunto principal; a ideia central; as informações explícitas; o objetivo do texto; os argumentos apresentados; a relação entre as partes; o significado de determinadas expressões no contexto.
Exemplo. Texto: "O atendimento digital facilitou o acesso de muitos cidadãos aos serviços públicos. Entretanto, a expansão dessas ferramentas não elimina a necessidade de atendimento presencial, especialmente para pessoas que enfrentam dificuldades de acesso à internet ou de utilização de recursos tecnológicos." Pergunta: segundo o texto, o atendimento digital... Resposta: beneficia os cidadãos, mas não elimina a necessidade de atendimento presencial. O texto afirma que o atendimento digital facilitou o acesso e que o presencial continua necessário para determinados grupos; a alternativa correta reúne as duas informações.
Pegadinha: a alternativa "tornou desnecessário o atendimento presencial" transforma uma informação parcial em afirmação absoluta.

INFORMAÇÃO EXPLÍCITA (LITERAL)
É aquela diretamente apresentada no texto. Você não precisa deduzir: basta localizar. Ex.: "A unidade judiciária funcionará excepcionalmente das 10h às 16h durante o período de manutenção do sistema." Qual o horário de funcionamento? Das 10h às 16h — está literalmente no texto.
Como a banca cobra: "De acordo com o texto...", "Segundo o autor...", "Conforme o trecho...", "O texto afirma que...", "A informação apresentada é...", "Está expressamente indicado que...". Nesses casos, cuidado para não acrescentar informações que o texto não apresentou.
Técnica para informação literal: 1) leia o comando; 2) identifique o que está sendo perguntado; 3) volte ao texto; 4) localize o trecho correspondente; 5) compare a alternativa com o texto; 6) desconfie de alternativas que acrescentam informações.

INFORMAÇÃO IMPLÍCITA E INFERÊNCIA
Inferir é chegar a uma conclusão a partir das informações fornecidas pelo texto. A inferência não está escrita de modo direto, mas pode ser concluída logicamente.
Exemplo: "Carlos chegou ao trabalho com o uniforme molhado e carregava um guarda-chuva fechado." O texto não afirma que estava chovendo, mas é razoável inferir que Carlos provavelmente enfrentou chuva. Não é possível afirmar que ele mora longe, foi de ônibus, estava atrasado, perdeu o guarda-chuva ou sofreu um acidente: essas informações não estão autorizadas pelo texto.
Regra fundamental: inferência é uma conclusão autorizada pelo texto. Não é imaginação.
Outro exemplo: "A sala estava vazia. As luzes permaneciam apagadas e as cadeiras estavam organizadas." Inferência válida: provavelmente não havia atividade acontecendo naquele momento. Inferência inválida: a escola estava fechada definitivamente.

COMPREENSÃO × INTERPRETAÇÃO
Compreensão: identifica o que está expresso, busca informações literais, localiza dados, responde ao que está escrito. Interpretação: analisa o significado, pode exigir inferências, relaciona informações, responde ao que o texto permite concluir. Na prática, os concursos misturam os dois.
Exemplo: "Embora o sistema tenha reduzido o tempo de atendimento, alguns usuários ainda encontram dificuldades para utilizar a plataforma." Compreensão: o sistema reduziu o tempo de atendimento. Interpretação: a implantação trouxe benefícios, mas não resolveu todos os problemas — a interpretação exige perceber a relação entre as duas partes.$$
  from d returning id
),
b_b as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 2, 'Língua Portuguesa', 'teoria', 'Ideia central, tema, tese, ponto de vista, fato × opinião', 30, $$ASSUNTO × IDEIA CENTRAL
Assunto: tema geral sobre o qual o texto fala — pode ser identificado por uma palavra ou expressão (tecnologia, educação, justiça, meio ambiente, saúde, atendimento público). Ideia central: aquilo que o autor pretende comunicar sobre o assunto — normalmente resumida em uma frase.
Exemplo: "A utilização de ferramentas digitais no Poder Judiciário contribuiu para agilizar diversos procedimentos. Contudo, a modernização exige investimentos em segurança da informação, capacitação dos servidores e inclusão dos cidadãos que apresentam dificuldades tecnológicas." Assunto: modernização digital do Poder Judiciário. Ideia central: a digitalização agiliza procedimentos, mas exige medidas de segurança, capacitação e inclusão.
Como diferenciar: assunto — "sobre o que o texto fala?"; ideia central — "o que o texto quer dizer sobre esse assunto?".

TEMA, TESE E ARGUMENTOS
Em textos argumentativos, identifique três elementos. Tema: o assunto geral (tecnologia na Justiça). Tese: a posição defendida pelo autor (a tecnologia deve ampliar a eficiência do Judiciário sem comprometer o acesso à Justiça). Argumentos: as razões que sustentam a tese (a tecnologia reduz tarefas repetitivas; permite acesso remoto; pode reduzir custos; facilita a consulta processual; exige inclusão digital e proteção de dados).
Exemplo completo — Tema: tecnologia no Judiciário. Tese: a tecnologia melhora os serviços judiciais, desde que implementada de maneira inclusiva. Argumento 1: reduz burocracias e agiliza procedimentos. Argumento 2: facilita o acesso remoto. Argumento 3: precisa vir acompanhada de alternativas para cidadãos com dificuldades digitais.

PONTO DE VISTA DO AUTOR
É a posição, opinião ou perspectiva do autor em relação ao assunto. O texto pode ser favorável a uma ideia, contrário a ela, crítico, neutro ou predominantemente informativo, defensor de uma solução ou questionador de uma prática.
Favorável: "A digitalização dos serviços públicos representa um avanço significativo, pois reduz deslocamentos e permite que cidadãos resolvam diversas demandas de maneira mais rápida."
Crítico: "Apesar dos benefícios tecnológicos, a substituição indiscriminada do atendimento presencial pode aprofundar a exclusão de pessoas que não possuem acesso adequado à internet." (crítica à substituição indiscriminada).
Equilibrado: "A digitalização trouxe benefícios importantes, mas também criou desafios relacionados à segurança e à inclusão." (reconhece benefícios e problemas).
Pegadinha: a banca pode dizer que o autor defende a extinção do atendimento presencial, rejeita completamente a tecnologia ou considera todos os usuários preparados para sistemas digitais. Se o texto só aponta benefícios e desafios, essas afirmações são exageradas.

LINGUAGEM OBJETIVA E SUBJETIVA
Objetiva: apresenta informações de modo direto, buscando transmitir fatos — dados, números, informações verificáveis, linguagem direta, menos opinião pessoal. Ex.: "O tribunal publicou 120 decisões durante o período analisado." Subjetiva: apresenta impressões, sentimentos, avaliações ou opiniões. Ex.: "A decisão representa uma conquista extraordinária para a sociedade." (a expressão "conquista extraordinária" demonstra avaliação).
Atenção: um texto informativo pode conter opinião e um argumentativo pode apresentar fatos. Observe como o texto é escrito e qual é seu objetivo, não apenas o assunto.

FATO × OPINIÃO
Fato: informação que pode ser verificada objetivamente. Ex.: "O tribunal inaugurou uma nova unidade na terça-feira." Opinião: avaliação, julgamento ou posicionamento. Ex.: "A inauguração da unidade foi uma decisão excelente."
Exemplo misto: "O tribunal inaugurou uma nova unidade na terça-feira, medida que certamente melhorará o atendimento." A primeira parte é factual; a segunda é previsão ou avaliação.
Palavras que frequentemente indicam opinião: excelente, péssimo, injusto, necessário, importante, preocupante, inadequado, melhor, pior, infelizmente, felizmente, evidentemente, certamente. Não significam automaticamente que a frase inteira é opinião, mas merecem atenção.

INFORMAÇÕES PRINCIPAIS E SECUNDÁRIAS
Principal: essencial para compreender a mensagem. Secundária: complementa, explica, exemplifica ou detalha a principal.
Exemplo: "A implantação do sistema eletrônico tornou mais rápida a tramitação de processos. O programa permite consultar documentos, acompanhar movimentações e receber notificações. Além disso, sua utilização reduz a necessidade de deslocamentos físicos." Principal: o sistema eletrônico agilizou a tramitação processual. Secundárias: permite consultar documentos; acompanhar movimentações; receber notificações; reduz deslocamentos.
Pegadinha: uma alternativa pode trazer uma informação verdadeira do texto que não representa sua ideia central. Cuidado quando o comando pede ideia principal, objetivo central, síntese, resumo ou mensagem principal.$$
  from d returning id
),
b_c as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Língua Portuguesa', 'teoria', 'Objetivo comunicativo, tipos de texto, textos não verbais e ironia', 25, $$OBJETIVO COMUNICATIVO DO TEXTO
O autor escreve com uma finalidade. Informar: apresentar dados ou acontecimentos (notícia). Argumentar: defender uma opinião (artigo de opinião). Instruir: ensinar como realizar algo (manual). Convencer: influenciar o leitor (propaganda). Criticar: apontar problemas (editorial ou artigo crítico). Narrar: contar acontecimentos (conto ou relato). Descrever: apresentar características (descrição de ambiente). Divulgar: apresentar informações sobre algo (texto institucional).
Comandos típicos: "Esse texto tem como principal objetivo...", "Com a publicação, pretende-se...", "A finalidade predominante do texto é...", "A função do texto consiste em...". A resposta deve considerar o texto inteiro, não uma frase isolada.

TIPOS DE TEXTO
Narrativo: apresenta acontecimentos; elementos comuns — personagens, narrador, tempo, espaço, acontecimentos e enredo. Ex.: "Ao chegar ao fórum, Marina percebeu que havia esquecido os documentos em casa. Retornou imediatamente e conseguiu chegar antes do início da audiência."
Descritivo: apresenta características de pessoas, objetos, ambientes ou situações. Ex.: "A sala era ampla, iluminada e possuía diversas mesas organizadas em fileiras."
Dissertativo: apresenta ideias, explicações ou argumentos. Dissertativo-expositivo: explica ou informa sem necessariamente defender opinião. Dissertativo-argumentativo: defende uma tese com argumentos. Ex.: "A ampliação do acesso à Justiça exige não apenas a criação de novas unidades, mas também o aprimoramento dos meios de atendimento."
Injuntivo ou instrucional: apresenta orientações, instruções ou comandos. Ex.: "Preencha o formulário, anexe os documentos necessários e encaminhe a solicitação."

TEXTOS VERBAIS E NÃO VERBAIS
Verbal: utiliza palavras (escrito ou oral). Não verbal: utiliza elementos que não dependem de palavras — imagens, fotografias, símbolos, sinais, gráficos, ilustrações. Multimodal: combina elementos verbais e não verbais (ex.: campanha com fotografia, frase, gráfico e símbolos).
Interpretação de imagens — observe: 1) o que aparece; 2) quais elementos estão em destaque; 3) se há contraste; 4) se há símbolos; 5) qual mensagem é transmitida; 6) qual a relação entre imagem e texto.
Exemplo: imagem de uma pessoa tentando acessar um computador enquanto outras usam celulares e tablets pode sugerir desigualdade de acesso tecnológico, inclusão digital, dificuldade de adaptação ou dependência tecnológica — mas a conclusão precisa estar apoiada nos elementos da imagem.

IRONIA
Ocorre quando a expressão utilizada transmite um sentido diferente, frequentemente contrário, do literal. Ex.: "Que maravilha! O sistema caiu justamente no momento em que eu precisava protocolar o documento." A expressão "Que maravilha!" não representa satisfação verdadeira; o contexto demonstra frustração.
A banca pode perguntar o efeito de sentido da expressão, a intenção do autor, o sentido contextual ou o tom utilizado. Tons possíveis: humorístico, sarcástico, crítico, irônico, indignado, triste, otimista, cético.$$
  from d returning id
),
b_d as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 4, 'Língua Portuguesa', 'teoria', 'Palavras absolutas e relações lógicas: causa, oposição, conclusão, explicação e concessão', 25, $$CUIDADO COM PALAVRAS ABSOLUTAS
Muitas alternativas erradas usam palavras que ampliam ou distorcem a afirmação: sempre, nunca, todos, nenhum, exclusivamente, apenas, completamente, obrigatoriamente, impossível, necessariamente.
Exemplo: texto — "A tecnologia pode contribuir para melhorar o atendimento público." Alternativa — "A tecnologia sempre garante atendimento perfeito." Errada: o texto afirma que a tecnologia pode contribuir; a alternativa afirma que ela sempre garante. O grau de certeza foi alterado.
Escala de força das afirmações: mais moderada — pode contribuir, tende a melhorar, geralmente, frequentemente. Mais absoluta — sempre, necessariamente, todos, exclusivamente, jamais. A banca frequentemente troca uma expressão moderada por uma absoluta para criar uma alternativa incorreta.

CAUSA E CONSEQUÊNCIA
"A falta de manutenção dos equipamentos provocou interrupções no atendimento." Causa: falta de manutenção. Consequência: interrupções. "Como houve atraso na entrega, o serviço não foi concluído." Causa: atraso. Consequência: serviço não concluído. "A capacitação dos servidores reduziu os erros no preenchimento dos formulários." Causa: capacitação. Consequência: redução dos erros.
Cuidado: nem toda sequência de acontecimentos é relação de causa e consequência. "O servidor chegou cedo e a reunião começou às 9h." Não se pode concluir que a reunião começou às 9h porque o servidor chegou cedo.

OPOSIÇÃO E CONTRASTE
Palavras: mas, porém, contudo, entretanto, todavia, embora, apesar de, ainda que. "O sistema é eficiente, porém apresenta algumas limitações." (ideia 1: eficiência; ideia 2: limitações; "porém" introduz contraste). "Embora o procedimento seja simples, exige atenção." (o autor reconhece a simplicidade, mas apresenta uma ressalva).

CONCLUSÃO
Palavras: portanto, logo, assim, dessa forma, por conseguinte, consequentemente. "Os documentos estavam incompletos. Portanto, o pedido não foi processado." A segunda frase apresenta uma conclusão decorrente da primeira.

EXPLICAÇÃO
Palavras: porque, pois, já que, visto que, uma vez que. "O atendimento foi suspenso porque o sistema estava indisponível." O trecho após "porque" explica a suspensão.

CONCESSÃO
O autor admite algo que poderia contrariar sua ideia principal, mas mantém a posição. Palavras: embora, ainda que, mesmo que, apesar de, conquanto. "Embora o sistema seja complexo, os servidores conseguiram utilizá-lo." O texto reconhece a complexidade, mas apresenta um resultado que não foi impedido por ela.$$
  from d returning id
),
b_e as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Língua Portuguesa', 'teoria', 'Método de resolução e resumo para memorizar', 15, $$MÉTODO DE RESOLUÇÃO DE QUESTÕES DE INTERPRETAÇÃO
Passo 1 — Leia o comando primeiro. Identifique se pede ideia central, informação literal, inferência, ponto de vista, significado, objetivo ou relação entre ideias.
Passo 2 — Leia o texto procurando a estrutura: introdução, desenvolvimento, conclusão, palavras de oposição, palavras de conclusão, exemplos, causa e consequência.
Passo 3 — Identifique a resposta antes de olhar as alternativas. Tente responder com suas próprias palavras: isso reduz a chance de ser induzido por uma alternativa bem escrita, mas errada.
Passo 4 — Elimine alternativas exageradas. Desconfie de absolutismos, informações que não estão no texto, generalizações, inversões de causa e consequência, troca do ponto de vista, contradições e alternativas que misturam informações verdadeiras e falsas.
Passo 5 — Confira o texto. Nunca marque só porque a alternativa parece lógica: ela precisa ser sustentada pelo texto.

RESUMO PARA MEMORIZAR
Compreensão: localizar o que está escrito. Interpretação: compreender o significado do texto. Inferência: concluir algo que não foi dito diretamente, mas pode ser deduzido. Assunto: tema geral. Ideia central: mensagem principal. Tese: posicionamento defendido pelo autor. Argumento: razão usada para defender a tese. Fato: informação verificável. Opinião: julgamento, avaliação ou posicionamento. Informação explícita: aparece diretamente no texto. Informação implícita: precisa ser deduzida. Concessão: admite uma ideia, mas apresenta ressalva. Contraste: oposição entre ideias. Conclusão: resultado lógico ou fechamento de uma ideia.

CONECTIVOS MAIS IMPORTANTES
Mas, porém, contudo, entretanto: oposição. Portanto, logo, assim: conclusão. Porque, visto que, já que: causa ou explicação. Embora, ainda que, apesar de: concessão. Além disso, também: adição. Para que, a fim de que: finalidade. Se, caso: condição. Conforme, segundo: conformidade.$$
  from d returning id
),
b_ex1 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 6, 'Língua Portuguesa', 'exercicios', 'Texto 1 — Questões 1 a 4', 8,
    $$Texto-base: "A informatização dos serviços judiciais trouxe mudanças importantes para a rotina dos tribunais. A possibilidade de realizar consultas e protocolar documentos pela internet reduziu deslocamentos e facilitou o acompanhamento dos processos. Entretanto, a transformação digital não deve ser confundida com a eliminação de todas as formas de atendimento presencial. Para parte da população, o acesso à tecnologia ainda representa um obstáculo, o que torna necessária a manutenção de mecanismos de atendimento inclusivos."$$
  from d returning id
),
b_ex2 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Língua Portuguesa', 'exercicios', 'Texto 2 — Questões 5 a 7', 6,
    $$Texto-base: "A eficiência de uma instituição pública não deve ser medida exclusivamente pela quantidade de procedimentos realizados. A qualidade do atendimento, a observância dos direitos dos cidadãos e a transparência também são elementos fundamentais. Uma administração que produz resultados rapidamente, mas desconsidera garantias legais, pode comprometer a confiança da sociedade."$$
  from d returning id
),
b_ex3 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 8, 'Língua Portuguesa', 'exercicios', 'Texto 3 — Questões 8 a 10', 6,
    $$Texto-base: "A leitura frequente contribui para o desenvolvimento do vocabulário e para a ampliação da capacidade de compreender diferentes assuntos. Além disso, permite que o leitor entre em contato com diferentes perspectivas, favorecendo a reflexão crítica. Embora os benefícios sejam amplamente reconhecidos, a formação de leitores depende também de condições de acesso aos livros e de incentivo à leitura."$$
  from d returning id
),
b_ex4 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Língua Portuguesa', 'exercicios', 'Questões estilo concurso — Questões 11 a 15', 15,
    $$Cada questão traz o seu próprio texto no enunciado. Resolva primeiro, confira depois.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Língua Portuguesa', 'revisao', 'Caderno de erros, revisão programada e checklist do Módulo 1', 10, $$CADERNO DE ERROS
Ao corrigir, anote o raciocínio que levou ao erro, não apenas o gabarito. Inferência — concluí algo que não estava autorizado: conferir se a conclusão está sustentada pelo texto. Ideia central — marquei um detalhe: identificar a mensagem do texto inteiro. Conectivo — confundi oposição e conclusão: memorizar as relações dos conectivos. Ponto de vista — interpretei informação como opinião: separar fato e avaliação. Absolutismo — não percebi "sempre": conferir a intensidade da alternativa. Os erros nas questões entram automaticamente no caderno de erros do app.

REVISÃO PROGRAMADA
24 horas depois: releia o resumo e refaça as questões erradas. 3 dias depois: explique compreensão, inferência, tese e ideia central sem consultar. 7 dias depois: 10 questões novas de interpretação. 15 dias depois: revise os conectivos e as pegadinhas. 30 dias depois: simulado de Português com interpretação e gramática.

CHECKLIST — O QUE VOCÊ PRECISA DOMINAR
Diferenciar compreensão e interpretação. Identificar informações explícitas. Realizar inferências válidas. Identificar assunto e ideia central. Diferenciar tema, tese e argumento. Identificar o ponto de vista do autor. Diferenciar fato e opinião. Identificar informação principal e secundária. Reconhecer objetivo comunicativo. Identificar textos narrativos, descritivos, dissertativos e injuntivos. Interpretar textos verbais e não verbais. Reconhecer ironia. Identificar causa e consequência. Reconhecer oposição, conclusão, explicação e concessão. Identificar alternativas absolutas ou exageradas. Resolver questões sem acrescentar informações externas.
Meta do módulo: interpretar textos com segurança, sem adivinhação, e acertar pelo menos 80% das questões de interpretação.
Próximo módulo: Módulo 2 — estruturação do texto, coesão, coerência e relações entre ideias.
Marque este bloco como concluído para fechar o Módulo 1.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_ex1), 1, 'Língua Portuguesa',
   'A ideia central do texto é:',
   '{"A":"A informatização dos serviços judiciais deve ser interrompida.","B":"O atendimento presencial deve ser eliminado, pois a tecnologia permite solucionar todas as demandas.","C":"A informatização trouxe benefícios, mas deve ser acompanhada de medidas que garantam inclusão e acesso aos serviços.","D":"O acompanhamento dos processos pela internet prejudica os usuários.","E":"A tecnologia não trouxe alterações significativas para a rotina dos tribunais."}'::jsonb,
   'C', 'A ideia central combina os dois aspectos: a informatização trouxe benefícios e é necessário garantir inclusão e acesso. A alternativa B exagera, defendendo a eliminação do atendimento presencial, o que o texto não afirma.'),
  ((select id from b_ex1), 2, 'Língua Portuguesa',
   'Segundo o texto, é correto afirmar que:',
   '{"A":"Todos os cidadãos possuem facilidade para acessar os serviços digitais.","B":"A informatização reduziu deslocamentos e facilitou o acompanhamento dos processos.","C":"Os tribunais deixaram de oferecer atendimento presencial.","D":"A tecnologia prejudicou a realização de consultas processuais.","E":"O atendimento inclusivo é desnecessário diante da informatização."}'::jsonb,
   'B', 'Está expressamente indicado no texto que a informatização reduziu deslocamentos e facilitou o acompanhamento dos processos.'),
  ((select id from b_ex1), 3, 'Língua Portuguesa',
   'A palavra "Entretanto", no texto, estabelece uma relação de:',
   '{"A":"Conclusão.","B":"Explicação.","C":"Adição.","D":"Oposição ou contraste.","E":"Finalidade."}'::jsonb,
   'D', '"Entretanto" é conjunção adversativa: indica oposição ou contraste.'),
  ((select id from b_ex1), 4, 'Língua Portuguesa',
   'Pode-se inferir do texto que:',
   '{"A":"A digitalização dos serviços judiciais beneficia todos os cidadãos da mesma maneira.","B":"A existência de serviços digitais pode não ser suficiente para garantir o acesso de toda a população.","C":"Os tribunais devem abandonar definitivamente os procedimentos digitais.","D":"Pessoas que não utilizam a internet não podem acessar a Justiça.","E":"O atendimento presencial é sempre mais eficiente que o digital."}'::jsonb,
   'B', 'Inferência válida: se parte da população enfrenta dificuldades tecnológicas, o serviço digital, por si só, pode não garantir acesso universal. As demais extrapolam o texto (absolutos como "todos", "definitivamente" e "sempre").'),

  ((select id from b_ex2), 5, 'Língua Portuguesa',
   'O autor defende que:',
   '{"A":"A rapidez deve ser o único critério de avaliação das instituições.","B":"A quantidade de procedimentos é mais importante do que os direitos dos cidadãos.","C":"A eficiência institucional deve considerar diversos fatores, inclusive qualidade, direitos e transparência.","D":"A transparência impede que as instituições sejam eficientes.","E":"A observância de garantias legais torna os procedimentos necessariamente lentos."}'::jsonb,
   'C', 'O autor critica a avaliação baseada exclusivamente na quantidade e defende que se considerem vários elementos.'),
  ((select id from b_ex2), 6, 'Língua Portuguesa',
   'A expressão "exclusivamente pela quantidade" indica que:',
   '{"A":"A quantidade é um critério irrelevante.","B":"A quantidade deve ser considerada, mas não como critério único.","C":"A quantidade deve ser eliminada da avaliação.","D":"Apenas a quantidade deve ser considerada.","E":"A quantidade é sempre insuficiente para qualquer avaliação."}'::jsonb,
   'B', '"Exclusivamente" significa somente. O autor não rejeita a quantidade como critério; rejeita que seja o único.'),
  ((select id from b_ex2), 7, 'Língua Portuguesa',
   'No texto, a expressão "mas desconsidera garantias legais" apresenta uma ideia de:',
   '{"A":"Adição.","B":"Causa.","C":"Conclusão.","D":"Contraste.","E":"Finalidade."}'::jsonb,
   'D', '"Mas" é conjunção adversativa: contrasta rapidez e desrespeito às garantias legais.'),

  ((select id from b_ex3), 8, 'Língua Portuguesa',
   'O texto apresenta a leitura como:',
   '{"A":"Uma atividade que desenvolve habilidades linguísticas e críticas, mas que depende também de condições de acesso e incentivo.","B":"Uma atividade útil apenas para o desenvolvimento do vocabulário.","C":"Uma prática que não influencia a capacidade de reflexão.","D":"Uma atividade que depende exclusivamente da vontade individual.","E":"Um hábito que deve ser substituído pela tecnologia."}'::jsonb,
   'A', 'O texto apresenta benefícios da leitura (vocabulário, compreensão, reflexão crítica) e reconhece que acesso e incentivo também são necessários.'),
  ((select id from b_ex3), 9, 'Língua Portuguesa',
   'A expressão "Além disso" estabelece relação de:',
   '{"A":"Oposição.","B":"Adição.","C":"Conclusão.","D":"Causa.","E":"Condição."}'::jsonb,
   'B', '"Além disso" acrescenta uma informação.'),
  ((select id from b_ex3), 10, 'Língua Portuguesa',
   'O trecho "Embora os benefícios sejam amplamente reconhecidos" expressa:',
   '{"A":"Causa.","B":"Consequência.","C":"Concessão.","D":"Conclusão.","E":"Finalidade."}'::jsonb,
   'C', '"Embora" é conjunção subordinativa concessiva: os benefícios são reconhecidos, mas isso não elimina a necessidade de condições de acesso e incentivo.'),

  ((select id from b_ex4), 11, 'Língua Portuguesa',
   'Leia: “O acesso à informação constitui importante instrumento de participação social. Todavia, a simples disponibilização de dados não garante que eles sejam compreendidos pela população. É necessário que as informações sejam apresentadas de maneira clara e acessível.” A partir do texto, conclui-se corretamente que:',
   '{"A":"A disponibilização de dados é suficiente para garantir a participação social.","B":"A informação pública deve ser necessariamente restrita a especialistas.","C":"A participação social depende exclusivamente da quantidade de informações disponíveis.","D":"A informação deve ser disponibilizada de modo que possa ser compreendida pela população.","E":"A clareza das informações impede a participação social."}'::jsonb,
   'D', 'A informação precisa ser disponibilizada de forma compreensível e acessível. A alternativa A é incorreta porque o texto diz que disponibilizar dados, por si só, não garante participação.'),
  ((select id from b_ex4), 12, 'Língua Portuguesa',
   'Leia: “A implantação de novas tecnologias pode tornar os serviços mais ágeis. Contudo, a eficiência não depende apenas dos equipamentos, mas também da capacitação dos profissionais responsáveis por utilizá-los.” A afirmação que corresponde ao posicionamento do texto é:',
   '{"A":"Equipamentos modernos tornam desnecessária a capacitação profissional.","B":"A tecnologia pode melhorar os serviços, mas a capacitação também é necessária.","C":"A capacitação profissional impede o uso de tecnologias.","D":"A eficiência depende exclusivamente dos equipamentos.","E":"A tecnologia não influencia a eficiência dos serviços."}'::jsonb,
   'B', 'O texto afirma que a tecnologia pode contribuir para a eficiência, mas a capacitação também é importante.'),
  ((select id from b_ex4), 13, 'Língua Portuguesa',
   'Leia: “O servidor consultou o sistema diversas vezes, mas não conseguiu localizar o documento. Após verificar o arquivo físico, encontrou a informação solicitada.” A partir do trecho, é correto afirmar que:',
   '{"A":"O documento estava definitivamente perdido.","B":"O servidor não realizou nenhuma consulta.","C":"A consulta ao sistema foi suficiente para encontrar o documento.","D":"A informação foi localizada por meio da consulta ao arquivo físico.","E":"O arquivo físico não continha documentos."}'::jsonb,
   'D', 'A informação foi encontrada no arquivo físico, após a tentativa malsucedida no sistema.'),
  ((select id from b_ex4), 14, 'Língua Portuguesa',
   'Leia: “A medida foi adotada com o objetivo de reduzir os custos operacionais. Apesar disso, os resultados iniciais não foram suficientes para confirmar a expectativa de economia.” A expressão “Apesar disso” indica:',
   '{"A":"Causa.","B":"Consequência.","C":"Concessão ou contraste.","D":"Explicação.","E":"Adição."}'::jsonb,
   'C', '"Apesar disso" indica oposição entre a expectativa de economia e os resultados iniciais.'),
  ((select id from b_ex4), 15, 'Língua Portuguesa',
   'Leia: “Muitos cidadãos desconhecem os serviços que podem ser solicitados pela internet. A divulgação dessas ferramentas, acompanhada de orientações simples, pode ampliar sua utilização.” O texto permite concluir que:',
   '{"A":"A divulgação de serviços digitais pode contribuir para que mais cidadãos os utilizem.","B":"Todos os cidadãos já conhecem os serviços digitais.","C":"A utilização da internet deve ser proibida para solicitar serviços.","D":"Orientações simples dificultam o uso das ferramentas.","E":"A divulgação não possui relação com a utilização dos serviços."}'::jsonb,
   'A', 'O texto afirma que divulgar as ferramentas, com orientações simples, pode ampliar sua utilização.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);