-- Cadastra o Dia 7 (versão completa e robusta).
delete from days where week = 2 and day_number = 2;

with d as (
  insert into days (week, day_number, title)
  values (2, 2, 'Regência verbal/nominal + juros simples e compostos + direitos sociais/nacionalidade + Sistema Financeiro Nacional')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Regência verbal e nominal', 25, $$Regência é a relação entre uma palavra e seu complemento — ela determina se o termo exige ou não preposição. Regência verbal: verbo e complemento. Regência nominal: nome (substantivo, adjetivo, advérbio) e complemento.
Ex. verbal: "Gosto de Português."; "Obedeço às normas."; "Assisti ao filme." Ex. nominal: "Tenho necessidade de ajuda."; "Ele é favorável à proposta."; "Estou consciente do problema."

VERBOS QUE MUDAM DE REGÊNCIA CONFORME O SENTIDO
Assistir (ver) → com "a": "Assisti ao documentário." Assistir (prestar assistência) → sem preposição: "O médico assistiu o paciente."
Aspirar (desejar) → com "a": "Aspiro ao cargo." Aspirar (inalar) → sem preposição: "Aspirou o perfume."
Visar (ter como objetivo) → com "a": "Visa ao sucesso." Visar (pôr visto) → sem preposição: "O gerente visou o documento."
Obedecer → sempre com "a": "Obedeceu às regras." Preferir → com "a": "Prefiro estudar a sair." Gostar → com "de": "Gosto de Matemática." Necessitar → com "de": "Necessito de orientação." Simpatizar → com "com": "Simpatizei com a equipe." Chegar → com "a": "Cheguei ao trabalho."

"ASSISTIR": na primeira frase (ver/presenciar) o verbo é transitivo indireto; na segunda (prestar assistência) é transitivo direto.
"PREFERIR": construção formal recomendada é "Prefiro estudar a assistir televisão" — evite "prefiro mais... do que" em questões que cobram a norma tradicional.
"OBEDECER": sempre exige "a" — "O servidor obedeceu ao regulamento."; "Os candidatos obedeceram às instruções."

REGÊNCIA NOMINAL — NOMES E SUAS PREPOSIÇÕES
Aversão a (aversão a injustiças). Capacidade de/para (capacidade de aprender). Dúvida sobre/de (dúvida sobre o assunto). Favorável a (favorável à proposta). Necessidade de (necessidade de apoio). Orgulhoso de (orgulhoso do resultado). Compatível com (compatível com o sistema). Responsável por (responsável pelo setor).

REGÊNCIA E CRASE
A crase ocorre, em regra, pela fusão da preposição "a" com o artigo feminino "a" ou com certos pronomes iniciados por "a". Ex.: "Obedeceu à norma." (obedecer a + a norma); "Assistiu à palestra." (assistir a + a palestra); "Foi à agência." (ir a + a agência).
Macete: troque a palavra feminina por uma masculina equivalente — se aparecer "ao", geralmente há crase na versão feminina ("Foi ao banco." / "Foi à agência.").

PEGADINHAS
"Assisti o filme" é usado informalmente, mas a regência tradicional de "assistir" no sentido de ver é "assistir a". "Prefiro mais café do que chá" não segue a regência tradicional cobrada em provas. Nem toda palavra feminina recebe crase: "a pé" não tem crase. Regência (preposições e complementos) não se confunde com concordância (gênero, número, pessoa).$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — regência (Q1 a Q4)', 15
  from d returning id
),
b_matfin_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática Financeira', 'teoria', 'Juros simples e compostos', 35, $$Juros são o valor cobrado ou recebido pelo uso de um capital durante um período. Elementos: C (capital inicial), J (juros), i (taxa por período), t (tempo/número de períodos), M (montante final). Montante = capital + juros: M = C + J.

JUROS SIMPLES
Os juros incidem sempre sobre o capital inicial. Fórmula: J = C × i × t. Montante: M = C × (1 + i×t).
Exemplo: R$ 1.000 a 2% ao mês por 5 meses. J = 1000 × 0,02 × 5 = 100. Montante = 1000 + 100 = R$ 1.100.

