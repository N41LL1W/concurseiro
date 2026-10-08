-- Cadastra o Dia 9 (versão completa e robusta).
delete from days where week = 2 and day_number = 4;

with d as (
  insert into days (week, day_number, title)
  values (2, 4, 'Colocação pronominal + porcentagem + atos administrativos + sistemas operacionais/arquivos/atalhos')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Colocação pronominal — próclise, ênclise e mesóclise', 30, $$Pronomes oblíquos átonos: me, te, se, o, a, os, as, lhe, lhes, nos, vos. Ex.: "Me disseram a verdade." / "Disseram-me a verdade."

PRÓCLISE
Pronome antes do verbo: "Não me diga isso." (pronome "me", verbo "diga").

ÊNCLISE
Pronome depois do verbo: "Diga-me a verdade."

MESÓCLISE
Pronome no meio do verbo — usada principalmente com futuro do presente e futuro do pretérito: "Dar-lhe-ei a resposta."; "Convidar-me-iam para a reunião." Soa estranho na linguagem cotidiana, mas pode aparecer em prova.

PALAVRAS QUE ATRAEM O PRONOME (favorecem a próclise) — a parte mais importante
Palavras negativas: não, nunca, jamais, ninguém, nada... Ex.: "Não me disseram nada." (nunca "Não disseram-me nada").
Pronomes relativos: que, quem, onde, cujo... Ex.: "O candidato que me ajudou foi aprovado."
Pronomes indefinidos: alguém, ninguém, tudo, nada... Ex.: "Alguém me chamou."
Advérbios: ex.: "Sempre me lembro disso."
Conjunções subordinativas: ex.: "Quando me chamaram, eu fui."

REGRA DE OURO
Encontrou uma palavra que atrai o pronome? Pense primeiro em PRÓCLISE.

PEGADINHA CLÁSSICA
"Não me diga isso." (certo) e "Diga-me isso." (certo) — a diferença é que "não" atrai o pronome para antes do verbo.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — colocação pronominal (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Porcentagem — cálculo rápido, aumentos e descontos sucessivos', 35, $$Porcentagem significa "por 100": 10% = 10/100 = 0,10; 25% = 0,25; 50% = 0,50.

CALCULANDO UMA PORCENTAGEM
Quanto é 20% de R$ 500? 500 × 0,20 = 100.

MÉTODO RÁPIDO
Para 10%: divida por 10 (10% de 800 = 80). Para 5%: metade de 10% (5% de 800 = 40). Para 1%: divida por 100 (1% de 800 = 8).

AUMENTO PERCENTUAL
Produto de R$ 200 com aumento de 10%: 10% de 200 = 20; 200 + 20 = R$ 220.

DESCONTO PERCENTUAL
Produto de R$ 500 com desconto de 20%: 20% de 500 = 100; 500 − 100 = R$ 400.

FORMA RÁPIDA (fatores)
Aumento de 10% → ×1,10. Aumento de 25% → ×1,25. Desconto de 10% → ×0,90. Desconto de 30% → ×0,70.
Decore: aumento soma 1 à taxa decimal (10% → 1,10; 20% → 1,20; 30% → 1,30); desconto subtrai de 1 (10% → 0,90; 20% → 0,80; 30% → 0,70).

AUMENTOS SUCESSIVOS (pegadinha)
Produto aumenta 10% e depois mais 10%: NÃO é simplesmente 20%. R$ 100 → 100×1,10 = 110 → 110×1,10 = 121. Aumento total: 21%.

DESCONTOS SUCESSIVOS
R$ 100 com dois descontos de 10%: 100×0,90 = 90 → 90×0,90 = 81. Desconto total: 19%, não 20%.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — porcentagem (Q5 a Q8)', 15
  from d returning id
),
b_adm_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Administrativo', 'teoria', 'Atos administrativos — elementos, vinculação, anulação e revogação', 30, $$Ato administrativo é a manifestação da Administração Pública (ou de quem exerça função administrativa) destinada a produzir efeitos jurídicos. Para concurso: elementos, atributos, anulação, revogação, discricionariedade e vinculação.

ELEMENTOS DO ATO ADMINISTRATIVO — macete COMFI
Competência: poder legal atribuído ao agente para praticar o ato. Ex.: um servidor sem competência legal não pode assumir atribuição de outra autoridade.
Objeto: o conteúdo do ato — aquilo que ele efetivamente determina.
Motivo: a situação de fato e de direito que justifica o ato. Ex.: um servidor comete uma infração prevista em lei — essa situação pode ser o motivo de uma medida administrativa.
Finalidade: todo ato deve buscar o interesse público — nunca finalidade pessoal.
Forma: a maneira pela qual o ato se exterioriza (ex.: pode exigir forma escrita).
Macete: COMFI = Competência, Objeto, Motivo, Finalidade, "I"orma (forma).

ATO VINCULADO
A Administração tem pouca ou nenhuma liberdade de escolha — presentes os requisitos legais, deve agir conforme a lei determina.

ATO DISCRICIONÁRIO
Existe certa margem de escolha dentro dos limites da lei — a Administração pode avaliar conveniência e oportunidade. Atenção: discricionariedade não é liberdade absoluta — o agente continua limitado pela lei.

ANULAÇÃO × REVOGAÇÃO (uma das diferenças mais cobradas)
Anulação: a Administração anula um ato quando ele é ilegal. Ato ilegal → anulação.
Revogação: a Administração retira um ato válido por razões de conveniência e oportunidade. Ato válido que deixou de ser conveniente/oportuno → revogação.
Macete: ANULAR = ato ilegal; REVOGAR = ato válido que deixou de ser conveniente/oportuno.$$
  from d returning id
),
b_adm_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Administrativo', 'exercicios', 'Fixação — atos administrativos (Q9 a Q12)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'Sistemas operacionais, arquivos, extensões e atalhos do Windows', 25, $$SISTEMA OPERACIONAL
Software responsável por fornecer estrutura de uso do computador e gerenciar seus recursos. Ex.: Windows, Linux, macOS, Android, iOS.

