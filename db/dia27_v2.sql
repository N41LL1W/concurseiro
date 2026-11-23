-- Cadastra o Dia 27 (4h: 55+55+55+55+20). Semana 6, dia 3.
delete from days where week = 6 and day_number = 3;

with d as (
  insert into days (week, day_number, title)
  values (6, 3, 'Regência verbal e nominal + equações do 1º grau + direitos sociais (arts. 6º e 7º) + produtos e serviços bancários')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Regência verbal e nominal: assistir, aspirar, visar, obedecer, preferir, informar, pagar/perdoar, chegar/ir', 40, $$O QUE É REGÊNCIA
Relação entre uma palavra e seu complemento — pode exigir ou não preposição. Regência verbal: relação entre o verbo e seus complementos. Regência nominal: relação entre um nome (substantivo, adjetivo ou advérbio) e seu complemento. Ex.: "O funcionário obedeceu às normas." — "obedecer" exige a preposição "a" (obedecer a alguém, obedecer a alguma coisa).

ASSISTIR
Sentido de ver/presenciar: exige "a" — "Assisti ao filme."; "Assisti à palestra."; "O candidato assistiu à aula." Sentido de prestar assistência: sem preposição — "O médico assistiu o paciente."; "A equipe assistiu os necessitados." Sentido de caber como direito: exige "a" — "Esse direito assiste ao trabalhador." Pegadinha: em provas tradicionais, "assistir o filme" (sentido de ver) é inadequado; o correto é "assistir ao filme".

ASPIRAR
Respirar/sorver: sem preposição — "Aspirou o ar."; "Aspirou a fumaça." Desejar/pretender: exige "a" — "Aspira ao cargo."; "Aspira a uma vaga no banco."

VISAR
Mirar: sem preposição ("Visou o alvo."). Dar visto: sem preposição ("O gerente visou o documento."). Ter como objetivo: em construções tradicionais, exige "a" — "O projeto visa ao crescimento."; "A medida visa à melhoria do atendimento." Em usos contemporâneos pode aparecer sem preposição, mas em provas de regência tradicional fique atento à forma com "a".

OBEDECER E DESOBEDECER
Exigem "a": "Obedecer às regras."; "Desobedecer ao regulamento."; "Os funcionários obedeceram às ordens."

PREFERIR
Construção tradicional: preferir uma coisa A outra. "Prefiro matemática a português."; "Prefiro estudar a sair."; "Prefiro o atendimento presencial ao atendimento remoto." Evite "Prefiro mais matemática do que português": na norma tradicional, "preferir" não leva "mais" nem "do que".

INFORMAR
Informar alguém DE/SOBRE algo, ou informar algo A alguém. "Informei o funcionário sobre o problema." / "Informei ao funcionário o problema." / "Informei o funcionário do problema."

PAGAR E PERDOAR
Complemento coisa: geralmente sem preposição ("Paguei a conta."; "Perdoei a dívida."). Complemento pessoa: com "a" ("Paguei ao funcionário."; "Perdoei ao amigo.").

CHEGAR E IR
Na norma-padrão, destino com "a": "Cheguei à agência."; "Fui ao banco."; "Chegamos à cidade." "Cheguei em casa" é comum na fala, mas provas tradicionais podem exigir "cheguei a casa", conforme o contexto.

REGÊNCIA NOMINAL
Acesso a (acesso ao sistema); obediência a (obediência às regras); necessidade de (necessidade de recursos); capacidade de (capacidade de resolver); interesse em (interesse em participar); favorável a (favorável à proposta); contrário a (contrário à decisão); compatível com (compatível com o cargo); responsável por (responsável pelo setor); orgulhoso de (orgulhoso do resultado); aptidão para (aptidão para o trabalho); dúvida sobre (dúvida sobre o procedimento).
Exemplos: "O funcionário tem acesso ao sistema."; "A equipe é favorável à mudança."; "O candidato está apto para o cargo."; "O servidor é responsável pela documentação."; "Tenho necessidade de estudar."

REGÊNCIA E CRASE
Se o verbo ou nome exige "a" e a palavra seguinte aceita artigo feminino "a", pode ocorrer crase. "O funcionário obedeceu à norma." (obedecer exige a; norma aceita a; a + a = à). "O candidato é favorável à contratação." (favorável exige a; contratação aceita a; ocorre crase).

PEGADINHAS
Assistir o filme → assistir ao filme. Aspirar o cargo → aspirar ao cargo. Obedecer as regras → obedecer às regras. Preferir mais uma coisa → preferir uma coisa a outra. Chegar na agência → chegar à agência. Visar o sucesso (objetivo) → visar ao sucesso.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — regência verbal e nominal (Q1 a Q4)', 15 from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Equações do 1º grau: básicas, X dos dois lados, parênteses e problemas (idade, dinheiro, consecutivos)', 40, $$O QUE É UMA EQUAÇÃO
Igualdade com um valor desconhecido, normalmente representado por uma letra. x + 5 = 12 → x = 12 − 5 → x = 7. Verificando: 7 + 5 = 12 (verdadeira).

REGRA FUNDAMENTAL
Ao realizar uma operação num lado da igualdade, mantenha a igualdade fazendo a operação correspondente. Na prática: o que está somando passa subtraindo; o que está subtraindo passa somando; o que está multiplicando passa dividindo; o que está dividindo passa multiplicando.
x + 8 = 20 → x = 12. x − 7 = 15 → x = 22. 4x = 28 → x = 7. x/5 = 9 → x = 45.

EQUAÇÕES COM DOIS TERMOS
3x + 5 = 20 → 3x = 15 → x = 5. 5x − 8 = 22 → 5x = 30 → x = 6.

X DOS DOIS LADOS
5x + 3 = 2x + 15 → 5x − 2x = 15 − 3 → 3x = 12 → x = 4. 7x − 4 = 3x + 20 → 4x = 24 → x = 6.

PARÊNTESES
Primeiro aplique a distributiva. 3(x + 4) = 24 → 3x + 12 = 24 → 3x = 12 → x = 4. 2(x − 5) = 18 → 2x − 10 = 18 → 2x = 28 → x = 14.

PROBLEMAS DE IDADE
João tem o dobro da idade de Pedro; juntos têm 36 anos. Pedro = x, João = 2x → x + 2x = 36 → 3x = 36 → x = 12. Pedro tem 12 anos e João, 24.

PROBLEMAS COM DINHEIRO
R$ 200, gasta R$ 65 e recebe R$ 40: 200 − 65 + 40 = R$ 175. Com equação: produto de R$ 80 que passou a custar R$ 60 — 80 − x = 60 → x = 20 (desconto de R$ 20).

NÚMEROS CONSECUTIVOS
Em sequência: se o primeiro é x, o segundo é x + 1 e o terceiro é x + 2. A soma de três consecutivos é 72: x + (x+1) + (x+2) = 72 → 3x + 3 = 72 → 3x = 69 → x = 23. Os números são 23, 24 e 25.

COMO INTERPRETAR OS PROBLEMAS
Soma/total: adição. Diferença: subtração. A mais: adição. A menos: subtração. Dobro: ×2. Triplo: ×3. Metade: ÷2. Terça parte: ÷3. Consecutivos: sequência. Produto: multiplicação.
Pegadinha: não monte a equação só olhando as palavras — leia o problema inteiro. "João tem 5 anos a mais que Pedro": se Pedro = x, João = x + 5 (e não o contrário).$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — equações do 1º grau (Q1 a Q4)', 15 from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Direitos sociais (art. 6º), direitos dos trabalhadores (art. 7º) e seguridade social', 40, $$Os direitos sociais são direitos fundamentais que buscam garantir condições dignas de vida à população, previstos principalmente no art. 6º.

ART. 6º — A LISTA (muito cobrada em questões diretas)
Educação, saúde, alimentação, trabalho, moradia, transporte, lazer, segurança, previdência social, proteção à maternidade e à infância, assistência aos desamparados. Texto: "São direitos sociais a educação, a saúde, a alimentação, o trabalho, a moradia, o transporte, o lazer, a segurança, a previdência social, a proteção à maternidade e à infância, a assistência aos desamparados, na forma desta Constituição."

FINALIDADE
Reduzir desigualdades e garantir condições básicas para uma vida digna. Educação: acesso conforme as disposições constitucionais. Saúde: direito de todos e dever do Estado (art. 196). Trabalho: salário mínimo, proteção contra despedida arbitrária, férias e outros direitos trabalhistas. Moradia: condições dignas de habitação. Transporte: reconhecido expressamente como direito social. Previdência social: proteção previdenciária nos termos constitucionais e legais. Assistência aos desamparados: proteção a pessoas em situação de vulnerabilidade, observadas as regras aplicáveis.

ART. 7º — DIREITOS DOS TRABALHADORES URBANOS E RURAIS
Salário mínimo: fixado em lei, nacionalmente unificado, capaz de atender às necessidades vitais básicas do trabalhador e de sua família, com reajustes periódicos para preservar o poder aquisitivo.
Jornada: normal não superior a 8 horas diárias e 44 semanais; compensação e redução nas condições constitucionais e legais.
Horas extras: remuneração superior à normal, com adicional de, no mínimo, 50%.
Férias: anuais remuneradas com pelo menos um terço a mais que o salário normal.
13º salário: com base na remuneração integral ou no valor da aposentadoria, conforme o caso.
FGTS: direito constitucional dos trabalhadores abrangidos.

O QUE AS BANCAS COBRAM
A lista dos direitos sociais; diferença entre direitos sociais e individuais; jornada; salário mínimo; férias; horas extras; proteção à maternidade; previdência e assistência social.

SEGURIDADE SOCIAL — SAÚDE × PREVIDÊNCIA × ASSISTÊNCIA
Saúde: direito de todos, não depende de contribuição previdenciária. Previdência Social: regime contributivo, observadas as regras constitucionais e legais. Assistência Social: destinada a quem dela necessitar, independentemente de contribuição à seguridade social.
Exemplos: atendimento no SUS → saúde. Quem contribuiu e busca aposentadoria → previdência. Família em vulnerabilidade que busca benefício assistencial, observados os requisitos legais → assistência. Essa diferença é muito importante nos concursos do INSS.

PEGADINHAS
Transporte é direito social expresso no art. 6º. Alimentação também. Previdência e assistência social não são a mesma coisa. Assistência não exige contribuição previdenciária. Saúde é direito de todos e dever do Estado. Jornada geral: até 8h diárias e 44h semanais. Adicional de horas extras: no mínimo 50%. Férias: adicional de pelo menos um terço.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — direitos sociais (Q1 a Q4)', 15 from d returning id
),
b_banc_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Conhecimentos Bancários', 'teoria', 'Conta corrente, salário e poupança, CDB, débito × crédito, rotativo, Pix × TED e portabilidades', 40, $$CONTA CORRENTE
Usada para movimentação financeira do dia a dia: depósitos, saques, transferências, pagamento de contas, Pix, débitos automáticos, cartões e, conforme o tipo de conta e os serviços contratados, recebimento de salário. Ex.: cliente recebe R$ 2.500 de salário e usa a conta para pagar aluguel, fazer Pix, pagar contas, comprar no cartão e sacar.

