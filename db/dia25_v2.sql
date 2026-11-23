-- Cadastra o Dia 25. Carga: 4h20 (45+50+50+45+50+20), conforme o cronograma do dia.
delete from days where week = 6 and day_number = 1;

with d as (
  insert into days (week, day_number, title)
  values (6, 1, 'Concordância nominal + juros simples e compostos + direitos e garantias fundamentais + crédito, empréstimos e financiamentos')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Concordância nominal: regra geral, é necessário/proibido, anexo, obrigado, meio, menos, bastante', 30, $$A concordância nominal é a relação entre o substantivo e seus determinantes e modificadores (artigos, adjetivos, numerais, pronomes). É muito cobrada em questões de identificar erro gramatical.

REGRA GERAL
Quem se relaciona com o substantivo concorda com ele em gênero e número. "O funcionário dedicado." / "A funcionária dedicada." / "Os funcionários dedicados." / "As funcionárias dedicadas." O artigo e o adjetivo acompanham o substantivo.

ADJETIVO REFERIDO A DOIS OU MAIS SUBSTANTIVOS
Com gêneros diferentes, pode haver concordância no masculino plural: "O banco ofereceu atendimento e orientação adequados." Quando o adjetivo vem antes ("Excelente atendimento e orientação"), a concordância pode variar conforme a construção e o sentido. Observe a estrutura da frase.

"É NECESSÁRIO", "É PROIBIDO", "É PERMITIDO"
Sem determinante, a expressão fica no masculino singular: "É necessário paciência." / "É proibido entrada." / "É permitido acesso."
Com o substantivo determinado, concorda com ele: "É necessária a paciência." / "É proibida a entrada." / "É permitido o acesso." / "É permitida a entrada."
Compare: "É proibido entrada de pessoas." × "É proibida a entrada de pessoas." (na segunda, o artigo "a" determina o substantivo).

ANEXO, INCLUSO E OBRIGADO
Concordam com o termo a que se referem. Anexo: "O documento segue anexo." / "A declaração segue anexa." / "Os documentos seguem anexos." / "As declarações seguem anexas." Atenção: em "em anexo" é expressão invariável: "Seguem os documentos em anexo." Incluso: "O valor está incluso." / "A taxa está inclusa." / "Os valores estão inclusos." / "As taxas estão inclusas."
Obrigado concorda com quem agradece: homem — obrigado; mulher — obrigada; grupo masculino ou misto — obrigados; grupo feminino — obrigadas. "O candidato disse: 'Muito obrigado'." / "A candidata disse: 'Muito obrigada'."

MESMO, PRÓPRIO E QUITE
Mesmo (= próprio) varia: "Ela mesma resolveu a questão." / "Eles mesmos organizaram os documentos." Quando significa "realmente", pode ser invariável: "A situação é mesmo complicada." Próprio varia: o próprio candidato, a própria candidata, os próprios candidatos, as próprias candidatas. Quite varia em número: "O funcionário está quite." / "Os funcionários estão quites."

MENOS E MEIO
Menos é invariável: "menos pessoas", "menos horas", "menos documentos". Não existe "menas".
Meio, no sentido de "um pouco", é advérbio e invariável: "A candidata estava meio cansada." — mesmo sendo mulher, permanece "meio". No sentido de metade (numeral), concorda com o substantivo: "meia garrafa de água", "meio litro de água".

BASTANTE
Variável quando significa "muitos" e acompanha um substantivo: "Havia bastantes candidatos." Invariável quando modifica verbo, adjetivo ou advérbio: "Os candidatos estudaram bastante." / "As questões eram bastante difíceis."

SÓ
Com sentido de "somente", é invariável: "Só os candidatos aprovados serão convocados." Com sentido de "sozinho", pode variar: "O candidato ficou só." / "A candidata ficou só."

PEGADINHAS FREQUENTES
"Menas pessoas" → menos pessoas. "Ela estava meia cansada" → meio cansada. "Seguem anexo as declarações" → seguem anexas as declarações. "Muito obrigada" (mulher agradecendo) está correto. "Bastantes candidatos" está correto. "Estudaram bastante" está correto.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — concordância nominal (Q1 a Q4)', 15 from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática Financeira', 'teoria', 'Juros simples e compostos: fórmulas, unidade de tempo, comparação e taxas equivalentes', 35, $$CONCEITOS FUNDAMENTAIS
C = capital inicial. J = juros. i = taxa de juros. t = tempo. M = montante final. Montante é a soma do capital com os juros: M = C + J. Ex.: investiu R$ 1.000 e recebeu R$ 100 de juros → M = 1.100.

JUROS SIMPLES
Os juros são calculados sempre sobre o capital inicial. J = C × i × t. Montante: M = C × (1 + i×t).
Ex.: R$ 2.000 a 3% ao mês durante 4 meses, juros simples. i = 0,03. J = 2000 × 0,03 × 4 = 240. M = 2000 + 240 = R$ 2.240.

CUIDADO COM A UNIDADE DE TEMPO
Taxa e tempo precisam estar na mesma unidade. Ex.: 2% ao mês durante 1 ano → t = 12 (meses). Se a taxa for ao ano, o tempo deve estar em anos, salvo conversão adequada. Pegadinha: não misture taxa mensal com tempo em anos sem converter.

JUROS COMPOSTOS
Os juros de cada período são incorporados ao saldo, e o cálculo seguinte é feito sobre o valor atualizado — "juros sobre juros". M = C × (1 + i)^t. Juros totais: J = M − C.
Ex.: R$ 1.000 a 10% ao mês durante 2 meses, juros compostos. M = 1000 × (1,10)² = 1000 × 1,21 = R$ 1.210. J = 1210 − 1000 = R$ 210.

COMPARAÇÃO
Capital R$ 1.000, taxa 10% ao mês, 3 meses. Simples: J = 1000 × 0,10 × 3 = 300 → M = 1.300. Compostos: M = 1000 × (1,10)³ = 1000 × 1,331 = 1.331. Nesse exemplo, os juros compostos geram montante maior.
Simples: calculados sobre o capital inicial, crescimento linear (J = C·i·t). Compostos: calculados sobre o saldo atualizado, crescimento exponencial (M = C(1+i)^t).

COMO DIFERENCIAR NAS QUESTÕES
Se a questão diz "juros simples", use a fórmula linear. Se diz "juros compostos", use a exponencial. Em "capitalização", observe se os juros são incorporados ao saldo. Não escolha a fórmula só porque a questão cita banco ou investimento — leia o regime de juros informado.

TAXAS EQUIVALENTES
Em juros compostos, 2% ao mês não equivale simplesmente a 24% ao ano. A taxa efetiva anual equivalente é (1 + 0,02)^12 − 1 ≈ 26,82% ao ano. Em juros simples, a proporcionalidade entre taxas e períodos pode ser usada conforme o regime e a convenção do problema. No nível médio, priorize identificar a taxa, calcular o montante e diferenciar simples de compostos.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática Financeira', 'exercicios', 'Fixação — juros simples e compostos (Q1 a Q4)', 15 from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Art. 5º: igualdade, expressão, religião, domicílio, sigilo, reunião, associação, propriedade e remédios constitucionais', 35, $$DIREITOS × GARANTIAS
Os direitos fundamentais protegem valores essenciais: vida, liberdade, igualdade, segurança, propriedade. Direito é o bem ou interesse protegido; garantia é o mecanismo que o protege. Ex.: direito — liberdade de locomoção; garantia — habeas corpus, quando cabível.

CAPUT DO ART. 5º
"Todos são iguais perante a lei, sem distinção de qualquer natureza, garantindo-se aos brasileiros e aos estrangeiros residentes no País a inviolabilidade do direito à vida, à liberdade, à igualdade, à segurança e à propriedade."
Atenção: apesar de citar brasileiros e estrangeiros residentes, a interpretação constitucional e a jurisprudência reconhecem que vários direitos fundamentais também protegem estrangeiros não residentes, conforme a natureza do direito e a situação concreta. Não conclua que os direitos fundamentais são exclusivos de brasileiros e residentes.

IGUALDADE
Igualdade perante a lei não significa tratamento absolutamente idêntico em toda situação. Pode exigir tratamento diferenciado, com fundamento legítimo, para reduzir desigualdades (ex.: medidas de proteção a pessoas em situação de vulnerabilidade), sempre respeitando a Constituição.

DIREITO À VIDA
Protege a existência humana e se relaciona à dignidade da pessoa: proteção da vida, dignidade da pessoa humana, vedação de tratamentos desumanos, proteção contra violações arbitrárias.

LIBERDADE DE MANIFESTAÇÃO DO PENSAMENTO
Assegurada, mas é vedado o anonimato. Ex.: o cidadão pode criticar uma política pública, respeitando os direitos de terceiros. Pegadinha: a liberdade de expressão não é absoluta — deve ser compatibilizada com honra, imagem, intimidade e vida privada.

LIBERDADE RELIGIOSA
Protege a liberdade de consciência e de crença e o livre exercício dos cultos. O Estado é laico: não tem religião oficial, o que não significa impedir a prática religiosa — laicidade é neutralidade religiosa do Estado e proteção da liberdade de crença.

INTIMIDADE, VIDA PRIVADA, HONRA E IMAGEM
Invioláveis; a violação pode gerar consequências jurídicas, inclusive indenização por dano material ou moral. Ex.: divulgação indevida de informações privadas.

INVIOLABILIDADE DO DOMICÍLIO
A casa é asilo inviolável; em regra ninguém entra sem consentimento do morador. Exceções: flagrante delito, desastre, prestação de socorro (qualquer hora) e determinação judicial (somente durante o dia).
Pegadinha: o mandado judicial, por si só, não autoriza ingresso durante a noite.

SIGILO DAS COMUNICAÇÕES
Protege correspondência, comunicações telegráficas, de dados e telefônicas, nos termos constitucionais. A interceptação telefônica exige: ordem judicial; hipóteses e forma previstas em lei; finalidade de investigação criminal ou instrução processual penal. Não confunda interceptação telefônica com acesso a registros ou dados — são situações distintas, com regras próprias.

DIREITO DE REUNIÃO
Reunião pacífica, sem armas, em locais abertos ao público; não pode frustrar outra reunião já convocada para o mesmo local; exige prévio aviso à autoridade competente. A Constituição exige aviso, não autorização. Pegadinha: "é necessária autorização prévia" está errado.

LIBERDADE DE ASSOCIAÇÃO
Plena, para fins lícitos; vedada a de caráter paramilitar; ninguém é obrigado a associar-se ou permanecer associado; a criação independe de autorização, observadas as regras constitucionais. Dissolução compulsória exige decisão judicial transitada em julgado; suspensão de atividades exige decisão judicial.

PROPRIEDADE
Garantida, mas deve cumprir sua função social — não é absoluta. A Constituição prevê hipóteses de desapropriação, observados os requisitos legais e constitucionais.

REMÉDIOS CONSTITUCIONAIS
Habeas corpus (HC): protege a liberdade de locomoção contra ilegalidade ou abuso de poder.
Habeas data (HD): conhecer ou corrigir informações pessoais em registros ou bancos de dados governamentais ou de caráter público.
Mandado de segurança (MS): protege direito líquido e certo não amparado por HC ou HD, diante de ilegalidade ou abuso de poder, observados os requisitos legais.
Mandado de segurança coletivo: pode ser impetrado por legitimados como partido político com representação no Congresso Nacional e organizações sindicais, entidades de classe ou associações que preencham os requisitos.
Mandado de injunção (MI): quando a falta de norma regulamentadora inviabiliza o exercício de direitos e liberdades constitucionais ou prerrogativas ligadas à nacionalidade, soberania e cidadania.
Ação popular: proposta por cidadão para anular ato lesivo ao patrimônio público, à moralidade administrativa, ao meio ambiente ou ao patrimônio histórico e cultural.

QUADRO DE MEMORIZAÇÃO
Habeas corpus: liberdade de locomoção. Habeas data: conhecimento ou correção de dados pessoais. Mandado de segurança: direito líquido e certo. Mandado de injunção: falta de norma regulamentadora. Ação popular: anulação de ato lesivo aos bens protegidos pela Constituição.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — direitos e garantias fundamentais (Q1 a Q4)', 15 from d returning id
),
b_banc_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Conhecimentos Bancários', 'teoria', 'Crédito: empréstimo, financiamento, consignado, rotativo, cheque especial, garantias, risco e CET', 30, $$O QUE É CRÉDITO BANCÁRIO
Disponibilização de recursos ou de um limite financeiro por uma instituição, mediante condições contratadas. A instituição avalia capacidade de pagamento, renda, histórico de crédito, risco da operação, garantias e a finalidade do crédito, quando relevante. O crédito permite antecipar recursos para compras, investimentos ou outras operações.