ARQUIVOS E PASTAS
Arquivo é uma unidade de informação armazenada: documento.docx, prova.pdf, foto.jpg, planilha.xlsx. A extensão geralmente identifica o tipo do arquivo.

EXTENSÕES IMPORTANTES
.docx = documento Word. .xlsx = planilha Excel. .pptx = apresentação PowerPoint. .pdf = documento PDF. .jpg/.png = imagem. .txt = texto. .zip = arquivo compactado.

ATALHOS DO WINDOWS
Ctrl+C: copiar. Ctrl+V: colar. Ctrl+X: recortar. Ctrl+Z: desfazer. Ctrl+A: selecionar tudo. Ctrl+S: salvar. Ctrl+P: imprimir. Ctrl+F: localizar/pesquisar. Windows+E: abre o Explorador de Arquivos. Alt+Tab: alterna entre janelas abertas.

LIXEIRA
Quando um arquivo é excluído normalmente, ele pode ir para a Lixeira, permitindo restaurá-lo em certas situações. Excluir permanentemente é diferente de enviar para a Lixeira.$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — SO, arquivos e atalhos (Q13 a Q16)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 9, com bloco de nível mais alto no final (Q17 a Q36)', 40,
    $$Sem consulta. Misture Português (colocação pronominal), Matemática (porcentagem), Administrativo (atos administrativos) e Informática (SO/arquivos/atalhos). As últimas 6 questões formam o bloco de "nível mais alto".$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Revisão do Dia 9, revisão de 24h/7 dias e meta', 20, $$REVISÃO RÁPIDA