CONTA POUPANÇA
Modalidade tradicional de depósito para guardar recursos, com remuneração regulamentada, liquidez conforme as condições da modalidade e possibilidade de depósitos e saques. A remuneração segue regras próprias, ligadas à Selic: com a Selic acima de 8,5% ao ano, rende 0,5% ao mês + TR; com a Selic igual ou abaixo de 8,5% ao ano, rende 70% da Selic + TR (TR = Taxa Referencial). Atenção: as questões podem cobrar a regra, e não necessariamente o rendimento atual.

CONTA SALÁRIO
Usada para receber salários, aposentadorias, pensões e outros pagamentos ligados à remuneração, conforme as regras aplicáveis. Tem finalidade e funcionamento específicos, regras próprias de movimentação e serviços, e pode permitir portabilidade salarial conforme a regulamentação. Pegadinha: conta salário e conta corrente são diferentes.

DEPÓSITO BANCÁRIO
Operação em que o cliente entrega recursos à instituição financeira, conforme as características da operação. Depósito à vista: recursos disponíveis para movimentação (ex.: dinheiro em conta corrente). Depósito a prazo: aplicação por determinado período ou conforme condições de liquidez contratadas (ex.: CDB).

CDB — CERTIFICADO DE DEPÓSITO BANCÁRIO
Título emitido por instituições financeiras: o investidor empresta dinheiro à instituição e recebe remuneração conforme as condições contratadas. Prefixado: taxa conhecida na contratação (ex.: 10% ao ano). Pós-fixado: acompanha um indicador (ex.: 100% do CDI). Híbrido: combina indicador e taxa fixa (ex.: IPCA + 5% ao ano). Ao final, o investidor recebe o valor aplicado, os rendimentos conforme a contratação e eventuais descontos tributários. CDB não é conta corrente — é investimento.