JUROS COMPOSTOS
Os juros de cada período incidem sobre o montante acumulado até aquele momento — "juros sobre juros". Fórmula: M = C × (1 + i)^t. Juros: J = M − C.
Exemplo: R$ 1.000 a 2% ao mês por 5 meses, juros compostos. M = 1000 × (1,02)^5 ≈ 1104,08. J ≈ 104,08.

DIFERENÇA ENTRE SIMPLES E COMPOSTOS
Simples: base de cálculo é o capital inicial; crescimento linear; fórmula M = C(1+it); usado em problemas de cálculo proporcional.
Compostos: base de cálculo é o montante acumulado; crescimento exponencial; fórmula M = C(1+i)^t; usado em investimentos, empréstimos e capitalização.

CONVERSÃO DE TAXAS
Taxa e tempo precisam estar na mesma unidade. Em juros simples, 24% ao ano equivale a 2% ao mês por conversão proporcional direta: 24% ÷ 12 = 2%.
Atenção: em juros compostos, uma taxa anual efetiva NÃO deve ser simplesmente dividida por 12 para achar a taxa mensal equivalente — a equivalência composta é: (1 + i_anual) = (1 + i_mensal)^12.

PEGADINHAS
Converter a taxa percentual para decimal antes de usar a fórmula (5% → 0,05). Verificar se o tempo está em meses, anos ou dias, na mesma unidade da taxa. Não confundir juros (J) com montante (M). Em juros compostos, elevar o fator de capitalização ao número de períodos — nunca usar a fórmula de juros simples em problema de capitalização composta.$$
  from d returning id
),
b_matfin_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática Financeira', 'exercicios', 'Fixação — juros simples e compostos (Q5 a Q8)', 15
  from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Direitos sociais (art. 6º), direitos dos trabalhadores (art. 7º) e nacionalidade (art. 12)', 30, $$DIREITOS SOCIAIS — ART. 6º
São direitos fundamentais que buscam assegurar condições dignas de vida e oportunidades: educação, saúde, alimentação, trabalho, moradia, transporte, lazer, segurança, previdência social, proteção à maternidade e à infância, assistência aos desamparados.
Macete: associe aos itens à necessidades básicas de uma pessoa — estudar, ter saúde, alimentar-se, trabalhar, morar, deslocar-se, descansar, estar protegida, receber amparo quando necessário. Estão previstos principalmente no Capítulo II do Título II da Constituição.

DIREITOS DOS TRABALHADORES — ART. 7º
Salário mínimo: fixado em lei, nacionalmente unificado. Décimo terceiro salário: com base na remuneração integral ou no valor da aposentadoria. Jornada de trabalho: regra geral de até 8 horas diárias e 44 semanais. Repouso semanal: preferencialmente aos domingos. Férias: com adicional de pelo menos um terço. Licença à gestante: sem prejuízo do emprego e do salário, pelo período constitucional. FGTS: Fundo de Garantia do Tempo de Serviço. Aviso-prévio: proporcional ao tempo de serviço, conforme a lei.
Atenção: a jornada de 8h/44h é a regra geral constitucional — existem regimes e categorias com disposições específicas.

NACIONALIDADE — ART. 12
Nacionalidade é o vínculo jurídico-político que liga uma pessoa a um Estado. A Constituição diferencia brasileiros natos e naturalizados.
Brasileiros natos: nascidos no Brasil, ainda que de pais estrangeiros, desde que estes não estejam a serviço de seu país; nascidos no estrangeiro, de pai ou mãe brasileira, desde que um deles esteja a serviço do Brasil; nascidos no estrangeiro, de pai ou mãe brasileira, registrados em repartição brasileira competente ou que venham a residir no Brasil e optem, após a maioridade, pela nacionalidade brasileira.
Brasileiros naturalizados: estrangeiros que adquirem a nacionalidade brasileira conforme requisitos constitucionais e legais, incluindo hipótese especial para originários de países de língua portuguesa.

