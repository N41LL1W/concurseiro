-- Cadastra o Dia 19 (versão completa e robusta).
delete from days where week = 4 and day_number = 5;

with d as (
  insert into days (week, day_number, title)
  values (4, 5, 'Regência verbal/nominal e crase + razão/proporção/regra de três + direitos sociais/trabalhadores (arts. 6º-7º) + Sistema Financeiro Nacional')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Regência verbal/nominal e crase: regras, locuções e método de resolução', 30, $$REGÊNCIA VERBAL
Assistir (ver) → "a": "Assisti ao filme." Assistir (prestar assistência) → sem preposição: "O médico assistiu o paciente." Aspirar (desejar) → "a": "Aspiro ao cargo público." Aspirar (respirar) → sem preposição: "Aspirou o ar puro." Obedecer/Desobedecer → sempre "a": "Obedeceu à norma."; "Desobedeceu à ordem." Preferir → "preferir uma coisa A outra": "Prefiro estudar a improvisar." Gostar → "de": "Gosto de Português." Precisar (necessitar) → "de": "Preciso de orientação." Chegar (norma tradicional) → "a": "Cheguei ao banco cedo" (não "no banco").
"PREFERIR": evite, em questões formais, "prefiro mais... do que" — a construção tradicional já expressa escolha sem precisar do reforço "mais".

REGÊNCIA NOMINAL
Favorável a, contrário a, compatível com, responsável por, necessidade de, respeito a, apto a/para (conforme construção), consciente de, próximo de/a (conforme contexto). Ex.: "A decisão foi favorável ao candidato."; "O servidor é responsável pelo setor."; "Há necessidade de documentos."; "O equipamento é compatível com o sistema."

CRASE
Fusão de dois sons "a" iguais — geralmente a preposição "a" exigida por uma palavra com o artigo feminino "a"/"as". Ex.: "dirigir-se a" + "a agência" = "dirigiu-se à agência." Teste prático: troque pela palavra masculina equivalente — se aparecer "ao", há indício forte de crase no feminino ("Vou à agência" → "Vou ao banco").

QUANDO OCORRE CRASE
a) Substantivo feminino que admite artigo, com regência que exige "a": "Entreguei o documento à funcionária."; "Compareceu à prova."; "Obedeceu à regra."
b) Locuções femininas: à tarde, à noite, às vezes, à direita, à medida que, à disposição.
c) Horas determinadas: "A prova começa às 8 horas." Mas "daqui a duas horas" (tempo futuro) não leva crase.
d) Antes de "aquele(a)/aquilo" quando a regência exige a preposição: "Refiro-me àquela norma."

QUANDO NÃO OCORRE CRASE
a) Antes de verbo: "Começou a estudar." b) Antes de substantivo masculino: "Pagamento a prazo." c) Antes de pronomes que não admitem artigo: "Entreguei o formulário a ela." d) Entre palavras repetidas: "frente a frente", "cara a cara." e) Antes de artigo indefinido: "Dirigiu-se a uma agência."

CRASE FACULTATIVA
Antes de pronome possessivo feminino singular: "Entreguei o documento a minha chefe." / "...à minha chefe." Depois de "até": "Fui até a agência." / "Fui até à agência." A possibilidade depende da construção — em questões objetivas, observe a frase exata.