CARTÃO DE DÉBITO
Paga com recursos disponíveis na conta: o valor é debitado da conta, conforme a autorização da operação, sem o mecanismo de crédito típico do cartão de crédito. Ex.: R$ 500 na conta e compra de R$ 80 no débito → saldo de R$ 420 (desconsiderando outras movimentações).

CARTÃO DE CRÉDITO
Compras com um limite concedido pela instituição; o cliente compra durante um período e depois recebe a fatura. Elementos: limite, fatura, data de vencimento, pagamento mínimo, parcelamento, juros, crédito rotativo. Ex.: limite de R$ 3.000 e compra de R$ 500 — a compra compromete parte do limite; após o pagamento da fatura, o limite pode ser recomposto conforme o processamento.

CRÉDITO ROTATIVO
Pode ocorrer quando o cliente não paga integralmente a fatura e usa a modalidade de financiamento disponibilizada, conforme as regras aplicáveis — normalmente com custo elevado. Ex.: fatura de R$ 1.000 e pagamento de R$ 300: o saldo restante pode ficar sujeito às condições de financiamento. Atenção: pagar o mínimo não faz o restante deixar de existir; o saldo precisa ser pago e pode gerar encargos.

PIX
Sistema de pagamentos instantâneos: transferências e pagamentos em poucos segundos, funcionando continuamente, inclusive fins de semana e feriados, conforme as regras do sistema. Usos: entre pessoas, entre empresas, em estabelecimentos, contas, transferências, QR Code. Chaves: CPF/CNPJ, telefone, e-mail, chave aleatória. O Pix é meio de pagamento — realizar um Pix não é contratar empréstimo.

