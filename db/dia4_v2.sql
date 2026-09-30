-- Cadastra o Dia 4 (versão completa e robusta).
delete from days where week = 1 and day_number = 4;

with d as (
  insert into days (week, day_number, title)
  values (1, 4, 'Constitucional — art. 5º (direitos e garantias fundamentais) + Matemática (porcentagem avançada)')
  returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Constitucional', 'teoria', 'Art. 5º, CF — direitos e garantias fundamentais', 75, $$O art. 5º é enorme (78 incisos). Hoje não vamos decorar tudo de uma vez — vamos construir uma base forte nos pontos que mais aparecem em provas de nível médio. Lógica: entender → memorizar → identificar pegadinhas → resolver questões.

1. O CAPUT DO ART. 5º
Todos são iguais perante a lei, com inviolabilidade dos direitos à vida, liberdade, igualdade, segurança e propriedade. Macete: V-L-I-S-P (Vida, Liberdade, Igualdade, Segurança, Propriedade).

2. IGUALDADE
Homens e mulheres são iguais em direitos e obrigações, nos termos da Constituição. Igualdade constitucional não significa tratar todos de forma absolutamente idêntica em qualquer situação — o Direito admite tratamentos diferenciados com fundamento constitucional ou legal legítimo, mas para nível médio guarde primeiro a regra geral.

3. PRINCÍPIO DA LEGALIDADE (inciso II)
Ninguém será obrigado a fazer ou deixar de fazer alguma coisa senão em virtude de LEI (não "ordem administrativa").

4. LIBERDADE DE MANIFESTAÇÃO DO PENSAMENTO (inciso IV)
É livre a manifestação do pensamento, mas é vedado o anonimato. Macete: pensamento = livre; anonimato = proibido.

5. DIREITO DE RESPOSTA (inciso V)
Direito de resposta proporcional ao agravo, além de indenização por dano material, moral ou à imagem — as consequências podem coexistir, não é preciso escolher só uma.

6. LIBERDADE DE CONSCIÊNCIA E CRENÇA (inciso VI)
Inviolável a liberdade de consciência e de crença, assegurado o livre exercício dos cultos religiosos e proteção aos locais de culto e suas liturgias.

7. ESCUSA DE CONSCIÊNCIA (inciso VIII)
Ninguém será privado de direitos por crença religiosa, convicção filosófica ou política, salvo se invocar isso para se eximir de obrigação legal a todos imposta e recusar-se a cumprir prestação alternativa fixada em lei. Pegadinha: não é possível simplesmente deixar de cumprir qualquer obrigação por motivo religioso — existe a prestação alternativa.

8. LIBERDADE DE EXPRESSÃO (inciso IX)
Livre a expressão da atividade intelectual, artística, científica e de comunicação, independentemente de censura ou licença.

9. INTIMIDADE, VIDA PRIVADA, HONRA E IMAGEM (inciso X)
Invioláveis intimidade, vida privada, honra e imagem, assegurado direito a indenização pelo dano material ou moral decorrente de sua violação. Macete: I-V-H-I.

10. INVIOLABILIDADE DO DOMICÍLIO (inciso XI)
A casa é asilo inviolável do indivíduo. Ninguém pode entrar sem consentimento do morador, salvo: flagrante delito, desastre, prestar socorro, ou durante o dia por determinação judicial.
Pegadinha importante: o simples mandado judicial NÃO autoriza entrada durante a noite. Macete: FDS + mandado de dia (Flagrante, Desastre, Socorro + mandado judicial só de dia).

11. SIGILO DAS COMUNICAÇÕES (inciso XII)
Invioláveis correspondência, comunicações telegráficas, dados e comunicações telefônicas — mas há exceção para as telefônicas: por ordem judicial, nas hipóteses e forma que a lei estabelecer, para investigação criminal ou instrução processual penal. Pegadinha: o sigilo telefônico pode sim ser quebrado nessa hipótese constitucional.

12. LIBERDADE DE LOCOMOÇÃO (inciso XV)
Livre locomoção no território nacional em tempo de paz: entrar, permanecer, sair e levar bens, nos termos constitucionais.

13. DIREITO DE REUNIÃO (inciso XVI)
Reunião pacífica, sem armas, em locais abertos ao público, independentemente de autorização — mas é necessário prévio aviso à autoridade competente. Pegadinha: não é autorização, é aviso prévio.

14. REQUISITOS DA REUNIÃO
Pacífica, sem armas, local aberto ao público, sem autorização, com prévio aviso, sem frustrar outra reunião já convocada para o mesmo local.

15. LIBERDADE DE ASSOCIAÇÃO (inciso XVII)
Plena liberdade de associação para fins lícitos; é vedada associação de caráter paramilitar.

16. PROPRIEDADE
A Constituição garante a propriedade, mas ela deve atender à sua função social — não é absoluta.

17. ACESSO À JUSTIÇA (inciso XXXV)
A lei não excluirá da apreciação do Poder Judiciário lesão ou ameaça a direito — princípio da inafastabilidade da jurisdição.

18. DIREITO ADQUIRIDO, ATO JURÍDICO PERFEITO E COISA JULGADA (inciso XXXVI)
A lei não prejudicará: direito adquirido (já incorporado ao patrimônio jurídico, observados os requisitos legais), ato jurídico perfeito (já realizado conforme a lei vigente à época) e coisa julgada (decisão que não está mais sujeita a recurso). Macete: DAC.

19. TRIBUNAL DO JÚRI (inciso XXXVIII)
Reconhecida a instituição do júri, com plenitude de defesa, sigilo das votações, soberania dos veredictos e competência para julgar os crimes dolosos contra a vida — memorize especialmente esse último ponto.

20. CRIMES COM TRATAMENTO CONSTITUCIONAL ESPECÍFICO
Tortura (inafiançável e insuscetível de graça ou anistia), tráfico ilícito de entorpecentes, terrorismo e crimes hediondos também têm tratamento constitucional específico. Pegadinha: não confunda inafiançável com imprescritível — são conceitos diferentes.

21. RACISMO
A prática do racismo constitui crime inafiançável e imprescritível, sujeito a pena de reclusão.

22. AÇÃO DE GRUPOS ARMADOS
Também é inafiançável e imprescritível a ação de grupos armados, civis ou militares, contra a ordem constitucional e o Estado Democrático. Essas duas (racismo e ação de grupos armados) são as categorias clássicas de "inafiançável + imprescritível".

23. PENAS PROIBIDAS
Não haverá: pena de morte (salvo em caso de guerra declarada), pena de caráter perpétuo, trabalhos forçados, banimento e penas cruéis. Macete: M-P-T-B-C. Pegadinha: a Constituição NÃO proíbe absolutamente a pena de morte — existe a exceção da guerra declarada.

24. DEVIDO PROCESSO LEGAL (inciso LIV)
Ninguém será privado da liberdade ou de seus bens sem o devido processo legal.

25. CONTRADITÓRIO E AMPLA DEFESA (inciso LV)
Aos litigantes, em processo judicial ou administrativo, e aos acusados em geral são assegurados contraditório (conhecer e reagir aos argumentos e atos do processo) e ampla defesa (usar os meios e recursos de defesa admitidos pelo ordenamento).

26. PROVAS ILÍCITAS (inciso LVI)
São inadmissíveis, no processo, as provas obtidas por meios ilícitos.

27. PRESUNÇÃO DE INOCÊNCIA (inciso LVII)
Ninguém será considerado culpado até o trânsito em julgado de sentença penal condenatória — literalidade muito cobrada.

RESUMÃO DO ART. 5º ESTUDADO HOJE
Caput = vida, liberdade, igualdade, segurança, propriedade. Legalidade = lei. Pensamento = livre, sem anonimato. Resposta = proporcional ao agravo. Religião = liberdade de consciência/crença. Expressão = sem censura/licença. Privacidade = intimidade, vida privada, honra, imagem. Casa = FDS + mandado de dia. Comunicações = sigilo + exceção telefônica constitucional. Locomoção = livre em tempo de paz. Reunião = sem autorização + prévio aviso. Associação = fins lícitos. Propriedade = função social. Justiça = lesão ou ameaça. DAC = direito adquirido, ato perfeito, coisa julgada. Júri = dolosos contra a vida. Racismo = inafiançável + imprescritível. Penas = proibições constitucionais. Defesa = contraditório + ampla defesa. Prova ilícita = inadmissível. Culpabilidade = trânsito em julgado.$$
  from d returning id
),
b_lei_seca as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 2, 'Constitucional', 'revisao', 'Lei Seca — art. 5º + fixação', 25, $$Leia diretamente o art. 5º da Constituição Federal. Não tente ler os 78 incisos de forma decorativa — foque nos que estudamos hoje.