EMPRÉSTIMO
A instituição disponibiliza dinheiro, que o cliente devolve conforme as condições contratadas, podendo usá-lo para diferentes finalidades, de acordo com o produto. Ex.: empréstimo pessoal, crédito consignado, empréstimo para empresas. Envolve concessão de recursos, pode ter juros e garantias, e tem prazo e condições de pagamento.

FINANCIAMENTO
Normalmente associado à aquisição de um bem ou serviço específico: imobiliário, de veículos, de equipamentos.
Empréstimo × financiamento: empréstimo pode ter finalidade livre, conforme o contrato (ex.: empréstimo pessoal); financiamento é geralmente vinculado a uma finalidade específica, com o crédito associado à compra de um bem ou serviço (ex.: financiamento de imóvel). Ambos são operações de crédito e podem envolver juros, tarifas e outras condições previstas em contrato e na regulamentação.

CRÉDITO CONSIGNADO
As parcelas são descontadas diretamente da remuneração ou benefício, conforme autorização e regras aplicáveis. Pode atingir servidores públicos, aposentados, pensionistas e trabalhadores de certas categorias, conforme a legislação e a modalidade.
Possíveis vantagens: pagamento previsível, condições específicas de juros, desconto automático. Cuidados: comprometimento da renda, análise das condições contratuais, atenção ao custo total, verificação da margem consignável.