MÉTODO DE RESOLUÇÃO
1) A palavra antes exige a preposição "a"? 2) A palavra seguinte admite artigo feminino "a"? 3) Se as duas respostas forem sim, há crase. 4) Se a seguinte for verbo ou não admitir artigo nessa construção, normalmente não há crase. Ex.: "O funcionário entregou o relatório ___ diretora." → entregar admite "a alguém"; "diretora" admite "a" → "entregou o relatório à diretora."$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — regência e crase (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Razão, proporção, regra de três (direta/inversa/composta), divisão proporcional e escalas', 35, $$RAZÃO
Comparação entre duas quantidades por divisão. Turma com 12 homens e 18 mulheres → razão homens/mulheres = 12/18 = 2/3. A ordem importa: mulheres/homens = 18/12 = 3/2.

PROPORÇÃO
Igualdade entre razões: a/b = c/d → a×d = b×c (denominadores ≠ 0). Ex.: 3/5 = x/20 → 5x=60 → x=12.

REGRA DE TRÊS DIRETA
Grandezas aumentam/diminuem na mesma proporção. Ex.: 3 cadernos custam R$24; quanto custam 5? 3/5 = 24/x → 3x=120 → x=40.

REGRA DE TRÊS INVERSA
Uma aumenta, a outra diminui na mesma proporção. Ex.: 4 trabalhadores concluem serviço em 12 dias; 6 trabalhadores? Mais trabalhadores → menos dias: inversa. 4×12=6×x → 48=6x → x=8. Pegadinha: não use regra direta só porque há dois números em cada coluna — pense primeiro no que acontece com uma grandeza quando a outra aumenta.

REGRA DE TRÊS COMPOSTA
Envolve três ou mais grandezas. Ex.: 4 funcionários processam 120 documentos em 3h. Quantos 6 funcionários processam em 5h (mesma produtividade)? x = 120 × (6/4) × (5/3) = 120×1,5×5/3 = 300 documentos.

DIVISÃO PROPORCIONAL
Ex.: dividir R$600 na razão 2:3. Soma das partes: 2+3=5. Cada parte: 600/5=120. Primeira: 2×120=240. Segunda: 3×120=360. Confira: 240+360=600.

ESCALAS
Compara medida no desenho com a medida real, mesmas unidades. Escala 1:100.000 → 1 cm no mapa = 100.000 cm reais = 1 km real. 4 cm no mapa = 4 km reais. Converta as unidades antes de calcular.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — razão, proporção e regra de três (Q1 a Q4)', 15
  from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Art. 6º (direitos sociais) e art. 7º (direitos dos trabalhadores): jornada, férias, licença, adicional noturno', 30, $$ART. 6º — DIREITOS SOCIAIS
Direitos fundamentais ligados a condições dignas de vida e redução de desigualdades: educação, saúde, alimentação, trabalho, moradia, transporte, lazer, segurança, previdência social, proteção à maternidade e à infância, assistência aos desamparados.
Macete: necessidades básicas para viver com dignidade. Pegadinha: direitos sociais não se resumem a direitos trabalhistas — educação, saúde, moradia e transporte também são do art. 6º.

ART. 7º — DIREITOS DOS TRABALHADORES URBANOS E RURAIS
Salário mínimo (fixado em lei, nacional, com garantias constitucionais). Irredutibilidade salarial (ressalvado o disposto em convenção/acordo coletivo). Décimo terceiro salário. Jornada normal: até 8h diárias e 44h semanais (compensação/redução admitidas por acordo/convenção coletiva). Repouso semanal remunerado, preferencialmente aos domingos. Férias anuais remuneradas com pelo menos um terço a mais que o salário normal. Licença à gestante de 120 dias, sem prejuízo do emprego e do salário. Licença-paternidade nos termos da lei. Adicional noturno (remuneração superior à do trabalho diurno). Prescrição trabalhista com regras específicas.

JORNADA DE TRABALHO
Regra geral: até 8h diárias e 44h semanais (art. 7º, XIII) — não é 40h semanais "em todos os casos"; isso é erro comum em prova. Existem regimes especiais para certas categorias, mas a regra geral é 8h/44h.

FÉRIAS E ADICIONAL CONSTITUCIONAL
Pelo menos um terço a mais que o salário normal. Ex. ilustrativo: remuneração de R$3.000 → adicional = 3000÷3=1000; total ilustrativo = 3000+1000=4000 (antes de descontos e ajustes reais).

LICENÇA À GESTANTE
120 dias, sem prejuízo do emprego e do salário (art. 7º, XVIII) — garantia constitucional expressa, diferente da licença-paternidade (disciplina própria).

ADICIONAL NOTURNO
Trabalho noturno deve ter remuneração superior à do diurno — a definição de horário noturno e o cálculo dependem da legislação aplicável.

IRREDUTIBILIDADE SALARIAL
O salário não pode ser reduzido, ressalvada a hipótese de convenção ou acordo coletivo prevista no próprio texto constitucional — não significa que o salário jamais sofrerá qualquer alteração de valor real ou composição; depende da natureza da verba e das normas trabalhistas.

DISTINÇÃO ENTRE OS ARTIGOS
Art. 5º: direitos e garantias individuais e coletivos (liberdade, igualdade, instrumentos de proteção). Art. 6º: direitos sociais em geral. Art. 7º: direitos específicos dos trabalhadores urbanos e rurais.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — direitos sociais e trabalhistas (Q1 a Q4)', 15
  from d returning id
),
b_banc_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Conhecimentos Bancários', 'teoria', 'Sistema Financeiro Nacional: CMN, Banco Central, CVM, Susep, Previc e operadores', 25, $$O QUE É O SFN
Conjunto de instituições e órgãos que viabilizam a intermediação financeira e o funcionamento dos mercados financeiro, de crédito, de capitais, de câmbio e de seguros, conforme suas competências. Participantes: órgãos normativos, entidades supervisoras, instituições financeiras e outros operadores.