1ª leitura: do começo ao fim, sem parar.
2ª leitura: marque os incisos estudados hoje: I, II, IV, V, VI, VIII, IX, X, XI, XII, XV, XVI, XVII, XXII, XXXV, XXXVI, XXXVIII, XLII, XLIII, XLIV, XLVII, LIV, LV, LVI e LVII.
3ª leitura: tente explicar cada um com suas próprias palavras, sem olhar o material.

Marque este bloco como concluído depois das três leituras.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 3, 'Constitucional', 'exercicios', 'Questões sobre o art. 5º (Q1 a Q16)', 40
  from d returning id
),
b_mat_teoria1 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 4, 'Matemática/RLM', 'teoria', 'Aumento, desconto e variações sucessivas — fatores', 50, $$No Dia 2 você aprendeu o básico de porcentagem. Agora o raciocínio fica mais exigente.

1. AUMENTO PERCENTUAL
Se um valor V aumenta p%: V_final = V × (1 + p/100). Ex.: R$ 800 com aumento de 15% → 800 × 1,15 = 920.

2. DESCONTO PERCENTUAL
V_final = V × (1 − p/100). Ex.: R$ 800 com desconto de 15% → 800 × 0,85 = 680.

3. AUMENTOS SUCESSIVOS
R$ 1.000 com aumento de 10% e depois mais 20%: primeira etapa 1000 × 1,10 = 1100; segunda etapa 1100 × 1,20 = 1320. Resultado: R$ 1.320 — aumento total de 32%, não 30%.

