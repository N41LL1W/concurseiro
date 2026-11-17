-- Cadastra o Dia 23. Carga: 4h20 (50+50+50+40+50+20), conforme o cronograma do dia.
delete from days where week = 5 and day_number = 4;

with d as (
  insert into days (week, day_number, title)
  values (5, 4, 'Interpretação e inferência + análise combinatória + princípios da Administração (LIMPE) + produtos e serviços bancários')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Interpretação de textos: compreensão, inferência, pressupostos, conectivos', 35, $$Muitas questões não exigem gramática avançada, e sim a capacidade de compreender exatamente o que o texto afirma.

COMPREENSÃO × INTERPRETAÇÃO
Compreensão: identificar informações expressamente apresentadas. Interpretação: compreender sentidos implícitos, intenções, conclusões e relações entre ideias.
Ex.: "Após a implantação do atendimento digital, o número de pessoas que procuraram as agências diminuiu. Apesar disso, os atendimentos presenciais continuaram necessários para determinados serviços." Compreensão: o que aconteceu após o atendimento digital? O número de pessoas nas agências diminuiu. Interpretação: pode-se concluir que o atendimento presencial foi eliminado? Não — o texto diz que continua necessário para certos serviços.
Atenção: uma alternativa pode parecer lógica no mundo real e estar errada por não ser sustentada pelo texto.

ASSUNTO, TEMA E IDEIA PRINCIPAL
Assunto: tema geral. Tema: campo central do texto. Ideia principal: o que o autor pretende comunicar sobre o tema — costuma ser mais específica que o assunto.
Ex.: "A tecnologia bancária facilitou pagamentos e transferências. Entretanto, a inclusão digital exige que os bancos ofereçam orientação e alternativas a quem tem dificuldade com ferramentas digitais." Assunto: tecnologia bancária. Ideia principal: a tecnologia facilita operações, mas deve vir acompanhada de medidas de inclusão digital.

EXPLÍCITO × IMPLÍCITO
Explícito: diretamente escrito ("O candidato chegou às 12h30"). Implícito: deduzido com segurança. Ex.: "O candidato chegou às 12h30, conferiu o documento e aguardou a abertura dos portões." Dá para inferir que se preparava para entrar na prova; não dá para afirmar que estava nervoso ou que estudou a manhã toda.
Regra de ouro: inferência não é adivinhação — a conclusão precisa estar apoiada em elementos do texto.

INFERÊNCIA E PRESSUPOSTOS
"Mariana voltou a estudar" → pressupõe que já estudara antes. "Pedro deixou de utilizar o transporte público" → utilizava antes. Palavras que indicam pressuposto: voltou, deixou de, novamente, ainda, já, também, passou a.

SENTIDO LITERAL × FIGURADO
Literal: "O funcionário abriu a porta da agência." Figurado: "A notícia abriu portas para novas oportunidades" — significa criar oportunidades, não abrir uma porta física.

CONECTIVOS
mas/porém/contudo/entretanto = oposição. portanto/logo = conclusão. porque/pois = causa ou explicação. embora/ainda que = concessão. se/caso = condição. para que/a fim de que = finalidade. além disso = adição. ou seja = explicação.
Pegadinha: a banca troca o conectivo e muda o sentido. "O banco ampliou os canais digitais, mas manteve o atendimento presencial" (oposição) não equivale a "...portanto manteve..." (conclusão).

COMO RESOLVER
1) Leia o comando antes das alternativas. 2) Localize o trecho da pergunta. 3) Atenção a "sempre", "nunca", "somente", "todos", "necessariamente". 4) Elimine alternativas que extrapolam o texto. 5) Não escolha algo só porque é verdade na vida real. 6) Volte ao texto para confirmar.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — interpretação e inferência (Q1 a Q4)', 15 from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Análise combinatória: PFC, fatorial, permutação, arranjo e combinação', 35, $$A principal dificuldade é identificar se a ORDEM importa e se TODOS os elementos serão usados.

PRINCÍPIO FUNDAMENTAL DA CONTAGEM (PFC)
Em etapas sucessivas, multiplicam-se as possibilidades de cada etapa. Ex.: 3 camisetas e 2 calças → 3 × 2 = 6 combinações.
Senha de 2 dígitos (0 a 9) com repetição: 10 × 10 = 100. Sem repetição: 10 × 9 = 90. Em senhas, observe se o enunciado permite repetição.