CARGOS PRIVATIVOS DE BRASILEIRO NATO
Presidente e Vice-Presidente da República; Presidente da Câmara dos Deputados; Presidente do Senado Federal; Ministro do Supremo Tribunal Federal; carreira diplomática; oficial das Forças Armadas; Ministro de Estado da Defesa.
Pegadinha: nem todo cargo público é privativo de nato — por exemplo, Deputado Federal pode ser ocupado por brasileiro naturalizado, cumpridos os demais requisitos.

PERDA DA NACIONALIDADE
Pode ocorrer mediante pedido expresso de perda perante autoridade brasileira competente, ressalvadas situações que resultem em apatridia. A aquisição de outra nacionalidade, por si só, NÃO causa automaticamente a perda da nacionalidade brasileira.

PEGADINHAS GERAIS
Direitos sociais são direitos fundamentais, não meros benefícios concedidos pelo governo. Brasileiros natos e naturalizados têm igualdade de direitos, exceto nas distinções admitidas pela Constituição. Só os cargos expressamente previstos são privativos de nato. A aquisição de outra nacionalidade não gera perda automática.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — direitos sociais e nacionalidade (Q9 a Q12)', 15
  from d returning id
),
b_banc_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Conhecimentos Bancários', 'teoria', 'Sistema Financeiro Nacional — estrutura, órgãos e produtos', 25, $$O Sistema Financeiro Nacional (SFN) é o conjunto de instituições, entidades e instrumentos que permitem a circulação de recursos financeiros na economia, conectando poupadores, investidores, empresas, consumidores e governo.

ESTRUTURA BÁSICA: NORMATIVOS, SUPERVISORES E OPERADORES
Órgão normativo — Conselho Monetário Nacional (CMN): órgão normativo superior do SFN, formula diretrizes gerais das políticas monetária, creditícia e cambial.
Entidades supervisoras — Banco Central do Brasil (BCB): executa as políticas no âmbito de suas competências, supervisiona instituições financeiras autorizadas e zela pela estabilidade do sistema. Comissão de Valores Mobiliários (CVM): fiscaliza, normatiza e disciplina o mercado de valores mobiliários.
Operadores: bancos comerciais, bancos múltiplos, cooperativas de crédito, corretoras, distribuidoras e outras instituições autorizadas.

BANCO CENTRAL DO BRASIL
Autarquia de natureza especial, com autonomia estabelecida em lei. Atribuições: executar a política monetária nos limites de suas competências; emitir moeda conforme autorização legal e constitucional; regular e supervisionar instituições financeiras; administrar reservas internacionais; zelar pela estabilidade e eficiência do sistema financeiro; implementar políticas cambiais. O Banco Central não define sozinho todas as diretrizes econômicas do país — atua dentro das competências legais e constitucionais.

CONSELHO MONETÁRIO NACIONAL
Órgão normativo superior — formula diretrizes gerais para o sistema monetário e de crédito. Distinção cobrada em prova: CMN = normativo (define diretrizes); Banco Central = supervisor e executor dentro de suas atribuições; CVM = supervisora do mercado de valores mobiliários.

MERCADOS
Monetário: operações de curto prazo ligadas à liquidez da economia. Crédito: empréstimos, financiamentos e operações de crédito. Capitais: negociação de valores mobiliários e captação de recursos para investimento. Câmbio: compra, venda e troca de moedas estrangeiras.

PRODUTOS E SERVIÇOS BANCÁRIOS
Conta corrente: movimentação de recursos, pagamentos, transferências. Poupança: depósito com regras próprias de remuneração. Empréstimo: a instituição disponibiliza recursos que o cliente devolve conforme contratado. Financiamento: geralmente vinculado à aquisição de um bem, serviço ou projeto específico. Cartão de crédito: instrumento de pagamento com obrigações futuras, conforme condições contratadas.