4. FÓRMULA MAIS RÁPIDA (fatores)
Com várias alterações: V_final = V_inicial × fator1 × fator2 × fator3... Ex.: +10% → fator 1,10; +20% → fator 1,20 → 1000 × 1,10 × 1,20 = 1320.

5. DESCONTOS SUCESSIVOS
R$ 1.000 com desconto de 10% e depois mais 20%: fatores 0,90 e 0,80 → 1000 × 0,90 × 0,80 = 720. Desconto total: 28%, não 30%.

6. AUMENTO E DESCONTO DO MESMO PERCENTUAL (pegadinha clássica)
R$ 1.000 aumenta 20% → 1000 × 1,20 = 1200. Depois reduz 20% → 1200 × 0,80 = 960. Resultado: R$ 960, NÃO volta para R$ 1.000 — porque o segundo percentual incide sobre R$ 1.200, e não sobre os R$ 1.000 originais.$$
  from d returning id
),
b_mat_teoria2 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Matemática/RLM', 'teoria', 'Valor original, cálculo do percentual e pontos percentuais', 20, $$7. DESCOBRIR O VALOR ORIGINAL
Um produto, após desconto de 20%, custa R$ 400. O preço final representa 80% do original: 0,80x = 400 → x = 500. Resposta: R$ 500.

8. DESCOBRIR O PERCENTUAL
Um produto passou de R$ 200 para R$ 250. Aumento: 250 − 200 = 50. Percentual: 50/200 = 0,25 → 25%. Regra importante: ao perguntar "qual foi o percentual de aumento?", o denominador normalmente é o valor inicial.

9. PONTOS PERCENTUAIS × PORCENTAGEM
Uma taxa passou de 20% para 30%: a diferença é 30% − 20% = 10 pontos percentuais. Mas, proporcionalmente, o aumento foi 10/20 = 50% — aumento de 10 pontos percentuais, equivalente a 50% de aumento relativo. São conceitos diferentes.

10. EXEMPLO
Taxa de aprovação de 40% para 50%: diferença de 10 pontos percentuais; aumento relativo = (50−40)/40 = 10/40 = 25%. Ou seja: 10 pontos percentuais, ou 25% em relação ao valor inicial.

RESUMO DE MATEMÁTICA
Aumento: × (1+p). Desconto: × (1−p). Vários aumentos/descontos: multiplique os fatores. Descobrir valor inicial: divida pelo fator final. Descobrir percentual: diferença / valor inicial. Pontos percentuais: é a diferença direta entre percentuais (não a razão entre eles).$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Matemática/RLM', 'exercicios', 'Questões de porcentagem avançada (Q17 a Q24)', 30
  from d returning id
),
b_rev as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Revisão/Simulados', 'revisao', 'Desafio final + caderno de erros + fechamento dos 4 primeiros dias', 20, $$DESAFIO FINAL — responda sem consultar o material
Constitucional:
1. Quais são os cinco direitos do caput do art. 5º?
2. O que diz o princípio da legalidade do inciso II?
3. Manifestação do pensamento é livre? E o anonimato?
4. Quais são as quatro situações que permitem entrada na casa sem consentimento?
5. Mandado judicial pode autorizar entrada durante a noite?
6. Reunião depende de autorização?
7. O que é necessário para reunião em local aberto ao público?
8. A propriedade é absoluta?
9. O que significa "DAC"?
10. Racismo é afiançável e prescritível?
11. Quais são as penas proibidas?
12. Quando a Constituição admite pena de morte?
13. O que são contraditório e ampla defesa?
14. Provas ilícitas são admitidas?
15. Quando termina, segundo a literalidade do art. 5º, a presunção de não culpabilidade?