Português: próclise = pronome antes do verbo ("Não me diga"); ênclise = pronome depois ("Diga-me"); mesóclise = pronome no meio ("Dir-me-á"). Atraem o pronome: não, nunca, jamais, ninguém, que, quem, onde, quando, sempre (em certos contextos).
Matemática: 10% → ÷10; 1% → ÷100; 50% → ÷2; aumento de 20% → ×1,20; desconto de 20% → ×0,80. Cuidado: aumentos/descontos sucessivos de 10%+10% não somam 20%.
Administrativo: elementos COMFI (Competência, Objeto, Motivo, Finalidade, Forma). Ato ilegal → anulação. Ato válido inconveniente → revogação.
Informática: Ctrl+C copiar, Ctrl+V colar, Ctrl+X recortar, Ctrl+Z desfazer, Ctrl+A selecionar tudo, Ctrl+S salvar, Ctrl+P imprimir, Ctrl+F localizar, Alt+Tab alternar janelas, Win+E Explorador de Arquivos.

REVISÃO DE 24H (±15 min antes do Dia 10)
Pergunte-se sem consultar: o que é próclise? Quais palavras atraem o pronome? Quanto é 20% de 500? Qual a diferença entre anulação e revogação? Quais são os elementos do COMFI? O que faz Ctrl+C?

REVISÃO DE 7 DIAS
No Dia 16, volte a colocação pronominal, porcentagem, atos administrativos e atalhos/extensões — tente recuperar da memória, não simplesmente reler. (O app já agenda isso sozinho via o caderno de erros, com ciclos de 24h, 7 dias e 30 dias visíveis no Painel.)