PEGADINHAS
O CMN é órgão normativo — não confundir com o Banco Central. A CVM foca no mercado de valores mobiliários, não na supervisão geral de todas as instituições financeiras. Bancos comerciais são operadores, não órgãos normativos. Empréstimo e financiamento são operações de crédito, mas podem ter finalidades e condições contratuais distintas.$$
  from d returning id
),
b_banc_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Conhecimentos Bancários', 'exercicios', 'Fixação — SFN (Q13 a Q16)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 7 (Q17 a Q36)', 40,
    $$Sem consulta. As 20 questões misturam Português (regência), Matemática Financeira (juros), Constitucional (direitos sociais/nacionalidade) e Conhecimentos Bancários (SFN) — preste atenção aos termos técnicos e às condições de cada enunciado.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Correção, caderno de erros e revisão programada', 25, $$CORREÇÃO
O objetivo é descobrir se você errou por falta de conhecimento, desatenção, interpretação incorreta ou dificuldade com cálculos. Registre, por matéria, a questão, o erro e a regra que precisa lembrar. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app.

CONTROLE DE DESEMPENHO
Português: 4 questões de fixação + 5 no simulado. Matemática Financeira: 4 + 5. Constitucional: 4 + 5. Conhecimentos Bancários: 4 + 5. Total: 16 de fixação + 20 do simulado = 36 questões. Acompanhe o percentual de acertos por disciplina no Painel — se o resultado estiver baixo, volte à teoria e faça novas questões do mesmo tema antes de avançar.

REVISÃO PROGRAMADA
24 horas: revise regência, fórmulas de juros, direitos sociais e estrutura do SFN.
7 dias: refaça as questões erradas e tente resolver problemas semelhantes.
30 dias: revisão acumulada dos conteúdos dos Dias 1 a 7.
(O app já aplica esses ciclos sozinho a partir do caderno de erros, visível no Painel.)