FATORIAL
n! = n × (n−1) × ... × 1. Ex.: 4! = 24; 5! = 120. Por definição, 0! = 1. Propriedade: n! = n × (n−1)! (ex.: 6! = 6 × 5!).

PERMUTAÇÃO SIMPLES
Organizar TODOS os elementos, com ordem: Pn = n!. Ex.: 4 pessoas em fila → 4! = 24. A fila ABCD é diferente de BACD.

PERMUTAÇÃO COM REPETIÇÃO
P = n! / (a! × b! × c!). Ex.: anagramas de ANA (3 letras, o A repete 2 vezes): 3!/2! = 6/2 = 3 (ANA, AAN, NAA).

ARRANJO SIMPLES
Escolhe PARTE dos elementos, a ORDEM importa: A(n,p) = n! / (n−p)!. Ex.: 5 participantes, primeiro e segundo lugar: A(5,2) = 5!/3! = 5 × 4 = 20. Ana em 1º e Bruno em 2º é diferente do inverso.

COMBINAÇÃO SIMPLES
Escolhe PARTE dos elementos, a ordem NÃO importa: C(n,p) = n! / (p! × (n−p)!). Ex.: 5 funcionários, escolher 2 para uma reunião: C(5,2) = 120 / (2 × 6) = 10. A dupla Ana e Bruno é a mesma que Bruno e Ana.

COMO IDENTIFICAR
Organizar todos os elementos → permutação. Escolher parte, com ordem → arranjo. Escolher parte, sem ordem → combinação. Etapas sucessivas independentes → PFC.
Pegadinha: "escolher presidente, vice e secretário" — cargos diferentes, a ordem importa (arranjo). "Escolher três funcionários para uma comissão" — a ordem não importa (combinação).$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — análise combinatória (Q1 a Q4)', 15 from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Art. 37: LIMPE, publicidade institucional e princípios correlatos', 35, $$O art. 37 estabelece princípios e regras para a Administração Pública direta e indireta. O caput traz cinco princípios expressos — LIMPE: Legalidade, Impessoalidade, Moralidade, Publicidade, Eficiência.

LEGALIDADE
Particular: pode fazer o que a lei não proíbe. Administração: só pode agir quando houver fundamento jurídico que autorize. Ex.: um servidor não pode criar uma taxa só porque a considera útil — precisa de fundamento legal.
Pegadinha: afirmar que a Administração pode fazer tudo o que não estiver expressamente proibido está errado como regra da legalidade administrativa.

IMPESSOALIDADE
Agir sem perseguições ou favorecimentos pessoais, com finalidade pública. Ex.: não contratar alguém só por ser parente de uma autoridade, ignorando as regras legais.
Publicidade institucional (art. 37, §1º): deve ter caráter educativo, informativo ou de orientação social — não pode servir à promoção pessoal de autoridades ou servidores (nome, imagem ou símbolos para autopromoção). Uma campanha pode informar sobre um serviço público, mas não destacar a autoridade.

MORALIDADE
Não basta o ato ser formalmente legal — deve respeitar padrões éticos e de honestidade. Ex.: usar recursos públicos para benefício pessoal viola a moralidade, mesmo com justificativas formais. É um princípio jurídico, não apenas moral pessoal.

PUBLICIDADE
Permite que a sociedade conheça e fiscalize os atos (transparência e controle). Não é divulgação irrestrita: há sigilo legal (intimidade, dados pessoais, informações classificadas). Pegadinha: "todos os atos devem ser divulgados sem qualquer restrição" está errado — publicidade é a regra, com exceções previstas.

EFICIÊNCIA
Bons resultados, qualidade e uso adequado dos recursos. Ex.: reorganizar procedimentos para reduzir o tempo de atendimento sem perder qualidade. Eficiência não autoriza descumprir a lei para ganhar rapidez.

OUTROS PRINCÍPIOS CORRELATOS
Supremacia do interesse público: em situações juridicamente justificadas, prevalece sobre interesses particulares. Indisponibilidade do interesse público: o agente não trata o interesse público como patrimônio pessoal. Continuidade do serviço público: serviços prestados de forma contínua, salvo exceções legais. Autotutela: a Administração controla seus atos, anulando os ilegais e revogando os inconvenientes ou inoportunos. Razoabilidade: decisões adequadas e equilibradas. Proporcionalidade: medida proporcional à finalidade e à situação.