META DO DIA 9 (36 questões no total)
32–36: excelente. 28–31: muito bom. 25–27: bom. 21–24: precisa reforçar. 0–20: precisamos revisar a base. O mais importante não é a nota — é descobrir qual matéria está produzindo os erros. Marque este bloco como concluído para fechar o Dia 9.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a alternativa de acordo com a norma-padrão:',
   '{"A":"Não diga-me isso.","B":"Não me diga isso.","C":"Não diga isso-me.","D":"Me não diga isso.","E":"Não diga-me isso não."}'::jsonb,
   'B', '"Não" atrai o pronome para antes do verbo (próclise): "Não me diga isso". As demais erram a colocação ou são construções incorretas.'),

  ((select id from b_port_ex), 2, 'Português',
   'Assinale a alternativa em que ocorre mesóclise:',
   '{"A":"Não me disseram a verdade.","B":"Disseram-me a verdade.","C":"Dir-me-ão a verdade.","D":"Eles me disseram a verdade.","E":"Quem me disse isso?"}'::jsonb,
   'C', '"Dir-me-ão" tem o pronome no meio do verbo (futuro do presente) — é mesóclise. As demais são próclise ou ênclise.'),

  ((select id from b_port_ex), 3, 'Português',
   'Em "O candidato que me procurou foi aprovado", o pronome "me" está:',
   '{"A":"depois do verbo.","B":"antes do verbo por atração do pronome relativo.","C":"no meio do verbo.","D":"em posição facultativa por causa da vírgula.","E":"incorretamente colocado."}'::jsonb,
   'B', 'O pronome relativo "que" atrai o pronome oblíquo para antes do verbo — próclise.'),

  ((select id from b_port_ex), 4, 'Português',
   'Assinale a alternativa correta:',
   '{"A":"Nunca disseram-me a verdade.","B":"Nunca me disseram a verdade.","C":"Nunca disseram a verdade-me.","D":"Me nunca disseram a verdade.","E":"Nunca a verdade me disseram."}'::jsonb,
   'B', '"Nunca" é palavra negativa que atrai o pronome para antes do verbo: "Nunca me disseram".'),

  -- Matemática — fixação (Q5-8)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Quanto é 15% de R$ 200?',
   '{"A":"R$ 15","B":"R$ 20","C":"R$ 25","D":"R$ 30","E":"R$ 35"}'::jsonb,
   'D', '200 × 0,15 = 30.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Um produto custa R$ 400 e sofre aumento de 20%. Seu novo preço será:',
   '{"A":"R$ 420","B":"R$ 440","C":"R$ 460","D":"R$ 480","E":"R$ 500"}'::jsonb,
   'D', '400 × 1,20 = 480.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Um produto custa R$ 500 e recebe desconto de 30%. O preço final será:',
   '{"A":"R$ 300","B":"R$ 325","C":"R$ 350","D":"R$ 375","E":"R$ 400"}'::jsonb,
   'C', '500 × 0,70 = 350.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Um produto de R$ 100 sofre dois aumentos sucessivos de 10%. O preço final será:',
   '{"A":"R$ 110","B":"R$ 120","C":"R$ 121","D":"R$ 122","E":"R$ 125"}'::jsonb,
   'C', '100 × 1,10 × 1,10 = 121 (aumento total de 21%, não 20%).'),

  -- Administrativo — fixação (Q9-12)
  ((select id from b_adm_ex), 1, 'Administrativo',
   'São elementos tradicionalmente estudados do ato administrativo:',
   '{"A":"competência, objeto, motivo, finalidade e forma.","B":"hierarquia, publicidade, eficiência, moralidade e forma.","C":"competência, eficiência, publicidade, motivo e hierarquia.","D":"objeto, publicidade, moralidade, finalidade e supremacia.","E":"motivo, eficiência, hierarquia, objeto e publicidade."}'::jsonb,
   'A', 'COMFI: competência, objeto, motivo, finalidade e forma.'),

  ((select id from b_adm_ex), 2, 'Administrativo',
   'A atribuição legal conferida a determinado agente público para praticar um ato corresponde ao elemento:',
   '{"A":"objeto.","B":"motivo.","C":"competência.","D":"finalidade.","E":"forma."}'::jsonb,
   'C', 'Competência: poder legal atribuído ao agente para praticar o ato.'),

  ((select id from b_adm_ex), 3, 'Administrativo',
   'Um ato administrativo ilegal deve, em regra, ser:',
   '{"A":"revogado.","B":"anulado.","C":"ratificado obrigatoriamente.","D":"convertido em discricionário.","E":"mantido até decisão judicial."}'::jsonb,
   'B', 'Ato ilegal → anulação.'),

  ((select id from b_adm_ex), 4, 'Administrativo',
   'A retirada de um ato administrativo válido por razões de conveniência e oportunidade caracteriza:',
   '{"A":"anulação.","B":"revogação.","C":"convalidação obrigatória.","D":"prescrição.","E":"cassação."}'::jsonb,
   'B', 'Ato válido que deixou de ser conveniente/oportuno → revogação.'),

  -- Informática — fixação (Q13-16)
  ((select id from b_info_ex), 1, 'Informática',
   'Windows, Linux e macOS são exemplos de:',
   '{"A":"navegadores.","B":"sistemas operacionais.","C":"antivírus.","D":"editores de texto.","E":"mecanismos de busca."}'::jsonb,
   'B', 'São exemplos de sistemas operacionais.'),

  ((select id from b_info_ex), 2, 'Informática',
   'O atalho Ctrl + C normalmente é utilizado para:',
   '{"A":"colar.","B":"recortar.","C":"copiar.","D":"salvar.","E":"imprimir."}'::jsonb,
   'C', 'Ctrl+C copia o conteúdo selecionado.'),

  ((select id from b_info_ex), 3, 'Informática',
   'O atalho Ctrl + Z normalmente serve para:',
   '{"A":"desfazer uma ação.","B":"salvar um arquivo.","C":"copiar um arquivo.","D":"imprimir.","E":"abrir o navegador."}'::jsonb,
   'A', 'Ctrl+Z desfaz a última ação.'),

  ((select id from b_info_ex), 4, 'Informática',
   'A extensão .xlsx está normalmente associada a:',
   '{"A":"apresentação.","B":"imagem.","C":"planilha eletrônica.","D":"arquivo de áudio.","E":"arquivo executável."}'::jsonb,
   'C', '.xlsx é a extensão padrão de planilhas do Excel.'),

  -- Mini-simulado (Q17-36)
  ((select id from b_simulado), 1, 'Português',
   'Assinale a alternativa correta segundo a norma-padrão:',
   '{"A":"Não disseram-me nada.","B":"Não me disseram nada.","C":"Me não disseram nada.","D":"Não disseram nada-me.","E":"Disseram não-me nada."}'::jsonb,
   'B', '"Não" atrai o pronome para antes do verbo: "Não me disseram nada".'),

  ((select id from b_simulado), 2, 'Português',
   'Assinale a alternativa que apresenta mesóclise:',
   '{"A":"Não me ajudaram.","B":"Ajudaram-me ontem.","C":"Ajudar-me-ão amanhã.","D":"Quem me ajudará?","E":"Sempre me ajudam."}'::jsonb,
   'C', '"Ajudar-me-ão" tem o pronome no meio do verbo, no futuro do presente — mesóclise.'),

  ((select id from b_simulado), 3, 'Português',
   'Em "Nunca me disseram a verdade", a palavra "nunca":',
   '{"A":"exige ênclise.","B":"favorece a próclise.","C":"exige mesóclise.","D":"impede o uso de pronome.","E":"não interfere na colocação pronominal."}'::jsonb,
   'B', '"Nunca" é palavra negativa que atrai o pronome para antes do verbo.'),

  ((select id from b_simulado), 4, 'Matemática/RLM',
   '25% de R$ 800 corresponde a:',
   '{"A":"R$ 100","B":"R$ 150","C":"R$ 180","D":"R$ 200","E":"R$ 250"}'::jsonb,
   'D', '800 × 0,25 = 200.'),

  ((select id from b_simulado), 5, 'Matemática/RLM',
   'Um produto custa R$ 600. Após um desconto de 20%, seu preço será:',
   '{"A":"R$ 420","B":"R$ 450","C":"R$ 480","D":"R$ 500","E":"R$ 520"}'::jsonb,
   'C', '600 × 0,80 = 480.'),

  ((select id from b_simulado), 6, 'Matemática/RLM',
   'Um produto de R$ 200 sofre aumento de 10% e depois desconto de 10%. O preço final será:',
   '{"A":"R$ 180","B":"R$ 190","C":"R$ 198","D":"R$ 200","E":"R$ 202"}'::jsonb,
   'C', '200 × 1,10 × 0,90 = 198 (não volta aos R$ 200 originais).'),

  ((select id from b_simulado), 7, 'Administrativo',
   'A retirada de ato ilegal pela própria Administração corresponde à:',
   '{"A":"revogação.","B":"anulação.","C":"discricionariedade.","D":"delegação.","E":"descentralização."}'::jsonb,
   'B', 'Ato ilegal → anulação.'),

  ((select id from b_simulado), 8, 'Administrativo',
   'A retirada de ato válido por razões de conveniência e oportunidade corresponde à:',
   '{"A":"anulação.","B":"revogação.","C":"cassação.","D":"invalidação judicial.","E":"delegação."}'::jsonb,
   'B', 'Ato válido inconveniente/inoportuno → revogação.'),

  ((select id from b_simulado), 9, 'Administrativo',
   'Qual alternativa apresenta corretamente os elementos do ato administrativo?',
   '{"A":"LIMPE.","B":"COMFI.","C":"CRIME.","D":"LEGAL.","E":"PIMPE."}'::jsonb,
   'B', 'COMFI: competência, objeto, motivo, finalidade, forma.'),

  ((select id from b_simulado), 10, 'Administrativo',
   'A finalidade do ato administrativo deve estar relacionada principalmente:',
   '{"A":"ao interesse particular do agente.","B":"ao interesse público previsto no ordenamento.","C":"ao interesse financeiro do servidor.","D":"à vontade pessoal da autoridade.","E":"ao interesse de terceiros."}'::jsonb,
   'B', 'Todo ato administrativo deve buscar o interesse público, nunca finalidade pessoal.'),

  ((select id from b_simulado), 11, 'Informática',
   'O atalho Ctrl + V é utilizado normalmente para:',
   '{"A":"copiar.","B":"recortar.","C":"colar.","D":"desfazer.","E":"localizar."}'::jsonb,
   'C', 'Ctrl+V cola o conteúdo copiado/recortado.'),

  ((select id from b_simulado), 12, 'Informática',
   'O atalho Ctrl + S normalmente corresponde a:',
   '{"A":"salvar.","B":"selecionar tudo.","C":"sair.","D":"pesquisar.","E":"imprimir."}'::jsonb,
   'A', 'Ctrl+S salva o arquivo.'),

  ((select id from b_simulado), 13, 'Informática',
   'A extensão .pdf normalmente identifica:',
   '{"A":"uma planilha.","B":"uma apresentação.","C":"um documento em formato PDF.","D":"uma imagem bitmap.","E":"um arquivo executável."}'::jsonb,
   'C', '.pdf identifica um documento em formato PDF.'),

  ((select id from b_simulado), 14, 'Informática',
   'O atalho Alt + Tab normalmente permite:',
   '{"A":"fechar o computador.","B":"alternar entre janelas abertas.","C":"apagar arquivos.","D":"abrir o Explorador de Arquivos.","E":"salvar documentos."}'::jsonb,
   'B', 'Alt+Tab alterna entre as janelas abertas.'),

  -- Bloco de nível mais alto
  ((select id from b_simulado), 15, 'Português',
   'Assinale a alternativa correta:',
   '{"A":"Não entregar-me-ão os documentos.","B":"Não me entregarão os documentos.","C":"Não entregarão-me os documentos.","D":"Me não entregarão os documentos.","E":"Não os documentos me entregarão."}'::jsonb,
   'B', '"Não" atrai o pronome para antes do verbo: "Não me entregarão os documentos".'),

  ((select id from b_simulado), 16, 'Matemática/RLM',
   'Um produto custa R$ 1.000. Primeiro sofre aumento de 20% e depois desconto de 20%. O preço final será:',
   '{"A":"R$ 960","B":"R$ 980","C":"R$ 1.000","D":"R$ 1.020","E":"R$ 1.040"}'::jsonb,
   'A', '1000 × 1,20 × 0,80 = 960 — o desconto incide sobre o valor já aumentado, não sobre o original.'),

  ((select id from b_simulado), 17, 'Administrativo',
   'Um ato administrativo válido deixa de ser conveniente para a Administração. Considerando as regras gerais aplicáveis, a medida adequada é:',
   '{"A":"anulação.","B":"revogação.","C":"nulidade automática.","D":"cassação obrigatória.","E":"inexistência."}'::jsonb,
   'B', 'Ato válido que deixou de ser conveniente → revogação (não anulação, pois não há ilegalidade).'),

  ((select id from b_simulado), 18, 'Português',
   'Considere a frase: "O servidor que me orientou foi aprovado." A colocação do pronome "me" ocorre antes do verbo porque:',
   '{"A":"há um pronome relativo que favorece a próclise.","B":"há um advérbio de modo.","C":"ocorre mesóclise.","D":"há uma conjunção coordenativa.","E":"a ênclise é obrigatória."}'::jsonb,
   'A', 'O pronome relativo "que" atrai o pronome oblíquo para antes do verbo.'),

  ((select id from b_simulado), 19, 'Matemática/RLM',
   'Um salário de R$ 2.000 sofre aumento de 15%. O novo salário será:',
   '{"A":"R$ 2.150","B":"R$ 2.200","C":"R$ 2.250","D":"R$ 2.300","E":"R$ 2.350"}'::jsonb,
   'D', '2000 × 1,15 = 2300.'),

  ((select id from b_simulado), 20, 'Informática',
   'Assinale a alternativa correta:',
   '{"A":"Ctrl + C cola o conteúdo selecionado.","B":"Ctrl + V copia o conteúdo selecionado.","C":"Ctrl + Z desfaz uma ação.","D":"Ctrl + S imprime o documento.","E":"Alt + Tab exclui a janela atual."}'::jsonb,
   'C', 'Ctrl+Z desfaz uma ação — está correto. As demais trocam as funções: Ctrl+C copia (não cola), Ctrl+V cola (não copia), Ctrl+S salva (não imprime), Alt+Tab alterna janelas (não exclui).')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