ÓRGÃOS NORMATIVOS (diretrizes e normas gerais)
Conselho Monetário Nacional (CMN): órgão normativo superior do SFN — formula diretrizes gerais da política da moeda e do crédito. Palavra-chave: diretrizes e normas gerais.
Conselho Nacional de Seguros Privados (CNSP): diretrizes e normas da política de seguros privados, capitalização e áreas correlatas. Palavra-chave: seguros privados.
Conselho Nacional de Previdência Complementar (CNPC): diretrizes e normas do regime de previdência complementar FECHADA. Palavra-chave: previdência complementar fechada.

ENTIDADES SUPERVISORAS (fiscalizam e acompanham)
Banco Central do Brasil (BCB): executa a política monetária, supervisiona instituições financeiras sob sua competência, emite moeda (condições constitucionais/legais), zela pelo funcionamento do sistema financeiro. Associe o BCB à supervisão bancária e à execução das diretrizes do CMN.
Comissão de Valores Mobiliários (CVM): fiscaliza e desenvolve o mercado de valores mobiliários (ações, companhias abertas, fundos de investimento).
Superintendência de Seguros Privados (Susep): supervisiona seguros, previdência complementar aberta, capitalização e resseguro.
Superintendência Nacional de Previdência Complementar (Previc): fiscaliza e supervisiona entidades FECHADAS de previdência complementar (fundos de pensão).

ESQUEMA PARA MEMORIZAR
Normativos: CMN · CNSP · CNPC. Supervisoras: BCB · CVM · Susep · Previc. Operadores: bancos, corretoras, seguradoras e demais participantes regulados/autorizados.

CMN × BANCO CENTRAL × CVM — diferença essencial
CMN: diretrizes e normas gerais. Banco Central: executa política monetária e supervisiona instituições sob sua competência. CVM: fiscaliza e regula o mercado de valores mobiliários. Pegadinha: dizer que a CVM supervisiona todos os bancos comerciais está errado — a supervisão bancária é atribuição principal do Banco Central.

INSTITUIÇÕES FINANCEIRAS E OPERADORES
Bancos comerciais: captam depósitos à vista e concedem crédito. Bancos múltiplos: operam em diferentes carteiras autorizadas. Cooperativas de crédito: prestam serviços financeiros a seus associados. Corretoras e distribuidoras: atuam no mercado de capitais, sob supervisão correspondente. CAIXA Econômica Federal: instituição financeira pública federal, também agente de políticas públicas. Banco do Brasil: sociedade de economia mista federal, também agente financeiro do Governo Federal.

Conhecimentos Bancários varia por edital — este é a base do SFN; dependendo do concurso, aprofunde produtos bancários, crédito, mercado de capitais, PLD, sigilo bancário e legislação específica.$$
  from d returning id
),
b_banc_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Conhecimentos Bancários', 'exercicios', 'Fixação — SFN (Q1 a Q4)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 19, 5 alternativas por questão (Q17 a Q28)', 40,
    $$Sem consulta. 12 questões, 5 alternativas cada, misturando regência/crase, razão/proporção/regra de três, direitos sociais/trabalhistas e Sistema Financeiro Nacional.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Caderno de erros, revisão programada e checklist do Dia 19', 20, $$CADERNO DE ERROS