NÃO CONFUNDA
Uma decisão pode ser rápida e ilegal. Pode estar formalmente prevista e ser praticada com favorecimento pessoal. Os princípios devem ser respeitados em conjunto.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — princípios da Administração Pública (Q1 a Q4)', 15 from d returning id
),
b_banc_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Conhecimentos Bancários', 'teoria', 'Conta, poupança, débito × crédito, empréstimo/financiamento, consignado, Pix e Open Finance', 25, $$CONTA CORRENTE
Permite movimentar recursos: depósitos, saques, transferências, pagamentos, recebimento de salário, movimentação por cartão e canais digitais. Pode ser usada por pessoas físicas e jurídicas. Serviços e tarifas dependem das regras e do contrato com a instituição.

CONTA POUPANÇA
Modalidade tradicional de depósito para guardar recursos, com regras próprias de remuneração, conforme a legislação aplicável. Conta corrente: movimentação cotidiana, pagamentos e transferências conforme os serviços contratados. Poupança: tradicionalmente usada para guardar dinheiro e formar reserva.

CARTÃO DE DÉBITO
Paga com recursos disponíveis na conta vinculada — em regra, o valor é descontado direto do saldo. Ex.: saldo de R$500, compra de R$80 no débito → saldo de R$420 (sem outras movimentações). O débito, por si só, não é concessão de crédito.

CARTÃO DE CRÉDITO
Compras com limite concedido pela instituição emissora; o pagamento ocorre depois, pela fatura. Atraso pode gerar encargos previstos em contrato e na regulamentação.
Débito × crédito: débito usa saldo da conta e desconta geralmente na hora; crédito usa limite, paga depois pela fatura e envolve concessão de crédito.

EMPRÉSTIMO × FINANCIAMENTO
Empréstimo: o dinheiro é disponibilizado ao cliente, que o usa conforme as condições contratadas. Financiamento: geralmente vinculado à aquisição de um bem ou serviço específico (veículo, imóvel). A instituição analisa capacidade de pagamento, risco de crédito e condições da operação.

CRÉDITO CONSIGNADO
Parcelas descontadas diretamente da remuneração ou benefício, conforme a legislação — pode ser oferecido a públicos específicos (certos servidores, aposentados, pensionistas). Não confunda: débito movimenta recursos próprios; consignado é crédito concedido, pago por desconto autorizado.

PIX
Sistema brasileiro de pagamentos instantâneos: transferências e pagamentos, qualquer dia da semana (inclusive fins de semana e feriados), normalmente liquidados em poucos segundos; usa chaves ou outros dados para identificar o destinatário; usado por pessoas físicas e jurídicas.
Chaves: CPF/CNPJ, celular, e-mail ou chave aleatória. Importante: a chave Pix não é a conta bancária — apenas identifica a conta para recebimento.

OPEN FINANCE
Compartilhamento padronizado de dados e serviços financeiros entre instituições participantes, mediante consentimento do cliente e observância das regras. Objetivo: ampliar a concorrência e permitir comparar ofertas. Ex.: autorizar o compartilhamento de certas informações para obter proposta de crédito em outra instituição. O cliente controla as autorizações; não significa que todos os dados serão compartilhados automaticamente.

TARIFAS E ATENDIMENTO
Instituições podem cobrar tarifas por certos serviços, respeitadas as regras do Banco Central e a regulamentação. A cobrança depende do serviço, da modalidade de conta e das regras vigentes; o cliente deve ter acesso às informações sobre tarifas e condições.$$
  from d returning id
),
b_banc_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Conhecimentos Bancários', 'exercicios', 'Fixação — produtos e serviços bancários (Q1 a Q4)', 15 from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 23 (12 questões)', 50,
    $$Sem consulta. 12 questões misturando interpretação, análise combinatória, princípios da Administração e produtos bancários.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Caderno de erros, pegadinhas do dia e revisão programada', 20, $$CADERNO DE ERROS
Anote o porquê de cada erro, não só a resposta certa. Foque: Português (inferência, ideia principal e conectivos); Matemática (arranjo × combinação × permutação); Constitucional (LIMPE e suas aplicações); Bancários (débito, crédito, Pix e Open Finance). Os erros nas questões de hoje entram automaticamente no caderno do app.