CRÉDITO ROTATIVO
Financiamento de determinado saldo devedor, como em situações previstas para o cartão de crédito: se a fatura não é paga integralmente, pode haver utilização de modalidades de financiamento, conforme as regras aplicáveis. Observe juros, encargos, prazo, condições e regras regulatórias vigentes. Pegadinha: crédito rotativo não é a mesma coisa que cartão de débito.

CHEQUE ESPECIAL
Modalidade de crédito vinculada à conta corrente, disponibilizada conforme condições contratadas — permite usar recursos além do saldo, até certo limite. Ex.: R$ 100 na conta e operação de R$ 150: com limite disponível e operação autorizada, usa-se R$ 50 de crédito, que gera obrigação de pagamento e pode ter encargos. Cheque especial não é dinheiro próprio do cliente — é crédito.

CRÉDITO IMOBILIÁRIO E CRÉDITO RURAL
Imobiliário: aquisição, construção ou outras finalidades ligadas a imóveis; valores elevados, prazos longos, análise de renda, possível garantia sobre o imóvel, regras contratuais específicas; a CAIXA tem atuação relevante. Rural: financia atividades agropecuárias (custeio, investimento, comercialização, industrialização de produtos agropecuários), com regulamentação e condições específicas.

GARANTIAS E RISCO DE CRÉDITO
Garantias reduzem o risco da operação: garantia pessoal, fiança, aval, alienação fiduciária, hipoteca (conforme a modalidade). A garantia não elimina necessariamente o risco de inadimplência, mas pode reduzir perdas.
Risco de crédito: possibilidade de o cliente não cumprir as obrigações. Fatores: renda, histórico de pagamento, endividamento, garantias, capacidade de pagamento. Pegadinha: a concessão não deve se basear apenas na renda do cliente.