Qual matéria exigiu mais esforço hoje: Português (regência e crase), Matemática (razão/proporção/regra de três), Constitucional (direitos sociais e trabalhistas) ou Conhecimentos Bancários (SFN)? Registre as questões erradas e explique a regra correta com suas próprias palavras. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app.

REVISÃO PROGRAMADA
Amanhã (10–15 min): revise regência e crase, resolva duas questões de regra de três e memorize a diferença entre CMN, Banco Central e CVM.
Daqui a 7 dias: refaça as questões erradas dos Dias 18 e 19, sem consultar as respostas.
Daqui a 30 dias: simulado misto com Português, Matemática, Direito e Conhecimentos Bancários.
(O app já agenda isso sozinho via o caderno de erros — 24h, 7 dias e 30 dias, visíveis no Painel.)

Marque este bloco como concluído para fechar o Dia 19.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a frase correta segundo a regência verbal tradicional.',
   '{"A":"Assisti o filme ontem.","B":"Obedeci a regra do edital.","C":"Aspiro ao cargo de escrevente.","D":"Prefiro mais Português do que Matemática."}'::jsonb,
   'C', '"Aspirar", sentido de desejar, exige "a": "aspiro ao cargo". As demais erram "assistir" (sentido de ver, exige "a"), "obedecer" (exige "à") e "preferir" (sem "mais... do que").'),

  ((select id from b_port_ex), 2, 'Português',
   'Complete corretamente: "O candidato dirigiu-se ___ agência bancária."',
   '{"A":"a","B":"à","C":"há","D":"á"}'::jsonb,
   'B', '"Dirigir-se a" + "a agência" (feminina) = "à agência".'),

  ((select id from b_port_ex), 3, 'Português',
   'Em qual alternativa a crase está empregada corretamente?',
   '{"A":"Começou à estudar cedo.","B":"Entregou o documento à ela.","C":"O atendimento começa às 9 horas.","D":"Foi à pé até o trabalho."}'::jsonb,
   'C', 'Indicação de hora determinada com "horas" no feminino plural — crase correta. As demais erram: antes de verbo, antes de pronome pessoal e "a pé" (sem crase).'),

  ((select id from b_port_ex), 4, 'Português',
   'Complete: "O servidor demonstrou respeito ___ normas do órgão."',
   '{"A":"as","B":"às","C":"há","D":"a"}'::jsonb,
   'B', '"Respeito a" + "as normas" (feminino plural) = "às normas".'),

  -- Matemática — fixação (Q1-4)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'A razão entre 8 e 12, na forma simplificada, é:',
   '{"A":"2/3","B":"3/2","C":"4/3","D":"1/2"}'::jsonb,
   'A', '8/12 simplifica dividindo por 4: 2/3.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Se 5 produtos iguais custam R$ 75, quanto custam 8 produtos?',
   '{"A":"R$ 100","B":"R$ 110","C":"R$ 120","D":"R$ 125"}'::jsonb,
   'C', 'Preço unitário: 75/5=15. Para 8 produtos: 8×15=120.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Oito trabalhadores realizam um serviço em 15 dias. Mantida a mesma produtividade, 12 trabalhadores levariam:',
   '{"A":"20 dias","B":"12 dias","C":"10 dias","D":"8 dias"}'::jsonb,
   'C', 'Regra de três inversa: 8×15=12×x → 120=12x → x=10.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Uma quantia de R$ 900 é dividida na razão 2:3. A menor parte vale:',
   '{"A":"R$ 180","B":"R$ 300","C":"R$ 360","D":"R$ 540"}'::jsonb,
   'C', 'Soma das partes: 2+3=5. Cada parte: 900/5=180. Menor parte (2): 2×180=360.'),

  -- Constitucional — fixação (Q1-4)
  ((select id from b_const_ex), 1, 'Constitucional',
   'Qual alternativa apresenta um direito social expressamente previsto no artigo 6º da Constituição?',
   '{"A":"Apenas o direito de propriedade","B":"Moradia","C":"Somente o direito de voto","D":"Exclusivamente a liberdade de expressão"}'::jsonb,
   'B', 'Moradia é direito social expresso no art. 6º. As demais tratam de outros artigos ou são afirmações exclusivas incorretas.'),

  ((select id from b_const_ex), 2, 'Constitucional',
   'A regra constitucional geral de jornada normal de trabalho é de até:',
   '{"A":"6 horas diárias e 30 semanais em todos os casos","B":"8 horas diárias e 44 semanais","C":"10 horas diárias e 50 semanais","D":"8 horas diárias e 40 semanais em todos os casos"}'::jsonb,
   'B', 'Art. 7º, XIII: até 8 horas diárias e 44 semanais.'),

  ((select id from b_const_ex), 3, 'Constitucional',
   'Segundo a Constituição, as férias anuais remuneradas devem ter, pelo menos:',
   '{"A":"Um décimo a mais que o salário normal","B":"Metade a mais que o salário normal","C":"Um terço a mais que o salário normal","D":"O dobro do salário normal em qualquer hipótese"}'::jsonb,
   'C', 'O adicional constitucional de férias é de pelo menos um terço a mais que o salário normal.'),

  ((select id from b_const_ex), 4, 'Constitucional',
   'A Constituição garante à gestante licença de:',
   '{"A":"30 dias","B":"60 dias","C":"90 dias","D":"120 dias"}'::jsonb,
   'D', 'Art. 7º, XVIII: licença à gestante de 120 dias, sem prejuízo do emprego e do salário.'),

  -- Conhecimentos Bancários — fixação (Q1-4)
  ((select id from b_banc_ex), 1, 'Conhecimentos Bancários',
   'Qual órgão estabelece diretrizes gerais da política da moeda e do crédito no âmbito de suas competências?',
   '{"A":"CVM","B":"CMN","C":"Previc","D":"Susep"}'::jsonb,
   'B', 'CMN é o órgão normativo superior do SFN para política da moeda e do crédito.'),

  ((select id from b_banc_ex), 2, 'Conhecimentos Bancários',
   'A supervisão das instituições financeiras bancárias é atribuída principalmente ao:',
   '{"A":"Banco Central do Brasil","B":"Conselho Nacional de Previdência Complementar","C":"Ministério Público","D":"Conselho Nacional de Seguros Privados"}'::jsonb,
   'A', 'O Banco Central supervisiona as instituições financeiras sob sua competência, incluindo bancos.'),

  ((select id from b_banc_ex), 3, 'Conhecimentos Bancários',
   'Qual entidade atua na fiscalização do mercado de valores mobiliários, como o mercado de ações?',
   '{"A":"Previc","B":"CNSP","C":"CVM","D":"CNPC"}'::jsonb,
   'C', 'CVM fiscaliza e desenvolve o mercado de valores mobiliários.'),

  ((select id from b_banc_ex), 4, 'Conhecimentos Bancários',
   'A Previc está relacionada principalmente à supervisão de:',
   '{"A":"Mercado de ações","B":"Bancos comerciais em geral","C":"Seguros de automóveis","D":"Entidades fechadas de previdência complementar"}'::jsonb,
   'D', 'Previc fiscaliza e supervisiona as entidades fechadas de previdência complementar (fundos de pensão).'),

  -- Mini-simulado (Q17-28, 5 alternativas)
  ((select id from b_simulado), 1, 'Português',
   'Assinale a alternativa correta quanto à regência verbal.',
   '{"A":"Assisti o filme ontem.","B":"Prefiro mais estudar do que descansar.","C":"O candidato aspirava ao cargo público.","D":"Obedeci a norma do edital, sem artigo.","E":"Cheguei no banco, conforme a regência tradicional cobrada em provas."}'::jsonb,
   'C', '"Aspirava ao cargo" segue a regência tradicional de desejar. As demais erram assistir, preferir, obedecer e chegar.'),

  ((select id from b_simulado), 2, 'Português',
   'Complete: "O servidor compareceu ___ reunião marcada para ___ 14 horas."',
   '{"A":"a — as","B":"à — às","C":"à — as","D":"a — às","E":"há — às"}'::jsonb,
   'B', '"Compareceu à reunião" (crase) e "para às 14 horas" (hora determinada, crase).'),

  ((select id from b_simulado), 3, 'Matemática/RLM',
   'Se 6 cadernos custam R$ 42, quanto custam 10 cadernos iguais?',
   '{"A":"R$ 60","B":"R$ 65","C":"R$ 70","D":"R$ 72","E":"R$ 75"}'::jsonb,
   'C', 'Preço unitário: 42/6=7. Para 10 cadernos: 10×7=70.'),

  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Doze trabalhadores concluem um serviço em 10 dias. Mantida a mesma produtividade, 6 trabalhadores levariam:',
   '{"A":"5 dias","B":"10 dias","C":"15 dias","D":"20 dias","E":"24 dias"}'::jsonb,
   'D', 'Regra de três inversa: 12×10=6×x → 120=6x → x=20.'),

  ((select id from b_simulado), 5, 'Constitucional',
   'Qual alternativa apresenta um direito social expressamente previsto no artigo 6º da Constituição?',
   '{"A":"Moradia","B":"Somente a liberdade de imprensa","C":"Exclusivamente o direito de voto","D":"Apenas o direito de propriedade","E":"Somente a liberdade de associação"}'::jsonb,
   'A', 'Moradia é direito social do art. 6º.'),

  ((select id from b_simulado), 6, 'Constitucional',
   'A regra constitucional geral de jornada normal é de até:',
   '{"A":"6 horas diárias e 30 semanais para todos","B":"8 horas diárias e 44 semanais","C":"8 horas diárias e 48 semanais","D":"10 horas diárias e 44 semanais","E":"12 horas diárias e 60 semanais"}'::jsonb,
   'B', 'Art. 7º, XIII: 8 horas diárias e 44 semanais.'),

  ((select id from b_simulado), 7, 'Conhecimentos Bancários',
   'Qual órgão do Sistema Financeiro Nacional estabelece diretrizes gerais da política da moeda e do crédito?',
   '{"A":"CVM","B":"Previc","C":"CMN","D":"Susep","E":"CAIXA"}'::jsonb,
   'C', 'CMN é o órgão normativo superior do SFN.'),

  ((select id from b_simulado), 8, 'Conhecimentos Bancários',
   'A entidade que fiscaliza o mercado de valores mobiliários é a:',
   '{"A":"Previc","B":"CNSP","C":"CNPC","D":"CVM","E":"Secretaria da Receita Federal"}'::jsonb,
   'D', 'CVM fiscaliza o mercado de valores mobiliários.'),

  ((select id from b_simulado), 9, 'Matemática/RLM',
   'A razão entre 15 e 25, simplificada, é:',
   '{"A":"5/3","B":"3/5","C":"2/5","D":"5/2","E":"3/2"}'::jsonb,
   'B', '15/25 simplifica dividindo por 5: 3/5.'),

  ((select id from b_simulado), 10, 'Português',
   'Qual alternativa apresenta uma situação em que a crase está correta?',
   '{"A":"Começou à trabalhar cedo.","B":"Entregou a carta à ela.","C":"Foi à pé para a agência.","D":"O candidato chegou à uma conclusão.","E":"A reunião ocorrerá às 10 horas."}'::jsonb,
   'E', 'Hora determinada, feminino plural — crase correta. As demais erram: antes de verbo, pronome pessoal, "a pé" e antes de artigo indefinido.'),

  ((select id from b_simulado), 11, 'Constitucional',
   'O adicional constitucional de férias corresponde a, pelo menos:',
   '{"A":"Um décimo do salário normal","B":"Um quinto do salário normal","C":"Um terço do salário normal","D":"Metade do salário normal","E":"Um salário inteiro adicional em todos os casos"}'::jsonb,
   'C', 'O adicional mínimo de férias é de um terço do salário normal.'),

  ((select id from b_simulado), 12, 'Conhecimentos Bancários',
   'Qual afirmação sobre a CAIXA Econômica Federal e o Banco do Brasil é correta?',
   '{"A":"Ambos são órgãos normativos do SFN","B":"Ambos são entidades supervisoras equivalentes ao Banco Central","C":"A CAIXA é a CVM e o Banco do Brasil é a Previc","D":"São instituições financeiras que também desempenham funções relacionadas a políticas públicas, conforme suas atribuições","E":"Ambos são conselhos responsáveis por editar todas as normas bancárias"}'::jsonb,
   'D', 'CAIXA (empresa pública) e Banco do Brasil (sociedade de economia mista) são instituições financeiras que também atuam em políticas públicas — não são órgãos normativos nem supervisores.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