PRINCIPAIS PEGADINHAS DO DIA
Português: inferir não é inventar; "mas" indica oposição e "portanto" indica conclusão; a alternativa correta precisa ser sustentada pelo texto.
Matemática: se a ordem importa, pense em arranjo ou permutação; se não importa, combinação; em senhas com repetição, cuidado com o número de possibilidades.
Constitucional: memorize LIMPE; a Administração está sujeita à legalidade; publicidade institucional não pode promover autoridades.
Bancários: débito usa o saldo; crédito usa limite concedido; Pix é pagamento instantâneo; Open Finance depende de consentimento.

REVISÃO PROGRAMADA
Amanhã (10 min): revise LIMPE, as fórmulas de análise combinatória e os conectivos. Em 7 dias: refaça as questões erradas sem consultar. Em 30 dias: revisão geral e pequeno simulado. (O app agenda isso no caderno de erros.)
Marque este bloco como concluído para fechar o Dia 23.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_port_ex), 1, 'Português',
   'Leia: "A digitalização dos serviços bancários trouxe agilidade aos clientes. Entretanto, a modernização também exige investimentos em segurança e educação digital." A ideia principal é:',
   '{"A":"A digitalização eliminou todos os riscos bancários.","B":"A modernização bancária oferece benefícios, mas também exige cuidados.","C":"Os clientes deixaram de utilizar serviços bancários.","D":"A educação digital tornou-se desnecessária."}'::jsonb,
   'B', 'O texto apresenta o benefício (agilidade) e, com "entretanto", a ressalva (segurança e educação digital). As demais extrapolam ou contradizem.'),
  ((select id from b_port_ex), 2, 'Português',
   'Na frase "Carlos voltou a utilizar o aplicativo bancário", a palavra "voltou" permite concluir que:',
   '{"A":"Carlos nunca utilizou o aplicativo.","B":"Carlos utilizava o aplicativo anteriormente.","C":"Carlos foi obrigado a utilizar o aplicativo.","D":"Carlos deixou de utilizar todos os serviços bancários."}'::jsonb,
   'B', '"Voltou a" é marca de pressuposto: ele já utilizava antes.'),
  ((select id from b_port_ex), 3, 'Português',
   'Em "O sistema é eficiente, porém precisa de melhorias", o conectivo "porém" indica:',
   '{"A":"Conclusão.","B":"Finalidade.","C":"Oposição.","D":"Condição."}'::jsonb,
   'C', '"Porém" é conjunção adversativa — contrapõe a eficiência à necessidade de melhorias.'),
  ((select id from b_port_ex), 4, 'Português',
   'Assinale a alternativa que apresenta uma inferência válida. Texto: "Ao chegar à agência, Roberto encontrou uma fila extensa e decidiu retornar no dia seguinte."',
   '{"A":"Roberto foi atendido imediatamente.","B":"Roberto não possuía conta bancária.","C":"Roberto decidiu não esperar naquela ocasião.","D":"A agência estava fechada."}'::jsonb,
   'C', 'Ao decidir voltar no dia seguinte diante da fila, ele optou por não esperar naquele momento. As demais inventam informações.'),

  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Uma pessoa possui 4 camisas e 3 calças. Quantas combinações diferentes pode formar utilizando uma camisa e uma calça?',
   '{"A":"7","B":"12","C":"24","D":"4"}'::jsonb,
   'B', 'Princípio fundamental da contagem: 4 × 3 = 12.'),
  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'De quantas maneiras 5 pessoas podem ficar organizadas em uma fila?',
   '{"A":"25","B":"60","C":"120","D":"20"}'::jsonb,
   'C', 'Permutação simples: 5! = 120.'),
  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Uma equipe de 6 funcionários precisa escolher 2 representantes. Quantas duplas podem ser formadas?',
   '{"A":"12","B":"15","C":"30","D":"36"}'::jsonb,
   'B', 'A ordem não importa: C(6,2) = 6!/(2!·4!) = 15.'),
  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Em uma competição com 7 participantes, de quantas maneiras podem ser definidos o primeiro e o segundo colocados?',
   '{"A":"21","B":"42","C":"49","D":"14"}'::jsonb,
   'B', 'A ordem importa: A(7,2) = 7 × 6 = 42.'),

  ((select id from b_const_ex), 1, 'Constitucional',
   'Os princípios expressamente previstos no caput do artigo 37 da Constituição Federal são:',
   '{"A":"Legalidade, razoabilidade, moralidade, publicidade e eficiência.","B":"Legalidade, impessoalidade, moralidade, publicidade e eficiência.","C":"Legalidade, finalidade, proporcionalidade, publicidade e eficiência.","D":"Impessoalidade, supremacia, continuidade, publicidade e moralidade."}'::jsonb,
   'B', 'LIMPE: legalidade, impessoalidade, moralidade, publicidade e eficiência.'),
  ((select id from b_const_ex), 2, 'Constitucional',
   'Um agente público utiliza a publicidade institucional para promover sua própria imagem. Essa conduta viola principalmente o princípio da:',
   '{"A":"Eficiência.","B":"Continuidade.","C":"Impessoalidade.","D":"Autotutela."}'::jsonb,
   'C', 'O art. 37, §1º veda a promoção pessoal na publicidade institucional — ligada à impessoalidade.'),
  ((select id from b_const_ex), 3, 'Constitucional',
   'O princípio segundo o qual a Administração deve agir conforme autorização ou fundamento legal é o da:',
   '{"A":"Legalidade.","B":"Publicidade.","C":"Moralidade.","D":"Eficiência."}'::jsonb,
   'A', 'Legalidade administrativa: só se age com fundamento jurídico.'),
  ((select id from b_const_ex), 4, 'Constitucional',
   'A Administração Pública deve buscar resultados de qualidade e utilizar adequadamente os recursos disponíveis. Essa ideia está relacionada ao princípio da:',
   '{"A":"Publicidade.","B":"Eficiência.","C":"Impessoalidade.","D":"Moralidade."}'::jsonb,
   'B', 'Eficiência: bons resultados, qualidade e uso adequado dos recursos.'),

  ((select id from b_banc_ex), 1, 'Conhecimentos Bancários',
   'O cartão de débito caracteriza-se principalmente por:',
   '{"A":"Utilizar necessariamente um limite de crédito.","B":"Movimentar recursos disponíveis na conta vinculada.","C":"Permitir pagamento somente após a fatura.","D":"Ser uma modalidade de financiamento imobiliário."}'::jsonb,
   'B', 'O débito usa o saldo da conta vinculada, em regra descontado na hora.'),
  ((select id from b_banc_ex), 2, 'Conhecimentos Bancários',
   'O Pix caracteriza-se por:',
   '{"A":"Funcionamento exclusivo em dias úteis.","B":"Transferências que dependem sempre de compensação em vários dias.","C":"Pagamentos instantâneos, normalmente liquidados em poucos segundos.","D":"Ser exclusivamente destinado a empresas."}'::jsonb,
   'C', 'Pix é pagamento instantâneo, todos os dias, para pessoas físicas e jurídicas.'),
  ((select id from b_banc_ex), 3, 'Conhecimentos Bancários',
   'O cartão de crédito permite que o cliente:',
   '{"A":"Realize compras utilizando limite de crédito concedido.","B":"Utilize somente dinheiro depositado em espécie.","C":"Realize compras sem obrigação de pagamento.","D":"Receba remuneração automática sobre cada compra."}'::jsonb,
   'A', 'O crédito usa limite concedido, com pagamento posterior pela fatura.'),
  ((select id from b_banc_ex), 4, 'Conhecimentos Bancários',
   'O Open Finance permite, conforme as regras aplicáveis:',
   '{"A":"Compartilhamento automático e obrigatório de todos os dados bancários.","B":"Compartilhamento de dados e serviços financeiros mediante consentimento.","C":"Eliminação de todas as instituições financeiras.","D":"Acesso irrestrito aos dados de qualquer cliente."}'::jsonb,
   'B', 'O compartilhamento depende de consentimento do cliente e das regras do sistema.'),

  ((select id from b_simulado), 1, 'Português',
   'A principal ideia do texto "A tecnologia facilita o atendimento, mas exige inclusão digital" é:',
   '{"A":"A tecnologia eliminou a necessidade de atendimento.","B":"A tecnologia oferece benefícios, mas exige atenção à inclusão digital.","C":"Todos os clientes preferem atendimento digital.","D":"A inclusão digital impede o uso da tecnologia."}'::jsonb,
   'B', 'O "mas" liga o benefício à exigência de inclusão digital.'),
  ((select id from b_simulado), 2, 'Português',
   'Na frase "Ana voltou a estudar", o verbo "voltou" pressupõe que Ana:',
   '{"A":"Nunca estudou.","B":"Já estudava anteriormente.","C":"Foi aprovada em concurso.","D":"Estuda obrigatoriamente todos os dias."}'::jsonb,
   'B', '"Voltou a" pressupõe que já estudava antes.'),
  ((select id from b_simulado), 3, 'Português',
   'O conectivo "portanto" indica, normalmente:',
   '{"A":"Oposição.","B":"Condição.","C":"Conclusão.","D":"Concessão."}'::jsonb,
   'C', '"Portanto" introduz conclusão.'),
  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Uma senha possui 3 algarismos, de 0 a 9, permitindo repetição. Quantas senhas existem?',
   '{"A":"30","B":"100","C":"720","D":"1.000"}'::jsonb,
   'D', '10 × 10 × 10 = 1.000.'),
  ((select id from b_simulado), 5, 'Matemática/RLM',
   'De quantas maneiras 4 pessoas podem ficar em uma fila?',
   '{"A":"4","B":"8","C":"16","D":"24"}'::jsonb,
   'D', '4! = 24.'),
  ((select id from b_simulado), 6, 'Matemática/RLM',
   'Uma comissão de 2 pessoas será escolhida entre 5 funcionários. Quantas comissões são possíveis?',
   '{"A":"10","B":"20","C":"25","D":"60"}'::jsonb,
   'A', 'A ordem não importa: C(5,2) = 10.'),
  ((select id from b_simulado), 7, 'Constitucional',
   'A sigla LIMPE corresponde aos princípios:',
   '{"A":"Legalidade, impessoalidade, moralidade, publicidade e eficiência.","B":"Legalidade, igualdade, moralidade, prudência e eficiência.","C":"Liberdade, impessoalidade, moralidade, publicidade e economia.","D":"Legalidade, impessoalidade, motivação, publicidade e equidade."}'::jsonb,
   'A', 'É a literalidade do caput do art. 37.'),
  ((select id from b_simulado), 8, 'Constitucional',
   'A promoção pessoal de uma autoridade em publicidade institucional viola principalmente:',
   '{"A":"Eficiência.","B":"Impessoalidade.","C":"Continuidade.","D":"Autotutela."}'::jsonb,
   'B', 'Promoção pessoal contraria a impessoalidade (art. 37, §1º).'),
  ((select id from b_simulado), 9, 'Constitucional',
   'O princípio da eficiência está relacionado:',
   '{"A":"À busca de bons resultados e qualidade dos serviços.","B":"À possibilidade de descumprir a lei para acelerar serviços.","C":"À divulgação irrestrita de dados pessoais.","D":"Ao favorecimento de servidores."}'::jsonb,
   'A', 'Eficiência é resultado e qualidade, sempre dentro da lei.'),
  ((select id from b_simulado), 10, 'Conhecimentos Bancários',
   'O cartão de débito utiliza:',
   '{"A":"Limite de crédito futuro.","B":"Saldo disponível na conta vinculada.","C":"Financiamento automático.","D":"Empréstimo consignado."}'::jsonb,
   'B', 'O débito usa o saldo da conta.'),
  ((select id from b_simulado), 11, 'Conhecimentos Bancários',
   'Uma característica do Pix é:',
   '{"A":"Funcionamento apenas de segunda a sexta.","B":"Exclusividade para empresas.","C":"Pagamento instantâneo, normalmente em poucos segundos.","D":"Necessidade de compensação em vários dias."}'::jsonb,
   'C', 'Pix é instantâneo e funciona todos os dias.'),
  ((select id from b_simulado), 12, 'Conhecimentos Bancários',
   'O Open Finance permite:',
   '{"A":"Compartilhar dados financeiros sem qualquer autorização.","B":"Compartilhar dados e serviços mediante consentimento, conforme as regras.","C":"Acessar livremente os dados de qualquer pessoa.","D":"Eliminar a necessidade de bancos."}'::jsonb,
   'B', 'O compartilhamento depende de consentimento do cliente.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