CUSTO EFETIVO TOTAL (CET)
Custo total de uma operação de crédito: juros, tarifas, tributos, seguros e outros encargos previstos na regulamentação. Permite comparar propostas de forma mais completa. Comparar só a taxa de juros pode levar a decisão equivocada — uma oferta com juros aparentemente menores pode ter mais despesas adicionais.

RESUMO
Empréstimo pessoal: finalidade livre, conforme contrato. Financiamento: geralmente vinculado a bem ou serviço. Consignado: parcelas descontadas da remuneração ou benefício. Cheque especial: crédito vinculado à conta corrente. Rotativo: financiamento de saldo devedor. Imobiliário: ligado a imóveis. Rural: atividades agropecuárias. CET: custo total da operação.$$
  from d returning id
),
b_banc_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Conhecimentos Bancários', 'exercicios', 'Fixação — crédito, empréstimos e financiamentos (Q1 a Q4)', 15 from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 25 (12 questões)', 50,
    $$Sem consulta. 12 questões misturando concordância nominal, juros, direitos fundamentais/remédios constitucionais e crédito bancário.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Caderno de erros, pegadinhas e revisão programada', 20, $$CADERNO DE ERROS
Revise: Português — "meio", "menos", "bastante", "anexo" e "obrigado"; Matemática — diferença entre juros simples e compostos; Constitucional — direitos fundamentais e remédios constitucionais; Bancários — empréstimo, financiamento, consignado, cheque especial e CET. Os erros nas questões de hoje entram automaticamente no caderno do app.