META DO DIA 7
Compreender regência verbal e nominal. Diferenciar juros simples e compostos e aplicar as fórmulas. Conhecer os direitos sociais e as regras básicas de nacionalidade. Identificar as funções do CMN, Banco Central, CVM e operadores do SFN. Resolver as 36 questões entre fixação e simulado. Atualizar o caderno de erros. Marque este bloco como concluído para fechar o Dia 7.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a alternativa de acordo com a norma-padrão de regência verbal.',
   '{"A":"Assisti o filme ontem.","B":"Obedeci o regulamento.","C":"Prefiro estudar do que trabalhar.","D":"Assisti à palestra pela manhã.","E":"Cheguei no trabalho às oito horas."}'::jsonb,
   'D', '"Assistir" no sentido de ver exige a preposição "a": "assisti à palestra". As demais erram a regência tradicional de assistir, obedecer, preferir e chegar.'),

  ((select id from b_port_ex), 2, 'Português',
   'Assinale a frase em que o verbo "aspirar" foi empregado corretamente no sentido de desejar.',
   '{"A":"Aspiro o cargo de gerente.","B":"Aspiro ao cargo de gerente.","C":"Aspiro pelo cargo de gerente.","D":"Aspiro no cargo de gerente.","E":"Aspiro com o cargo de gerente."}'::jsonb,
   'B', '"Aspirar" no sentido de desejar exige a preposição "a": "aspiro ao cargo".'),

  ((select id from b_port_ex), 3, 'Português',
   'Em qual alternativa a crase está corretamente empregada?',
   '{"A":"Começou à estudar cedo.","B":"Entregou o documento à ela.","C":"Dirigiu-se à agência bancária.","D":"Voltou à pé para casa.","E":"Pediu ajuda à um servidor."}'::jsonb,
   'C', '"Dirigiu-se à agência" tem crase correta (a + a agência, palavra feminina). As demais erram: antes de verbo não há crase, pronome "ela" não recebe crase, "a pé" não tem crase, e artigo indefinido "um" não combina com crase.'),

  ((select id from b_port_ex), 4, 'Português',
   'Assinale a alternativa correta quanto à regência nominal.',
   '{"A":"Ele é favorável da proposta.","B":"Ela tem necessidade em apoio.","C":"O funcionário está consciente do problema.","D":"O relatório é compatível de o sistema.","E":"O candidato tem aversão com injustiças."}'::jsonb,
   'C', '"Consciente de" está correto. As demais trocam a preposição exigida: favorável A, necessidade DE, compatível COM, aversão A.'),

  -- Matemática Financeira — fixação (Q5-8)
  ((select id from b_matfin_ex), 1, 'Matemática Financeira',
   'Um capital de R$ 2.000 foi aplicado a juros simples de 3% ao mês, durante 4 meses. Qual o valor dos juros?',
   '{"A":"R$ 180","B":"R$ 200","C":"R$ 220","D":"R$ 240","E":"R$ 260"}'::jsonb,
   'D', 'J = 2000 × 0,03 × 4 = 240.'),

  ((select id from b_matfin_ex), 2, 'Matemática Financeira',
   'Um investimento de R$ 1.500 foi aplicado a juros simples de 2% ao mês, durante 6 meses. Qual o montante final?',
   '{"A":"R$ 1.620","B":"R$ 1.650","C":"R$ 1.680","D":"R$ 1.700","E":"R$ 1.720"}'::jsonb,
   'C', 'M = 1500 × (1 + 0,02×6) = 1500 × 1,12 = 1680.'),

  ((select id from b_matfin_ex), 3, 'Matemática Financeira',
   'Um capital de R$ 1.000 é aplicado a juros compostos de 10% ao ano durante 2 anos. Qual é o montante?',
   '{"A":"R$ 1.100","B":"R$ 1.200","C":"R$ 1.210","D":"R$ 1.220","E":"R$ 1.250"}'::jsonb,
   'C', 'M = 1000 × (1,10)² = 1000 × 1,21 = 1210.'),

  ((select id from b_matfin_ex), 4, 'Matemática Financeira',
   'Qual é a principal diferença entre juros simples e juros compostos?',
   '{"A":"Nos simples, não existe taxa de juros.","B":"Nos compostos, os juros são calculados sobre o capital inicial apenas.","C":"Nos simples, os juros são calculados sobre o capital inicial; nos compostos, sobre o montante acumulado.","D":"Ambos possuem sempre o mesmo montante.","E":"Juros compostos não podem ser aplicados mensalmente."}'::jsonb,
   'C', 'Essa é exatamente a diferença estrutural entre os dois regimes.'),

  -- Constitucional — fixação (Q9-12)
  ((select id from b_const_ex), 1, 'Constitucional',
   'Qual alternativa apresenta um direito social previsto no art. 6º da Constituição Federal?',
   '{"A":"Soberania.","B":"Pluralismo político.","C":"Moradia.","D":"Separação dos Poderes.","E":"Independência nacional."}'::jsonb,
   'C', 'Moradia é um dos direitos sociais do art. 6º. As demais são fundamento (art. 1º), princípio institucional (art. 2º) ou princípio das relações internacionais (art. 4º).'),

  ((select id from b_const_ex), 2, 'Constitucional',
   'De acordo com a Constituição Federal, é um direito dos trabalhadores urbanos e rurais:',
   '{"A":"Jornada obrigatória de 10 horas diárias.","B":"Repouso semanal remunerado, preferencialmente aos domingos.","C":"Ausência de férias remuneradas.","D":"Salário definido exclusivamente pelo empregador, sem proteção legal.","E":"Proibição de décimo terceiro salário."}'::jsonb,
   'B', 'Art. 7º: repouso semanal remunerado, preferencialmente aos domingos.'),

  ((select id from b_const_ex), 3, 'Constitucional',
   'É considerado brasileiro nato, nos termos constitucionais, o indivíduo:',
   '{"A":"Estrangeiro que reside no Brasil há um mês.","B":"Nascido no Brasil de pais estrangeiros que estejam a serviço de seu país.","C":"Nascido no Brasil, de pais estrangeiros, desde que estes não estejam a serviço de seu país.","D":"Estrangeiro que tenha adquirido um imóvel no Brasil.","E":"Qualquer pessoa que trabalhe para uma empresa brasileira no exterior."}'::jsonb,
   'C', 'É exatamente a primeira hipótese de nato do art. 12, I.'),

  ((select id from b_const_ex), 4, 'Constitucional',
   'Qual dos seguintes cargos é privativo de brasileiro nato?',
   '{"A":"Prefeito.","B":"Governador de Estado.","C":"Deputado Federal.","D":"Ministro do Supremo Tribunal Federal.","E":"Vereador."}'::jsonb,
   'D', 'Ministro do STF está na lista constitucional de cargos privativos de brasileiro nato.'),

  -- Conhecimentos Bancários — fixação (Q13-16)
  ((select id from b_banc_ex), 1, 'Conhecimentos Bancários',
   'Qual é o órgão normativo superior do Sistema Financeiro Nacional?',
   '{"A":"Banco do Brasil.","B":"Banco Central.","C":"Conselho Monetário Nacional.","D":"Comissão de Valores Mobiliários.","E":"Caixa Econômica Federal."}'::jsonb,
   'C', 'O CMN é o órgão normativo superior do SFN.'),

  ((select id from b_banc_ex), 2, 'Conhecimentos Bancários',
   'A principal função da CVM está relacionada:',
   '{"A":"À emissão de cédulas e moedas.","B":"À supervisão do mercado de valores mobiliários.","C":"À administração direta de todas as contas bancárias.","D":"À definição de todos os gastos públicos.","E":"À concessão de empréstimos habitacionais diretamente a todos os cidadãos."}'::jsonb,
   'B', 'CVM fiscaliza, normatiza e disciplina o mercado de valores mobiliários.'),

  ((select id from b_banc_ex), 3, 'Conhecimentos Bancários',
   'Uma das atribuições do Banco Central do Brasil é:',
   '{"A":"Elaborar a Constituição Federal.","B":"Supervisionar instituições financeiras sob sua competência.","C":"Administrar todas as empresas privadas do país.","D":"Definir as leis trabalhistas.","E":"Fiscalizar exclusivamente o mercado imobiliário."}'::jsonb,
   'B', 'O Banco Central regula e supervisiona as instituições financeiras sob sua competência.'),

  ((select id from b_banc_ex), 4, 'Conhecimentos Bancários',
   'Uma operação em que o banco disponibiliza recursos ao cliente, que deverá devolvê-los conforme o contrato, é geralmente chamada de:',
   '{"A":"Empréstimo.","B":"Doação.","C":"Subsídio obrigatório.","D":"Emissão de ações.","E":"Distribuição de dividendos."}'::jsonb,
   'A', 'É a definição básica de empréstimo.'),

  -- Mini-simulado (Q17-36)
  ((select id from b_simulado), 1, 'Português',
   'Assinale a alternativa que segue a norma-padrão de regência.',
   '{"A":"Obedeceu o regulamento.","B":"Assisti à reunião.","C":"Prefiro mais estudar do que descansar.","D":"Aspiro o cargo de analista, no sentido de desejar.","E":"Cheguei no escritório, segundo a regência tradicional."}'::jsonb,
   'B', '"Assisti à reunião" segue a regência tradicional (assistir = ver, com "a"). As demais erram obedecer, preferir, aspirar (desejar) e chegar.'),

  ((select id from b_simulado), 2, 'Português',
   'Em qual alternativa a crase está corretamente empregada?',
   '{"A":"Começou à trabalhar.","B":"Entregou o documento à ele.","C":"Dirigiu-se à repartição pública.","D":"Voltou à pé.","E":"Pediu ajuda à um colega."}'::jsonb,
   'C', 'Mesma lógica da fixação: crase correta antes de substantivo feminino determinado ("à repartição").'),

  ((select id from b_simulado), 3, 'Português',
   'Na frase "O candidato necessita de orientação", o termo "de orientação" é:',
   '{"A":"Sujeito.","B":"Objeto direto.","C":"Complemento nominal do verbo, tradicionalmente classificado como objeto indireto.","D":"Predicativo do sujeito.","E":"Adjunto adverbial."}'::jsonb,
   'C', '"Necessitar" exige a preposição "de" e seu complemento verbal preposicionado é tradicionalmente classificado como objeto indireto.'),

  ((select id from b_simulado), 4, 'Português',
   'O verbo "assistir", no sentido de prestar assistência, é usado tradicionalmente como:',
   '{"A":"Transitivo direto.","B":"Transitivo indireto com preposição de.","C":"Intransitivo obrigatório.","D":"Verbo impessoal.","E":"Verbo de ligação."}'::jsonb,
   'A', '"O médico assistiu o paciente" — nesse sentido, sem preposição, é transitivo direto.'),

  ((select id from b_simulado), 5, 'Matemática Financeira',
   'Um capital de R$ 3.000 foi aplicado a juros simples de 2% ao mês por 5 meses. Os juros são:',
   '{"A":"R$ 200","B":"R$ 250","C":"R$ 300","D":"R$ 350","E":"R$ 400"}'::jsonb,
   'C', 'J = 3000 × 0,02 × 5 = 300.'),

  ((select id from b_simulado), 6, 'Matemática Financeira',
   'Um capital de R$ 2.000, a juros simples de 1% ao mês durante 10 meses, resulta em montante de:',
   '{"A":"R$ 2.100","B":"R$ 2.150","C":"R$ 2.200","D":"R$ 2.250","E":"R$ 2.400"}'::jsonb,
   'C', 'M = 2000 × (1 + 0,01×10) = 2000 × 1,10 = 2200.'),

  ((select id from b_simulado), 7, 'Matemática Financeira',
   'R$ 1.000 aplicados a juros compostos de 10% ao período, durante 2 períodos, resultam em:',
   '{"A":"R$ 1.100","B":"R$ 1.200","C":"R$ 1.210","D":"R$ 1.250","E":"R$ 1.300"}'::jsonb,
   'C', 'M = 1000 × (1,10)² = 1210.'),

  ((select id from b_simulado), 8, 'Matemática Financeira',
   'Nos juros simples, os juros de cada período são calculados sobre:',
   '{"A":"O montante acumulado.","B":"O capital inicial.","C":"A soma dos juros futuros.","D":"A taxa anual apenas.","E":"O valor da inflação."}'::jsonb,
   'B', 'Nos juros simples, a base de cálculo é sempre o capital inicial.'),

  ((select id from b_simulado), 9, 'Constitucional',
   'Qual dos itens é um direito social previsto no art. 6º da Constituição?',
   '{"A":"Soberania.","B":"Pluralismo político.","C":"Transporte.","D":"Independência nacional.","E":"Separação dos Poderes."}'::jsonb,
   'C', 'Transporte é um dos direitos sociais do art. 6º (incluído por emenda constitucional).'),

  ((select id from b_simulado), 10, 'Constitucional',
   'A jornada normal de trabalho prevista como regra geral no art. 7º é de até:',
   '{"A":"6 horas diárias e 30 semanais.","B":"7 horas diárias e 35 semanais.","C":"8 horas diárias e 44 semanais.","D":"10 horas diárias e 50 semanais.","E":"12 horas diárias e 60 semanais."}'::jsonb,
   'C', 'Regra geral constitucional: até 8 horas diárias e 44 semanais.'),

  ((select id from b_simulado), 11, 'Constitucional',
   'É cargo privativo de brasileiro nato:',
   '{"A":"Vereador.","B":"Prefeito.","C":"Deputado Federal.","D":"Ministro do Supremo Tribunal Federal.","E":"Governador."}'::jsonb,
   'D', 'Ministro do STF está na lista constitucional de cargos privativos de nato — as demais funções podem ser ocupadas por naturalizados, cumpridos os requisitos.'),

  ((select id from b_simulado), 12, 'Constitucional',
   'Sobre a aquisição de outra nacionalidade por brasileiro, é correto afirmar que:',
   '{"A":"Sempre provoca perda automática da nacionalidade brasileira.","B":"É proibida pela Constituição em qualquer hipótese.","C":"Por si só, não provoca automaticamente a perda da nacionalidade brasileira.","D":"Só é permitida para brasileiros natos.","E":"Gera automaticamente a perda de direitos políticos."}'::jsonb,
   'C', 'A aquisição de outra nacionalidade, isoladamente, não causa a perda automática da nacionalidade brasileira.'),

  ((select id from b_simulado), 13, 'Conhecimentos Bancários',
   'O CMN é:',
   '{"A":"Uma instituição que concede empréstimos pessoais diretamente.","B":"O órgão normativo superior do SFN.","C":"Uma empresa pública federal.","D":"Uma corretora de valores.","E":"Um órgão do Poder Judiciário."}'::jsonb,
   'B', 'CMN: órgão normativo superior do Sistema Financeiro Nacional.'),

  ((select id from b_simulado), 14, 'Conhecimentos Bancários',
   'A entidade que supervisiona o mercado de valores mobiliários é:',
   '{"A":"CVM.","B":"CMN.","C":"Caixa Econômica Federal.","D":"Banco do Brasil.","E":"Tesouro Nacional."}'::jsonb,
   'A', 'CVM: supervisora do mercado de valores mobiliários.'),

  ((select id from b_simulado), 15, 'Conhecimentos Bancários',
   'Qual instituição exerce funções de supervisão de instituições financeiras autorizadas sob sua competência?',
   '{"A":"Câmara dos Deputados.","B":"Banco Central do Brasil.","C":"Ministério Público.","D":"CVM exclusivamente em todas as instituições.","E":"Tribunal do Júri."}'::jsonb,
   'B', 'O Banco Central supervisiona as instituições financeiras autorizadas sob sua competência.'),

  ((select id from b_simulado), 16, 'Conhecimentos Bancários',
   'O mercado de câmbio está relacionado principalmente:',
   '{"A":"À compra e venda de moedas estrangeiras.","B":"À emissão de certidões civis.","C":"À contratação de servidores públicos.","D":"À concessão de aposentadorias.","E":"À fiscalização de escolas."}'::jsonb,
   'A', 'Mercado de câmbio: compra, venda e troca de moedas estrangeiras.'),

  ((select id from b_simulado), 17, 'Português',
   'Assinale a alternativa correta quanto à regência nominal.',
   '{"A":"Favorável da mudança.","B":"Compatível de o sistema.","C":"Consciente do problema.","D":"Necessidade em apoio.","E":"Aversão com injustiças."}'::jsonb,
   'C', '"Consciente de" está correto. As demais trocam a preposição exigida pelo nome.'),

  ((select id from b_simulado), 18, 'Matemática Financeira',
   'Uma aplicação de R$ 800 rende juros simples de 5% ao mês por 3 meses. Qual é o montante?',
   '{"A":"R$ 880","B":"R$ 900","C":"R$ 920","D":"R$ 940","E":"R$ 960"}'::jsonb,
   'C', 'M = 800 × (1 + 0,05×3) = 800 × 1,15 = 920.'),

  ((select id from b_simulado), 19, 'Constitucional',
   'Os direitos sociais estão previstos principalmente:',
   '{"A":"No art. 1º da Constituição.","B":"No art. 2º da Constituição.","C":"No art. 6º da Constituição.","D":"No art. 37 da Constituição, exclusivamente.","E":"No art. 144 da Constituição, exclusivamente."}'::jsonb,
   'C', 'O art. 6º é o artigo central dos direitos sociais.'),

  ((select id from b_simulado), 20, 'Conhecimentos Bancários',
   'Os bancos comerciais são classificados, de modo geral, como:',
   '{"A":"Órgãos normativos do SFN.","B":"Operadores do SFN.","C":"Poderes da União.","D":"Órgãos constitucionais independentes.","E":"Entidades legislativas."}'::jsonb,
   'B', 'Bancos comerciais são operadores do SFN, não órgãos normativos.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