Matemática:
16. Qual é o fator de um aumento de 20%?
17. Qual é o fator de um desconto de 20%?
18. Por que dois aumentos sucessivos não devem ser simplesmente somados?
19. Um produto de R$ 500 teve aumento de 10%. Quanto passou a custar?
20. Qual a diferença entre percentual e ponto percentual?

CADERNO DE ERROS — DIA 4
Separe Constitucional e Matemática. Registre só o essencial: a questão, o erro e a regra.
Ex. Constitucional: "Questão 5 — achei que mandado judicial permitisse entrada à noite. Regra: a determinação judicial para entrada no domicílio é durante o dia."
Ex. Matemática: "Questão 21 — somei +20% e −20%. Regra: alterações sucessivas incidem sobre valores diferentes; usar fatores, não soma direta."
As questões erradas nos exercícios de hoje já entram automaticamente no caderno de erros do app.

FECHAMENTO DOS PRIMEIROS 4 DIAS
Com os quatro primeiros dias você já construiu base em: Português (interpretação, inferência, compreensão, classes gramaticais), Matemática (razão, proporção, regra de três, porcentagem, variações sucessivas), Constitucional (arts. 1º a 5º: fundamentos, objetivos, Poderes, relações internacionais, direitos e garantias fundamentais), Administrativo (art. 37, LIMPE) e Informática (hardware, software, sistemas operacionais, armazenamento, Internet, Web, protocolos, segurança).
Marque este bloco como concluído para fechar o Dia 4 e o primeiro ciclo.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_const_ex), 1, 'Constitucional',
   'Segundo a Constituição Federal, são invioláveis os direitos à:',
   '{"A":"vida, liberdade, igualdade, segurança e propriedade.","B":"vida, liberdade, trabalho, segurança e propriedade.","C":"igualdade, saúde, educação, segurança e propriedade.","D":"vida, educação, igualdade, trabalho e propriedade.","E":"liberdade, saúde, igualdade, segurança e educação."}'::jsonb,
   'A', 'É a literalidade do caput do art. 5º: vida, liberdade, igualdade, segurança e propriedade (macete V-L-I-S-P).'),

  ((select id from b_const_ex), 2, 'Constitucional',
   'De acordo com a Constituição Federal, ninguém será obrigado a fazer ou deixar de fazer alguma coisa senão:',
   '{"A":"por determinação administrativa.","B":"em virtude de lei.","C":"por decisão particular.","D":"por determinação verbal de autoridade.","E":"mediante autorização judicial em qualquer situação."}'::jsonb,
   'B', 'Inciso II: princípio da legalidade — a palavra exata é "lei", não "ordem administrativa".'),

  ((select id from b_const_ex), 3, 'Constitucional',
   'É livre a manifestação do pensamento, sendo:',
   '{"A":"permitida a manifestação anônima.","B":"vedado o anonimato.","C":"exigida autorização prévia.","D":"exigida licença administrativa.","E":"proibida a manifestação crítica."}'::jsonb,
   'B', 'Inciso IV: o pensamento é livre, mas o anonimato é vedado.'),

  ((select id from b_const_ex), 4, 'Constitucional',
   'A Constituição assegura direito de resposta:',
   '{"A":"proporcional ao agravo.","B":"somente mediante autorização administrativa.","C":"apenas em casos de dano material.","D":"exclusivamente em casos criminais.","E":"somente quando houver anonimato."}'::jsonb,
   'A', 'Inciso V: direito de resposta proporcional ao agravo, além de indenização — as consequências podem coexistir.'),

  ((select id from b_const_ex), 5, 'Constitucional',
   'Sobre a inviolabilidade do domicílio, assinale a alternativa correta:',
   '{"A":"Mandado judicial autoriza entrada a qualquer hora do dia ou da noite.","B":"A casa pode ser invadida livremente pela autoridade pública.","C":"Durante o dia, determinação judicial pode autorizar a entrada.","D":"Flagrante delito nunca permite entrada sem consentimento.","E":"Desastre não permite entrada sem autorização judicial."}'::jsonb,
   'C', 'O mandado judicial só autoriza entrada durante o dia. Flagrante, desastre e socorro permitem entrada a qualquer hora, sem precisar de mandado.'),

  ((select id from b_const_ex), 6, 'Constitucional',
   'A Constituição estabelece que é livre a locomoção no território nacional:',
   '{"A":"somente mediante autorização administrativa.","B":"apenas durante o dia.","C":"em tempo de paz, nos termos constitucionais.","D":"somente para brasileiros.","E":"exclusivamente em situações de emergência."}'::jsonb,
   'C', 'Inciso XV: livre locomoção no território nacional em tempo de paz, nos termos da lei.'),

  ((select id from b_const_ex), 7, 'Constitucional',
   'Sobre o direito de reunião, é correto afirmar que:',
   '{"A":"depende de autorização prévia.","B":"exige pagamento de taxa.","C":"deve ser pacífica e sem armas, sendo necessário prévio aviso à autoridade competente.","D":"somente pode ocorrer em locais privados.","E":"é proibido em locais abertos ao público."}'::jsonb,
   'C', 'Inciso XVI: reunião pacífica, sem armas, em local aberto ao público, sem autorização — mas com prévio aviso.'),

  ((select id from b_const_ex), 8, 'Constitucional',
   'A propriedade, segundo a Constituição Federal:',
   '{"A":"é absoluta e não possui limitações.","B":"não é protegida constitucionalmente.","C":"deve atender à sua função social.","D":"somente existe para pessoas jurídicas.","E":"depende sempre de autorização judicial."}'::jsonb,
   'C', 'A propriedade é garantida, mas deve atender à sua função social — não é absoluta.'),

  ((select id from b_const_ex), 9, 'Constitucional',
   'A lei não excluirá da apreciação do Poder Judiciário:',
   '{"A":"somente crimes.","B":"somente contratos.","C":"lesão ou ameaça a direito.","D":"apenas atos administrativos.","E":"apenas questões patrimoniais."}'::jsonb,
   'C', 'Inciso XXXV: princípio da inafastabilidade da jurisdição — lesão ou ameaça a direito.'),

  ((select id from b_const_ex), 10, 'Constitucional',
   'A Constituição determina que a lei não prejudicará:',
   '{"A":"apenas a coisa julgada.","B":"direito adquirido, ato jurídico perfeito e coisa julgada.","C":"somente o direito adquirido.","D":"somente contratos administrativos.","E":"apenas decisões administrativas."}'::jsonb,
   'B', 'Inciso XXXVI: os três institutos protegidos são direito adquirido, ato jurídico perfeito e coisa julgada (DAC).'),

  ((select id from b_const_ex), 11, 'Constitucional',
   'É reconhecida a instituição do júri, sendo de sua competência constitucional:',
   '{"A":"todos os crimes contra o patrimônio.","B":"todos os crimes administrativos.","C":"os crimes dolosos contra a vida.","D":"todos os crimes culposos.","E":"exclusivamente crimes eleitorais."}'::jsonb,
   'C', 'Inciso XXXVIII: compete ao júri julgar os crimes dolosos contra a vida.'),

  ((select id from b_const_ex), 12, 'Constitucional',
   'A prática do racismo constitui crime:',
   '{"A":"afiançável e prescritível.","B":"inafiançável e imprescritível.","C":"apenas imprescritível.","D":"apenas inafiançável.","E":"sujeito exclusivamente a multa."}'::jsonb,
   'B', 'Racismo é crime inafiançável e imprescritível, sujeito a pena de reclusão.'),

  ((select id from b_const_ex), 13, 'Constitucional',
   'A Constituição Federal admite pena de morte:',
   '{"A":"em qualquer crime grave.","B":"em crimes hediondos.","C":"somente em caso de guerra declarada.","D":"em qualquer situação de emergência.","E":"nunca, em nenhuma hipótese."}'::jsonb,
   'C', 'A vedação à pena de morte tem exceção expressa: guerra declarada.'),

  ((select id from b_const_ex), 14, 'Constitucional',
   'São inadmissíveis, no processo:',
   '{"A":"todas as provas testemunhais.","B":"todas as provas documentais.","C":"as provas obtidas por meios ilícitos.","D":"as provas digitais.","E":"as provas produzidas pela defesa."}'::jsonb,
   'C', 'Inciso LVI: prova ilícita é inadmissível no processo.'),

  ((select id from b_const_ex), 15, 'Constitucional',
   'Aos litigantes, em processo judicial ou administrativo, e aos acusados em geral são assegurados:',
   '{"A":"somente contraditório.","B":"somente ampla defesa.","C":"contraditório e ampla defesa.","D":"apenas defesa técnica.","E":"somente recurso administrativo."}'::jsonb,
   'C', 'Inciso LV: contraditório e ampla defesa, com os meios e recursos a ela inerentes.'),

  ((select id from b_const_ex), 16, 'Constitucional',
   'Ninguém será considerado culpado até:',
   '{"A":"o oferecimento da denúncia.","B":"o recebimento da denúncia.","C":"a sentença de primeiro grau.","D":"o trânsito em julgado de sentença penal condenatória.","E":"a instauração do inquérito."}'::jsonb,
   'D', 'Inciso LVII: presunção de inocência até o trânsito em julgado de sentença penal condenatória.'),

  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Um produto custa R$ 800 e sofre aumento de 15%. O novo preço será:',
   '{"A":"R$ 880","B":"R$ 900","C":"R$ 920","D":"R$ 940","E":"R$ 960"}'::jsonb,
   'C', '800 × 1,15 = 920.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Um produto de R$ 1.200 recebe desconto de 25%. Seu novo preço será:',
   '{"A":"R$ 850","B":"R$ 900","C":"R$ 950","D":"R$ 1.000","E":"R$ 1.050"}'::jsonb,
   'B', '1200 × 0,75 = 900.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Um valor de R$ 1.000 sofre aumento de 10% e, posteriormente, aumento de 20%. O valor final será:',
   '{"A":"R$ 1.200","B":"R$ 1.280","C":"R$ 1.300","D":"R$ 1.320","E":"R$ 1.350"}'::jsonb,
   'D', '1000 × 1,10 × 1,20 = 1320. O aumento total é 32%, não 30%.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Um produto de R$ 1.000 sofre descontos sucessivos de 10% e 20%. O preço final será:',
   '{"A":"R$ 700","B":"R$ 720","C":"R$ 750","D":"R$ 780","E":"R$ 800"}'::jsonb,
   'B', '1000 × 0,90 × 0,80 = 720. O desconto total é 28%, não 30%.'),

  ((select id from b_mat_ex), 5, 'Matemática/RLM',
   'Um produto sofreu aumento de 20% e, depois, desconto de 20%. Comparado ao valor original, o resultado final será:',
   '{"A":"igual ao original.","B":"2% maior.","C":"4% menor.","D":"4% maior.","E":"20% menor."}'::jsonb,
   'C', 'Ex.: 1000 × 1,20 × 0,80 = 960 — 4% menor que o original. O desconto de 20% incide sobre o valor já aumentado, não sobre o original.'),

  ((select id from b_mat_ex), 6, 'Matemática/RLM',
   'Após sofrer desconto de 20%, um produto passou a custar R$ 640. Seu preço original era:',
   '{"A":"R$ 720","B":"R$ 760","C":"R$ 780","D":"R$ 800","E":"R$ 820"}'::jsonb,
   'D', 'O preço final é 80% do original: 0,80x = 640 → x = 800.'),

  ((select id from b_mat_ex), 7, 'Matemática/RLM',
   'Um salário passou de R$ 2.500 para R$ 2.875. O aumento percentual foi de:',
   '{"A":"10%","B":"12%","C":"15%","D":"17%","E":"20%"}'::jsonb,
   'C', 'Diferença: 2875 − 2500 = 375. Percentual: 375/2500 = 0,15 = 15%.'),

  ((select id from b_mat_ex), 8, 'Matemática/RLM',
   'Uma taxa passou de 30% para 36%. O aumento foi de:',
   '{"A":"6 pontos percentuais e 20% em termos relativos.","B":"6% e 20 pontos percentuais.","C":"20 pontos percentuais e 6% relativo.","D":"36 pontos percentuais e 6% relativo.","E":"20% e 36 pontos percentuais."}'::jsonb,
   'A', 'Diferença direta: 36 − 30 = 6 pontos percentuais. Aumento relativo: 6/30 = 0,20 = 20%.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