PEGADINHAS QUE VOCÊ PRECISA DOMINAR
Português: "meio cansada", "menos pessoas", "seguem anexas as declarações" e "bastantes candidatos" estão corretos.
Matemática: juros simples = capital × taxa × tempo; juros compostos = montante = capital × (1 + taxa) elevado ao tempo; confira se taxa e período estão na mesma unidade.
Constitucional: habeas corpus — liberdade de locomoção; habeas data — acesso ou correção de dados pessoais; mandado de injunção — falta de norma regulamentadora; reunião pacífica exige prévio aviso, não autorização; o mandado judicial para ingresso domiciliar vale durante o dia.
Bancários: empréstimo e financiamento não são exatamente a mesma coisa; consignado envolve desconto autorizado sobre remuneração ou benefício; cheque especial é crédito; CET considera o custo total da operação.

REVISÃO PROGRAMADA
Amanhã: revise concordância nominal, fórmulas de juros e remédios constitucionais. Em 7 dias: refaça as questões erradas e explique os conceitos sem consultar. Em 30 dias: simulado geral com os conteúdos dos Dias 23, 24 e 25.
Marque este bloco como concluído para fechar o Dia 25.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a alternativa correta:',
   '{"A":"A candidata estava meia cansada.","B":"Havia menas pessoas na agência.","C":"As declarações seguem anexas.","D":"Os documentos seguem anexo."}'::jsonb,
   'C', '"Anexas" concorda com "declarações". As demais erram: "meio cansada" (advérbio invariável), "menos" (nunca "menas") e "anexos" (deve concordar com "documentos").'),
  ((select id from b_port_ex), 2, 'Português',
   'Assinale a frase correta:',
   '{"A":"É proibida entrada.","B":"É proibido a entrada.","C":"É proibida a entrada.","D":"É proibidos a entrada."}'::jsonb,
   'C', 'Com o substantivo determinado pelo artigo "a", a expressão concorda: "é proibida a entrada".'),
  ((select id from b_port_ex), 3, 'Português',
   'Na frase "A funcionária estava meio preocupada", a palavra "meio" é:',
   '{"A":"Adjetivo variável.","B":"Advérbio invariável.","C":"Numeral variável.","D":"Substantivo."}'::jsonb,
   'B', 'Com sentido de "um pouco", "meio" é advérbio e não varia, mesmo com sujeito feminino.'),
  ((select id from b_port_ex), 4, 'Português',
   'Assinale a alternativa em que "bastante" está corretamente empregado:',
   '{"A":"Havia bastante candidatos.","B":"Os candidatos estudaram bastantes.","C":"As questões eram bastantes difíceis.","D":"Havia bastantes candidatos."}'::jsonb,
   'D', 'Com sentido de "muitos" e acompanhando substantivo, varia: "bastantes candidatos". Modificando verbo ou adjetivo, é invariável ("estudaram bastante", "bastante difíceis").'),

  ((select id from b_mat_ex), 1, 'Matemática Financeira',
   'Um capital de R$ 1.500 foi aplicado a juros simples de 2% ao mês durante 4 meses. Qual o montante?',
   '{"A":"R$ 1.560","B":"R$ 1.620","C":"R$ 1.680","D":"R$ 1.700"}'::jsonb,
   'B', 'J = 1500 × 0,02 × 4 = 120. M = 1500 + 120 = 1620.'),
  ((select id from b_mat_ex), 2, 'Matemática Financeira',
   'Um capital de R$ 1.000 é aplicado a juros compostos de 10% ao mês durante 2 meses. O montante será:',
   '{"A":"R$ 1.200","B":"R$ 1.210","C":"R$ 1.220","D":"R$ 1.100"}'::jsonb,
   'B', 'M = 1000 × (1,10)² = 1000 × 1,21 = 1210.'),
  ((select id from b_mat_ex), 3, 'Matemática Financeira',
   'Nos juros simples, os juros são calculados:',
   '{"A":"Sempre sobre o montante atualizado.","B":"Sobre o capital inicial.","C":"Somente no último período.","D":"Exclusivamente sobre os juros anteriores."}'::jsonb,
   'B', 'Nos juros simples a base de cálculo é sempre o capital inicial.'),
  ((select id from b_mat_ex), 4, 'Matemática Financeira',
   'Um capital de R$ 2.000 é aplicado a juros simples de 1,5% ao mês durante 6 meses. Qual é o valor dos juros?',
   '{"A":"R$ 120","B":"R$ 150","C":"R$ 180","D":"R$ 200"}'::jsonb,
   'C', 'J = 2000 × 0,015 × 6 = 180.'),

  ((select id from b_const_ex), 1, 'Constitucional',
   'O remédio constitucional destinado à proteção da liberdade de locomoção é:',
   '{"A":"Habeas data.","B":"Mandado de injunção.","C":"Habeas corpus.","D":"Ação popular."}'::jsonb,
   'C', 'Habeas corpus protege a liberdade de ir e vir.'),
  ((select id from b_const_ex), 2, 'Constitucional',
   'Para a realização de reunião pacífica em local aberto ao público, a Constituição exige:',
   '{"A":"Autorização judicial.","B":"Autorização do prefeito.","C":"Prévio aviso à autoridade competente.","D":"Autorização do Congresso Nacional."}'::jsonb,
   'C', 'A Constituição exige prévio aviso, não autorização.'),
  ((select id from b_const_ex), 3, 'Constitucional',
   'O remédio constitucional utilizado diante da falta de norma regulamentadora que inviabilize o exercício de direito constitucional é:',
   '{"A":"Mandado de segurança.","B":"Mandado de injunção.","C":"Habeas corpus.","D":"Ação popular."}'::jsonb,
   'B', 'O mandado de injunção combate a falta de norma regulamentadora.'),
  ((select id from b_const_ex), 4, 'Constitucional',
   'A entrada na casa de uma pessoa, sem consentimento do morador, por determinação judicial, é constitucionalmente permitida:',
   '{"A":"A qualquer hora do dia ou da noite.","B":"Somente durante o dia.","C":"Somente aos finais de semana.","D":"Nunca, mesmo com ordem judicial."}'::jsonb,
   'B', 'A determinação judicial só autoriza o ingresso durante o dia.'),

  ((select id from b_banc_ex), 1, 'Conhecimentos Bancários',
   'Uma característica típica do financiamento é:',
   '{"A":"Não possuir obrigação de pagamento.","B":"Estar geralmente vinculado à aquisição de um bem ou serviço.","C":"Ser sempre concedido sem análise de crédito.","D":"Não envolver juros ou encargos."}'::jsonb,
   'B', 'O financiamento costuma estar associado à compra de um bem ou serviço.'),
  ((select id from b_banc_ex), 2, 'Conhecimentos Bancários',
   'No crédito consignado, as parcelas são normalmente:',
   '{"A":"Descontadas diretamente da remuneração ou benefício, conforme as regras aplicáveis.","B":"Pagas exclusivamente em dinheiro.","C":"Descontadas somente quando o cliente deseja.","D":"Isentas de qualquer obrigação contratual."}'::jsonb,
   'A', 'É a característica central do consignado.'),
  ((select id from b_banc_ex), 3, 'Conhecimentos Bancários',
   'O cheque especial caracteriza-se como:',
   '{"A":"Depósito de poupança.","B":"Crédito vinculado à conta corrente.","C":"Financiamento exclusivamente imobiliário.","D":"Pagamento instantâneo sem custo."}'::jsonb,
   'B', 'Cheque especial é crédito vinculado à conta corrente, até um limite.'),
  ((select id from b_banc_ex), 4, 'Conhecimentos Bancários',
   'O Custo Efetivo Total (CET) permite:',
   '{"A":"Comparar o custo total de operações de crédito.","B":"Eliminar automaticamente todos os juros.","C":"Garantir que o cliente nunca terá inadimplência.","D":"Substituir a análise de crédito."}'::jsonb,
   'A', 'O CET reúne juros, tarifas, tributos e seguros, permitindo comparar propostas.'),

  ((select id from b_simulado), 1, 'Português',
   'Na frase "A candidata estava meio preocupada", a palavra "meio" é:',
   '{"A":"Adjetivo variável.","B":"Advérbio invariável.","C":"Numeral variável.","D":"Substantivo."}'::jsonb,
   'B', '"Meio" = "um pouco": advérbio invariável.'),
  ((select id from b_simulado), 2, 'Português',
   'Assinale a alternativa correta:',
   '{"A":"Menas pessoas compareceram.","B":"As declarações seguem anexo.","C":"Os documentos seguem anexos.","D":"A candidata estava meia cansada."}'::jsonb,
   'C', '"Anexos" concorda com "documentos". As demais erram "menas", "anexo" e "meia".'),
  ((select id from b_simulado), 3, 'Português',
   'A palavra "menos":',
   '{"A":"Varia em gênero.","B":"É sempre invariável.","C":"Varia apenas no plural.","D":"Concorda com o substantivo."}'::jsonb,
   'B', '"Menos" é invariável — não existe "menas".'),
  ((select id from b_simulado), 4, 'Matemática Financeira',
   'Um capital de R$ 2.000 aplicado a juros simples de 2% ao mês durante 3 meses gera juros de:',
   '{"A":"R$ 100","B":"R$ 120","C":"R$ 140","D":"R$ 160"}'::jsonb,
   'B', 'J = 2000 × 0,02 × 3 = 120.'),
  ((select id from b_simulado), 5, 'Matemática Financeira',
   'R$ 1.000 aplicados a juros compostos de 10% ao mês durante 2 meses resultam em:',
   '{"A":"R$ 1.200","B":"R$ 1.210","C":"R$ 1.220","D":"R$ 1.100"}'::jsonb,
   'B', 'M = 1000 × 1,21 = 1210.'),
  ((select id from b_simulado), 6, 'Matemática Financeira',
   'Nos juros simples, o cálculo dos juros utiliza:',
   '{"A":"O montante de cada período.","B":"Sempre o capital inicial.","C":"Somente o último período.","D":"Os juros acumulados como base."}'::jsonb,
   'B', 'Base de cálculo: sempre o capital inicial.'),
  ((select id from b_simulado), 7, 'Constitucional',
   'O habeas corpus protege:',
   '{"A":"O direito de propriedade exclusivamente.","B":"A liberdade de locomoção.","C":"O direito de corrigir dados pessoais.","D":"O direito de associação."}'::jsonb,
   'B', 'Habeas corpus protege a liberdade de locomoção.'),
  ((select id from b_simulado), 8, 'Constitucional',
   'A realização de reunião pacífica em local aberto ao público exige:',
   '{"A":"Autorização judicial.","B":"Autorização policial.","C":"Prévio aviso à autoridade competente.","D":"Autorização do Congresso."}'::jsonb,
   'C', 'Exige aviso prévio, não autorização.'),
  ((select id from b_simulado), 9, 'Constitucional',
   'A falta de norma regulamentadora que inviabilize direito constitucional pode justificar:',
   '{"A":"Habeas corpus.","B":"Mandado de injunção.","C":"Ação popular.","D":"Habeas data."}'::jsonb,
   'B', 'Mandado de injunção.'),
  ((select id from b_simulado), 10, 'Conhecimentos Bancários',
   'O crédito consignado caracteriza-se pelo:',
   '{"A":"Desconto das parcelas diretamente da remuneração ou benefício, conforme as regras aplicáveis.","B":"Uso exclusivo de dinheiro depositado em poupança.","C":"Pagamento obrigatório apenas em espécie.","D":"Ausência de contrato."}'::jsonb,
   'A', 'As parcelas são descontadas direto da remuneração ou benefício.'),
  ((select id from b_simulado), 11, 'Conhecimentos Bancários',
   'O cheque especial é:',
   '{"A":"Uma modalidade de poupança.","B":"Crédito vinculado à conta corrente.","C":"Um financiamento imobiliário.","D":"Um serviço de transferência instantânea."}'::jsonb,
   'B', 'É crédito vinculado à conta corrente.'),
  ((select id from b_simulado), 12, 'Conhecimentos Bancários',
   'O CET é importante porque:',
   '{"A":"Elimina o risco de crédito.","B":"Garante aprovação de empréstimos.","C":"Permite comparar o custo total das operações de crédito.","D":"Substitui o contrato bancário."}'::jsonb,
   'C', 'O CET reúne os custos da operação e permite comparar propostas.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