TED
Transferência bancária entre instituições financeiras. Pix × TED: Pix é pagamento instantâneo, funciona continuamente e pode usar chave Pix; a TED é transferência tradicional, depende das regras e horários de processamento e usa dados bancários. Disponibilidade, horários e custos dependem das condições aplicáveis e da instituição.

DÉBITO AUTOMÁTICO
Permite que certas contas (energia, água, telefone, internet, mensalidades) sejam pagas automaticamente mediante autorização do cliente, conforme as regras e a disponibilidade de saldo.

PORTABILIDADES
Portabilidade salarial: o trabalhador pode solicitar a transferência dos recursos recebidos na conta salário para outra instituição, conforme a regulamentação. Portabilidade de crédito: permite transferir uma operação de crédito para outra instituição, conforme as regras vigentes, para buscar melhores condições, reduzir juros ou o custo total, ou alterar condições do contrato, considerando o CET e as condições contratuais.

PEGADINHAS
Conta salário ≠ conta corrente. Débito usa recursos disponíveis. Crédito envolve limite concedido. Pix é meio de pagamento, não empréstimo. CDB é investimento, não conta de movimentação. Rotativo pode gerar encargos. Portabilidade salarial ≠ portabilidade de crédito. TED e Pix são mecanismos diferentes. Poupança tem regras próprias de remuneração.$$
  from d returning id
),
b_banc_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Conhecimentos Bancários', 'exercicios', 'Fixação — produtos e serviços bancários (Q1 a Q4)', 15 from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 27 (12 questões)', 12,
    $$Sem consultar a teoria. 12 questões misturando regência, equações do 1º grau, direitos sociais e produtos bancários.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Caderno de erros, revisão programada e checklist do Dia 27', 8, $$CADERNO DE ERROS
Marque o que precisa reforçar: regência de assistir, aspirar e visar; regência de obedecer, preferir e informar; regência nominal e preposições; equações simples; equações com x dos dois lados; problemas de números consecutivos; art. 6º (direitos sociais); art. 7º (direitos dos trabalhadores); diferença entre saúde, previdência e assistência; conta corrente, conta salário e poupança; CDB; Pix, débito, crédito e portabilidade. Os erros nas questões de hoje entram automaticamente no caderno do app.

REVISÃO PROGRAMADA
Amanhã: revisar regência e resolver 5 questões. Em 3 dias: refazer as equações erradas. Em 7 dias: revisar direitos sociais e fazer 10 questões. Em 15 dias: revisar produtos bancários. Em 30 dias: revisão geral do Dia 27.

TÉCNICA PARA REVISAR
Não fique apenas relendo: 1) leia a pergunta; 2) tente responder sem consultar; 3) explique a resposta com suas próprias palavras; 4) confira a teoria; 5) se errou, refaça a questão no dia seguinte. Isso ajuda a consolidar o conhecimento.
Marque este bloco como concluído para fechar o Dia 27.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a alternativa correta quanto à regência verbal.',
   '{"A":"O candidato aspirava o cargo de escriturário.","B":"O candidato aspirava ao cargo de escriturário.","C":"O candidato aspirava no cargo de escriturário.","D":"O candidato aspirava pelo cargo de escriturário."}'::jsonb,
   'B', '"Aspirar", no sentido de desejar, exige a preposição "a": aspirava ao cargo.'),
  ((select id from b_port_ex), 2, 'Português',
   'Assinale a frase correta.',
   '{"A":"O funcionário obedeceu as normas.","B":"O funcionário obedeceu às normas.","C":"O funcionário obedeceu com as normas.","D":"O funcionário obedeceu pelas normas."}'::jsonb,
   'B', '"Obedecer" exige a preposição "a", que se une ao artigo: "às normas".'),
  ((select id from b_port_ex), 3, 'Português',
   'A regência está correta em:',
   '{"A":"Prefiro mais estudar do que sair.","B":"Prefiro estudar do que trabalhar.","C":"Prefiro estudar a sair.","D":"Prefiro estudar que sair."}'::jsonb,
   'C', 'Construção tradicional: preferir uma coisa A outra, sem "mais", "do que" ou "que".'),
  ((select id from b_port_ex), 4, 'Português',
   'Assinale a alternativa correta.',
   '{"A":"O gerente informou o cliente sobre a alteração.","B":"O gerente informou ao cliente sobre a alteração, obrigatoriamente sendo a única forma possível.","C":"O gerente informou com o cliente a alteração.","D":"O gerente informou para o cliente da alteração, sendo sempre a única forma correta."}'::jsonb,
   'A', '"Informar alguém sobre algo" é construção correta. B e D afirmam "única forma", o que é falso (há mais de uma construção correta), e C usa preposição inadequada.'),

  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Resolva: 3x + 7 = 28.',
   '{"A":"5","B":"6","C":"7","D":"8"}'::jsonb,
   'C', '3x = 21 → x = 7.'),
  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Resolva: 5x − 10 = 2x + 14.',
   '{"A":"6","B":"7","C":"8","D":"9"}'::jsonb,
   'C', '5x − 2x = 14 + 10 → 3x = 24 → x = 8.'),
  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'A soma de três números consecutivos é 81. O maior deles é:',
   '{"A":"26","B":"27","C":"28","D":"29"}'::jsonb,
   'C', 'x + (x+1) + (x+2) = 81 → 3x = 78 → x = 26. Os números são 26, 27 e 28; o maior é 28.'),
  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Uma pessoa possui o triplo da quantia de outra. Juntas, possuem R$ 160. Quanto possui a pessoa que tem a menor quantia?',
   '{"A":"R$ 30","B":"R$ 40","C":"R$ 50","D":"R$ 60"}'::jsonb,
   'B', 'x + 3x = 160 → 4x = 160 → x = 40.'),

  ((select id from b_const_ex), 1, 'Constitucional',
   'Assinale a alternativa que contém somente direitos sociais previstos no artigo 6º da Constituição Federal.',
   '{"A":"Educação, saúde, alimentação, trabalho e transporte.","B":"Propriedade, herança, liberdade religiosa e educação.","C":"Voto, nacionalidade, propriedade e saúde.","D":"Liberdade de expressão, reunião, transporte e propriedade."}'::jsonb,
   'A', 'Todos os itens de A constam do art. 6º. As demais misturam direitos individuais e políticos.'),
  ((select id from b_const_ex), 2, 'Constitucional',
   'A assistência social é destinada:',
   '{"A":"Exclusivamente aos trabalhadores que contribuíram por 15 anos.","B":"Apenas aos aposentados.","C":"A quem dela necessitar, independentemente de contribuição à seguridade social.","D":"Somente aos servidores públicos."}'::jsonb,
   'C', 'A assistência social independe de contribuição.'),
  ((select id from b_const_ex), 3, 'Constitucional',
   'A jornada normal de trabalho, conforme a regra constitucional geral, não deve ultrapassar:',
   '{"A":"6 horas diárias e 30 semanais em qualquer atividade.","B":"8 horas diárias e 44 horas semanais.","C":"10 horas diárias e 50 horas semanais.","D":"12 horas diárias e 60 horas semanais."}'::jsonb,
   'B', 'Art. 7º, XIII: até 8 horas diárias e 44 semanais.'),
  ((select id from b_const_ex), 4, 'Constitucional',
   'O adicional de remuneração das horas extras deve ser de, no mínimo:',
   '{"A":"10%.","B":"20%.","C":"30%.","D":"50%."}'::jsonb,
   'D', 'Art. 7º, XVI: adicional de, no mínimo, 50%.'),

  ((select id from b_banc_ex), 1, 'Conhecimentos Bancários',
   'A conta utilizada principalmente para recebimento de salário, com finalidade específica, é:',
   '{"A":"Conta investimento.","B":"Conta salário.","C":"Conta de crédito rotativo.","D":"Conta de financiamento."}'::jsonb,
   'B', 'A conta salário tem finalidade específica de recebimento de remuneração.'),
  ((select id from b_banc_ex), 2, 'Conhecimentos Bancários',
   'O CDB é:',
   '{"A":"Um cartão de crédito.","B":"Um empréstimo pessoal concedido ao consumidor.","C":"Um título emitido por instituição financeira utilizado como investimento.","D":"Uma modalidade de conta salário."}'::jsonb,
   'C', 'CDB é título de captação emitido por instituição financeira, usado como investimento.'),
  ((select id from b_banc_ex), 3, 'Conhecimentos Bancários',
   'O cartão de débito caracteriza-se principalmente por:',
   '{"A":"Utilizar recursos disponíveis na conta do cliente.","B":"Permitir compras sem qualquer limite.","C":"Ser sempre uma operação de empréstimo.","D":"Não movimentar a conta bancária."}'::jsonb,
   'A', 'O débito usa o saldo disponível na conta.'),
  ((select id from b_banc_ex), 4, 'Conhecimentos Bancários',
   'O Pix é:',
   '{"A":"Um investimento de renda fixa.","B":"Uma modalidade de financiamento imobiliário.","C":"Um sistema de pagamentos instantâneos.","D":"Uma conta bancária exclusiva para empresas."}'::jsonb,
   'C', 'Pix é meio de pagamento instantâneo.'),

  ((select id from b_simulado), 1, 'Português',
   'Assinale a alternativa correta quanto à regência.',
   '{"A":"O candidato aspirava o cargo.","B":"O candidato aspirava ao cargo.","C":"O candidato aspirava pelo cargo.","D":"O candidato aspirava no cargo."}'::jsonb,
   'B', '"Aspirar ao cargo" (desejar).'),
  ((select id from b_simulado), 2, 'Português',
   'Assinale a alternativa com regência correta.',
   '{"A":"Assistimos o filme ontem.","B":"Obedecemos as regras.","C":"Prefiro estudar a sair.","D":"Cheguei na agência, conforme exige a norma-padrão tradicional."}'::jsonb,
   'C', 'A construção tradicional é "preferir uma coisa a outra". As demais erram assistir (sentido de ver), obedecer e chegar.'),
  ((select id from b_simulado), 3, 'Português',
   'A expressão "favorável à proposta" apresenta crase porque:',
   '{"A":"Toda palavra feminina recebe crase.","B":"O nome favorável exige a preposição A e proposta aceita o artigo A.","C":"Existe somente artigo.","D":"A palavra proposta é masculina."}'::jsonb,
   'B', 'Preposição "a" (exigida por "favorável") + artigo "a" (de "proposta") = à.'),
  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Resolva: 4x + 8 = 32.',
   '{"A":"4","B":"5","C":"6","D":"8"}'::jsonb,
   'C', '4x = 24 → x = 6.'),
  ((select id from b_simulado), 5, 'Matemática/RLM',
   'Resolva: 7x − 5 = 3x + 19.',
   '{"A":"4","B":"5","C":"6","D":"7"}'::jsonb,
   'C', '7x − 3x = 19 + 5 → 4x = 24 → x = 6.'),
  ((select id from b_simulado), 6, 'Matemática/RLM',
   'A soma de três números consecutivos é 48. O número do meio é:',
   '{"A":"14","B":"15","C":"16","D":"17"}'::jsonb,
   'C', '3x + 3 = 48 → x = 15; os números são 15, 16 e 17. O do meio é 16.'),
  ((select id from b_simulado), 7, 'Constitucional',
   'Qual alternativa contém um direito social previsto no artigo 6º?',
   '{"A":"Herança","B":"Transporte","C":"Liberdade de associação","D":"Direito de petição"}'::jsonb,
   'B', 'Transporte é direito social expresso no art. 6º.'),
  ((select id from b_simulado), 8, 'Constitucional',
   'A assistência social:',
   '{"A":"Depende sempre de contribuição previdenciária.","B":"É exclusiva dos trabalhadores formais.","C":"É destinada a quem dela necessitar, independentemente de contribuição.","D":"É exclusiva dos aposentados."}'::jsonb,
   'C', 'Assistência social independe de contribuição.'),
  ((select id from b_simulado), 9, 'Constitucional',
   'A jornada constitucional geral é de até:',
   '{"A":"8 horas diárias e 44 semanais.","B":"10 horas diárias e 50 semanais.","C":"6 horas diárias e 36 semanais para todos.","D":"12 horas diárias e 60 semanais."}'::jsonb,
   'A', 'Regra geral: 8h diárias e 44h semanais.'),
  ((select id from b_simulado), 10, 'Conhecimentos Bancários',
   'O CDB é:',
   '{"A":"Um meio de pagamento instantâneo.","B":"Um título emitido por instituição financeira.","C":"Uma conta salário.","D":"Um cartão de débito."}'::jsonb,
   'B', 'CDB é título emitido por instituição financeira.'),
  ((select id from b_simulado), 11, 'Conhecimentos Bancários',
   'A principal característica do cartão de débito é:',
   '{"A":"Utilizar limite de crédito concedido.","B":"Utilizar os recursos disponíveis na conta.","C":"Financiar automaticamente todas as compras.","D":"Não movimentar o saldo bancário."}'::jsonb,
   'B', 'O débito usa o saldo disponível na conta.'),
  ((select id from b_simulado), 12, 'Conhecimentos Bancários',
   'O Pix é:',
   '{"A":"Uma modalidade de investimento.","B":"Uma forma exclusiva de pagamento de salários.","C":"Um sistema de pagamentos instantâneos.","D":"Um empréstimo automático."}'::jsonb,
   'C', 'Pix é um sistema de pagamentos instantâneos.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
