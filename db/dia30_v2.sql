-- Cadastra o Dia 30. Carga: 4h20 (4 x 60 min de matérias + 20 min de simulado e revisão). Semana 7, dia 1.
delete from days where week = 7 and day_number = 1;

with d as (
  insert into days (week, day_number, title)
  values (7, 1, 'Regência verbal e nominal + juros simples e compostos + direitos e garantias fundamentais (art. 5º) + produtos e serviços bancários')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Regência verbal e nominal: VTD/VTI/VTDI, verbos cobrados, crase e nomes', 45, $$A regência estuda a relação entre uma palavra e os termos que a complementam — em especial, quando um verbo ou nome exige preposição. É muito cobrada em provas e aparece frequentemente associada à crase.

REGÊNCIA VERBAL
Verbo transitivo direto (VTD): sem preposição obrigatória. "O funcionário analisou o documento." (objeto direto: o documento).
Verbo transitivo indireto (VTI): exige preposição. "O candidato precisa de ajuda." (objeto indireto: de ajuda).
Verbo transitivo direto e indireto (VTDI): dois complementos. "O gerente entregou o documento ao cliente." (entregou o quê? o documento; a quem? ao cliente).

ASSISTIR
Ver, presenciar: exige "a" — "Assisti ao filme."; "O candidato assistiu à aula."; "Assistimos à palestra." Errado: "Assisti o filme." Prestar assistência: pode ser transitivo direto — "O médico assistiu o paciente."; "A equipe assistiu os idosos."

ASPIRAR
Desejar: exige "a" — "O candidato aspira ao cargo."; "Ela aspira à aprovação." Respirar ou sorver: sem preposição — "Aspirou o ar."; "Aspirou a fumaça."

VISAR
Ter como objetivo: tradicionalmente exige "a" — "O candidato visa ao cargo público."; "A medida visa à melhoria do atendimento." Rubricar ou colocar visto: transitivo direto — "O funcionário visou o documento."

OBEDECER / DESOBEDECER
Exigem "a": "O servidor obedeceu às normas."; "O cidadão desobedeceu à ordem." São tradicionalmente transitivos indiretos.

PREFERIR
Construção tradicional: preferir uma coisa A outra. "Prefiro estudar Português a estudar Matemática."; "Prefiro café a chá." Pegadinha: "Prefiro mais estudar do que trabalhar" é inadequado; o correto é "Prefiro estudar a trabalhar" — o verbo "preferir" já contém a ideia de preferência.

INFORMAR
"Informei o resultado ao candidato." / "Informei ao candidato o resultado." / "Informei o candidato sobre o resultado."

PAGAR E PERDOAR
Pagar alguma coisa a alguém: "Paguei a conta ao banco." (a conta = objeto direto; ao banco = objeto indireto); "Paguei ao funcionário." Perdoar: "Perdoei a dívida ao cliente."; "Perdoei ao funcionário." A pessoa costuma ser introduzida por "a".

CHEGAR / IR
Na norma-padrão, destino com "a": "Cheguei ao trabalho."; "Fui à agência."; "Chegamos ao banco." Em provas formais, fique atento ao uso de "em" para destino, quando a banca exigir a construção tradicional.

REGÊNCIA E CRASE
a + a = à. A primeira "a" é a preposição exigida pelo termo anterior; a segunda é o artigo feminino. "O candidato obedeceu à regra." (obedecer exige "a"; "regra" admite artigo). Outros: "Assistimos à palestra."; "O funcionário se referiu à gerente."; "O candidato aspirava à vaga."; "Cheguei à agência."

REGÊNCIA NOMINAL
Amor a/por (amor à profissão); aversão a (aversão à injustiça); obediência a (obediência às regras); necessidade de (necessidade de apoio); capacidade de (capacidade de resolver); interesse por/em (interesse pelo cargo); favorável a (favorável à proposta); contrário a (contrário à decisão); compatível com (compatível com o cargo); responsável por (responsável pelo setor); dúvida sobre (dúvida sobre o assunto).

PEGADINHAS — MEMORIZE
Assistir ao filme. Aspirar ao cargo. Visar ao objetivo. Obedecer às regras. Preferir uma coisa a outra. Chegar à agência. Ir ao banco. Ser favorável à proposta. Ter necessidade de ajuda.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — regência verbal e nominal (Q1 a Q4)', 15 from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática Financeira', 'teoria', 'Juros simples e compostos: fórmulas, conversão de taxas e como identificar o regime', 45, $$Aparece em empréstimos, aplicações, financiamentos e investimentos. Juros são o valor pago ou recebido pelo uso do dinheiro ao longo do tempo.

TERMOS
Capital (C): valor inicial. Juros (J): valor produzido pelo capital. Taxa (i): percentual de juros. Tempo (t): período da operação. Montante (M): capital + juros — M = C + J.

JUROS SIMPLES
Calculados sempre sobre o capital inicial: a base permanece a mesma durante todo o período. J = C × i × t; M = C + J.
Ex. 1: R$ 2.000 a 3% ao mês durante 5 meses. i = 0,03. J = 2000 × 0,03 × 5 = 300. M = 2000 + 300 = R$ 2.300.
Cálculo mental: capital de R$ 1.000 a 2% ao mês → R$ 20 de juros por mês; em 6 meses, 20 × 6 = 120; montante = 1120.
Ex. 2 (descobrir o capital): juros de R$ 600 em 10 meses, taxa de 2% ao mês, regime simples. 600 = C × 0,02 × 10 → 600 = 0,20 C → C = 3.000.

JUROS COMPOSTOS
Os juros de cada período são calculados sobre o montante acumulado — "juros sobre juros"; o capital cresce de forma exponencial. M = C × (1 + i)^t; J = M − C.
Ex. 3: R$ 1.000 a 10% ao mês por 3 meses. 1º mês: 1000 × 1,10 = 1100. 2º mês: 1100 × 1,10 = 1210. 3º mês: 1210 × 1,10 = 1331. Montante: R$ 1.331; juros: 331.

COMPARAÇÃO
Capital R$ 1.000, 10% ao mês, 3 meses. Simples: J = 1000 × 0,10 × 3 = 300; M = 1300. Compostos: M = 1000 × (1,10)³ = 1331.

TAXAS E PERÍODOS
Taxa e tempo devem estar na mesma unidade. 2% ao mês durante 1 ano → t = 12 (não 1). No regime simples: J = C × 0,02 × 12.

CONVERSÃO DE TAXA
Juros simples: 24% ao ano ÷ 12 = 2% ao mês (a proporcionalidade vale para conversão entre períodos).
Juros compostos: a conversão exige equivalência, não simples divisão. 12% ao ano não é exatamente 1% ao mês: a taxa mensal equivalente é (1,12)^(1/12) − 1 ≈ 0,9489%.

EXEMPLO COM TAXA BAIXA
R$ 5.000 a 1% ao mês por 6 meses, compostos: M = 5000 × (1,01)^6 ≈ 5.307,60; juros ≈ 307,60.

COMO IDENTIFICAR NA PROVA
Simples: juros calculados sobre o capital inicial, juros fixos por período, crescimento linear — J = C·i·t. Compostos: capitalização, juros sobre juros, montante acumulado, crescimento exponencial — M = C(1+i)^t.

PEGADINHAS
Transforme a porcentagem em decimal antes de aplicar a fórmula. Taxa mensal exige tempo em meses. Juros simples incidem sobre o capital inicial; compostos, sobre o montante acumulado. Montante não é igual a juros. Em juros compostos, não se multiplica simplesmente a taxa pelo número de períodos.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática Financeira', 'exercicios', 'Fixação — juros simples e compostos (Q1 a Q4)', 15 from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Art. 5º: igualdade, vida, expressão, religião, domicílio, sigilo, reunião, propriedade, garantias processuais e remédios', 45, $$O art. 5º é um dos mais importantes para concursos. Trata de direitos e garantias fundamentais: vida, liberdade, igualdade, segurança, propriedade, direitos individuais e coletivos e garantias processuais.

CAPUT
Todos são iguais perante a lei, sem distinção de qualquer natureza; são garantidos aos brasileiros e aos estrangeiros residentes no País os direitos à vida, à liberdade, à igualdade, à segurança e à propriedade. Pegadinha: a banca pode trocar "igualdade" por "equidade" ou dizer que os direitos são exclusivos de brasileiros. A redação é ampla, sem prejuízo da interpretação constitucional e da proteção aplicável a outras pessoas.

IGUALDADE
Impede discriminação injustificada, mas igualdade não é tratar todos sempre da mesma forma. Igualdade formal: todos são iguais perante a lei. Igualdade material: busca reduzir desigualdades reais, permitindo tratamento diferenciado quando justificável (ex.: mecanismos de proteção a pessoas em situação de vulnerabilidade).

DIREITO À VIDA
Protege a existência humana e a dignidade da pessoa, além da integridade física e moral. Atenção: a Constituição não admite a pena de morte, salvo em caso de guerra declarada.

LIBERDADE DE EXPRESSÃO
A manifestação do pensamento é livre, mas é vedado o anonimato. Não autoriza ilícitos nem o uso do anonimato para impedir responsabilização. Ex.: criticar um serviço público é protegido, respeitados os limites jurídicos. Direito de resposta proporcional ao agravo e indenização por dano material, moral ou à imagem, conforme o caso. Ex.: alguém falsamente acusado em público pode buscar resposta e reparação.

LIBERDADE RELIGIOSA
Liberdade de consciência e de crença; livre exercício dos cultos e proteção aos locais de culto e suas liturgias. Ninguém será privado de direitos por motivo de crença religiosa ou convicção filosófica ou política, salvo se as invocar para se eximir de obrigação legal a todos imposta e recusar cumprir prestação alternativa prevista em lei.

INTIMIDADE, VIDA PRIVADA, HONRA E IMAGEM
Invioláveis; a violação pode gerar indenização. Ex.: instituição que divulga indevidamente informações privadas de um cliente.

DOMICÍLIO
A casa é inviolável; em regra, ninguém entra sem consentimento. Exceções: flagrante delito, desastre, prestação de socorro e, durante o dia, determinação judicial. Pegadinha: o mandado judicial, por si só, não autoriza ingresso durante a noite.

SIGILO DAS COMUNICAÇÕES
Inviolabilidade da correspondência, das comunicações telegráficas, de dados e telefônicas. A interceptação telefônica exige autorização judicial, nas hipóteses e na forma da lei, para investigação criminal ou instrução processual penal — não pode ser autorizada livremente para qualquer finalidade.

REUNIÃO
Pacífica, sem armas, em locais abertos ao público; exige prévio aviso à autoridade competente; não exige autorização; não pode frustrar outra reunião anteriormente convocada para o mesmo local. Aviso prévio não é autorização — a Administração não pode transformá-lo em autorização obrigatória.

ASSOCIAÇÃO
Plena para fins lícitos; vedada a de caráter paramilitar. Ninguém é obrigado a associar-se ou permanecer associado.

PROPRIEDADE E DESAPROPRIAÇÃO
A propriedade é garantida, mas deve atender à função social — sujeita a limites constitucionais e legais (ex.: regras urbanísticas e ambientais). Desapropriação por necessidade ou utilidade pública ou interesse social: em regra, mediante justa e prévia indenização em dinheiro, ressalvadas hipóteses constitucionais específicas. Não confunda desapropriação com confisco: há situações constitucionais excepcionais em que a propriedade pode ser retirada sem indenização, conforme os requisitos da Constituição.

ACESSO À JUSTIÇA
A lei não excluirá da apreciação do Judiciário lesão ou ameaça a direito — princípio da inafastabilidade da jurisdição.

DEVIDO PROCESSO LEGAL
Ninguém será privado da liberdade ou de seus bens sem o devido processo legal. Relaciona-se a contraditório, ampla defesa, legalidade, segurança jurídica e procedimentos justos.

CONTRADITÓRIO E AMPLA DEFESA
Garantidos aos litigantes, em processo judicial ou administrativo, e aos acusados em geral. Contraditório: conhecer os elementos do processo e participar da formação das decisões, manifestando-se e influenciando o procedimento. Ampla defesa: usar os meios e recursos legalmente disponíveis para defender seus interesses. Ex.: servidor acusado em processo administrativo conhece a acusação e apresenta defesa.

PRESUNÇÃO DE INOCÊNCIA
Ninguém será considerado culpado até o trânsito em julgado de sentença penal condenatória. Pegadinha: ser acusado não significa ser condenado.

REMÉDIOS CONSTITUCIONAIS
Habeas corpus: liberdade de locomoção, diante de violência ou coação ilegal ou ameaça. Habeas data: conhecer ou corrigir informações pessoais em registros ou bancos de dados governamentais ou de caráter público. Mandado de segurança: direito líquido e certo, não amparado por HC ou HD, diante de ilegalidade ou abuso de poder. Mandado de injunção: falta de norma regulamentadora que inviabiliza direitos e liberdades constitucionais ou prerrogativas ligadas à nacionalidade, soberania e cidadania. Ação popular: cidadão busca anular ato lesivo ao patrimônio público, à moralidade administrativa, ao meio ambiente e ao patrimônio histórico e cultural.

PEGADINHAS
Reunião: não exige autorização, exige prévio aviso. Domicílio: mandado judicial, durante o dia. HC: locomoção. HD: dados pessoais. MS: direito líquido e certo. MI: ausência de regulamentação. Ação popular: legitimidade do cidadão. Contraditório e ampla defesa: processos judiciais e administrativos. Presunção de inocência: até o trânsito em julgado.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — direitos e garantias fundamentais (Q1 a Q4)', 15 from d returning id
),
b_banc_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Conhecimentos Bancários', 'teoria', 'Contas, cartões, cheque, TED/Pix, boleto, crédito, FGTS, investimentos, seguros e suitability', 45, $$CONTAS BANCÁRIAS
Conta corrente: movimentação de dinheiro; conforme o pacote e os serviços contratados, permite depósitos, saques, transferências, pagamentos, Pix, cartões, débitos automáticos e recebimentos; pode ser usada por pessoas físicas e jurídicas.
Conta poupança: modalidade tradicional de depósito para guardar dinheiro — facilidade de movimentação, liquidez, rendimentos conforme regras aplicáveis, simplicidade e uso como reserva. Atenção: a poupança não é "sem risco em qualquer situação"; o risco de crédito está na instituição depositária, com proteção do FGC dentro dos limites e condições regulamentares.
Conta salário: destinada ao recebimento de salários, aposentadorias, pensões e outras remunerações, nos termos regulamentares; tem regras específicas, não é idêntica à conta corrente comum e pode ter serviços gratuitos obrigatórios conforme a regulamentação. Pegadinha: conta salário ≠ conta corrente.

CARTÕES
Débito: usa recursos disponíveis na conta. Ex.: R$ 500 na conta, compra de R$ 100 no débito → saldo reduzido em R$ 100.
Crédito: compras com limite concedido pela instituição; pagamento posterior, conforme as regras. Conceitos: limite, fatura, vencimento, parcelamento, pagamento mínimo, crédito rotativo.
Crédito rotativo: o cliente paga só parte da fatura e permanece com saldo financiado, conforme as regras; costuma ter custo elevado. Ex.: fatura de R$ 1.000, pagamento de R$ 300 — o saldo restante não desaparece e pode gerar encargos. Pegadinha: pagar o mínimo não quita toda a dívida.

CHEQUE
Ordem de pagamento à vista; pode ser nominal ou cruzado; depende das condições para compensação; uso menor hoje que os meios eletrônicos. Cheque cruzado: deve ser pago mediante crédito em conta, conforme as regras; o cruzamento é feito com dois traços paralelos na frente do cheque.

TRANSFERÊNCIAS
TED: transferência entre instituições financeiras, com regras de processamento, condições operacionais e horários e limites definidos pelas instituições e regras aplicáveis.
Pix: sistema de pagamentos instantâneos — transferências e pagamentos em poucos segundos, normalmente 24 horas por dia, inclusive fins de semana e feriados; pessoas e empresas. Chaves: CPF/CNPJ, telefone, e-mail, chave aleatória; também há mecanismos de iniciação de pagamento e QR Codes.
Cuidados contra fraudes: não compartilhar senhas; conferir o destinatário e o valor; não clicar em links suspeitos; desconfiar de solicitações urgentes; nunca entregar códigos de autenticação; usar canais oficiais.

BOLETO
Instrumento de cobrança e pagamento (contas de consumo, mensalidades, compras, serviços, tributos conforme os sistemas aplicáveis). Verifique beneficiário, valor, vencimento, código de barras e dados do pagamento. Boletos falsos são fraude comum.

EMPRÉSTIMOS
A instituição disponibiliza recursos que o cliente devolve conforme as condições contratadas: capital, taxa de juros, prazo, parcelas, encargos e custo efetivo total. Empréstimo pessoal: pode considerar renda, histórico de crédito, capacidade de pagamento, risco e garantias. Crédito consignado: parcelas descontadas diretamente da remuneração ou benefício, conforme as regras; desconto automático, possibilidade de taxas diferenciadas, limites legais ou regulamentares de comprometimento e análise de elegibilidade. Ex.: aposentado que contrata consignado tem parcelas descontadas do benefício.

FINANCIAMENTO
Crédito geralmente vinculado à aquisição de um bem ou finalidade específica (imobiliário, veículos, equipamentos). Empréstimo: recursos usados de forma mais livre, conforme o contrato; pode ser pessoal; pode ou não exigir garantia. Financiamento: geralmente vinculado a uma finalidade ou aquisição; frequentemente relacionado a um bem; muitas vezes tem garantia ligada ao bem.

CRÉDITO IMOBILIÁRIO
Aquisição, construção ou outras finalidades imobiliárias, conforme a linha; muito importante para a CAIXA. Pode envolver compra, construção, reforma (conforme as linhas), uso do FGTS quando permitido, garantias, avaliação do imóvel e análise de renda. Em muitos contratos usa-se alienação fiduciária: o imóvel fica vinculado como garantia da obrigação, conforme o contrato e a legislação.

FGTS
Instrumento de proteção do trabalhador; os depósitos são feitos pelo empregador nas contas vinculadas, conforme a legislação. Há hipóteses legais de movimentação — por exemplo, demissão sem justa causa (observadas as regras), aquisição de imóvel (conforme requisitos), aposentadoria, situações específicas de saúde e outras previstas em lei. Pegadinha: o trabalhador não saca o FGTS livremente em qualquer situação.

INVESTIMENTOS
Cada produto tem rentabilidade, risco, liquidez, prazo, tributação e garantias próprias.
CDB: título emitido por instituição financeira; o investidor empresta recursos e recebe remuneração conforme as condições. Prefixada: taxa definida na aplicação (ex.: 12% ao ano). Pós-fixada: acompanha um indicador (ex.: 100% do CDI). Híbrida: taxa fixa + índice (ex.: IPCA + taxa).
CDI: referência importante do mercado; um CDB de 100% do CDI acompanha o percentual do CDI indicado nas condições do produto.
LCI (Letra de Crédito Imobiliário) e LCA (Letra de Crédito do Agronegócio): podem contar com cobertura do FGC, observados limites e condições.
Tesouro Direto: pessoas físicas investem em títulos públicos federais por instituições habilitadas (Tesouro Selic, Prefixado, IPCA+); diferentes remunerações; liquidez conforme as regras do programa; risco de mercado, sobretudo se vendido antes do vencimento.

FUNDOS DE INVESTIMENTO
Reúnem recursos de vários investidores, aplicados conforme a política do fundo; o investidor compra cotas. Conceitos: cotista, cota, administrador, gestor, regulamento, política de investimento, risco e taxas.

PREVIDÊNCIA PRIVADA
Produto de planejamento financeiro de longo prazo; previdência complementar aberta: PGBL e VGBL. PGBL: pode ser interessante para quem usa o modelo completo de declaração do Imposto de Renda, observadas condições e limites. VGBL: geralmente mais usado por quem faz declaração simplificada ou não aproveita a dedução do PGBL. A tributação depende do produto, do regime escolhido e das condições.

SEGUROS
Protegem pessoas e patrimônios contra riscos (vida, residencial, automóvel, empresarial, viagem). O cliente paga um prêmio; a seguradora assume os riscos previstos e pode pagar indenização quando ocorre evento coberto. Prêmio: valor pago pelo segurado. Sinistro: ocorrência de evento coberto. Indenização: valor pago pela seguradora conforme o contrato. Apólice: documento que formaliza o seguro.

CAPITALIZAÇÃO
Produto com regras próprias que pode combinar acumulação de recursos com sorteios, conforme a modalidade; não deve ser confundido com investimento tradicional. Antes de contratar, conhecer prazo, resgate, percentual de devolução, sorteios, condições de perda, taxas e regras.

SUITABILITY
Adequação do produto ao perfil do cliente: objetivos, conhecimento, situação financeira, tolerância ao risco, prazo e necessidade de liquidez. Ex.: cliente que precisa do dinheiro em três meses não deve receber, sem explicação dos riscos, produto de prazo longo e grande risco de perda em venda antecipada. O funcionário oferece solução compatível com as necessidades do cliente, respeitando as normas da instituição.

PEGADINHAS
Débito usa recursos da conta; crédito usa limite. Pagamento mínimo da fatura não quita a dívida. CDB é título emitido por instituição financeira. LCI = crédito imobiliário; LCA = agronegócio. Tesouro Direto = títulos públicos federais. Fundo reúne recursos de cotistas. Seguro: prêmio é pago pelo segurado; sinistro é a ocorrência do evento coberto. Financiamento geralmente tem finalidade vinculada. Suitability = adequação ao perfil e objetivos do cliente.$$
  from d returning id
),
b_banc_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Conhecimentos Bancários', 'exercicios', 'Fixação — produtos e serviços bancários (Q1 a Q4)', 15 from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 30 (12 questões)', 12,
    $$Sem consultar a teoria. 12 questões: Português (3), Matemática (3), Constitucional (3) e Bancários (3).$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Resumo, caderno de erros, revisão programada e checklist do Dia 30', 8, $$RESUMO PARA MEMORIZAÇÃO
Português: assistir ao filme; aspirar ao cargo; visar ao objetivo; obedecer às regras; preferir uma coisa a outra; chegar à agência; informar algo a alguém; favorável à proposta; necessidade de ajuda.
Matemática: juros simples J = C·i·t e M = C + J. Juros compostos M = C(1+i)^t e J = M − C.
Constitucional (art. 5º): HC — locomoção; HD — dados pessoais; MS — direito líquido e certo; MI — falta de regulamentação; ação popular — cidadão e proteção do patrimônio público e de outros bens protegidos; reunião — pacífica, sem armas, com prévio aviso, sem autorização; domicílio — mandado judicial durante o dia; processo — contraditório e ampla defesa.
Bancários: débito — dinheiro da conta; crédito — limite disponibilizado; CDB — título bancário; LCI — crédito imobiliário; LCA — agronegócio; Tesouro Direto — títulos públicos federais; seguro — proteção contra riscos contratados; prêmio — pagamento do seguro; sinistro — evento coberto; suitability — adequação do produto ao cliente.

CADERNO DE ERROS
Não basta saber a alternativa correta: entenda por que as outras estavam erradas. Ex.: "Errei juros compostos porque usei a fórmula de juros simples. Preciso identificar se o enunciado diz que os juros incidem sobre o capital inicial ou sobre o montante acumulado." Os erros nas questões de hoje entram automaticamente no caderno do app.

REVISÃO PROGRAMADA
Amanhã (24h): revise os quatro assuntos por 20 a 30 minutos e resolva 5 questões de cada. Após 3 dias: 10 questões de regência e 10 de juros. Após 7 dias: simulado de 20 questões misturando os quatro conteúdos. Após 15 dias: revise os erros do art. 5º e dos produtos bancários. Após 30 dias: revisão completa dos assuntos do Dia 30, comparando com o primeiro estudo.

CHECKLIST
Estudei regência verbal e nominal e os principais verbos cobrados. Aprendi juros simples e compostos e resolvi exercícios de montante. Estudei direitos e garantias fundamentais e os remédios constitucionais. Estudei contas, cartões, empréstimos, financiamentos, investimentos e seguros. Resolvi as questões das quatro matérias, fiz o mini-simulado e anotei meus erros.
Marque este bloco como concluído para fechar o Dia 30.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a alternativa correta segundo a norma-padrão.',
   '{"A":"O candidato assistiu o treinamento.","B":"O candidato assistiu ao treinamento.","C":"O candidato aspirou o cargo.","D":"O candidato obedeceu as normas."}'::jsonb,
   'B', '"Assistir", no sentido de presenciar, exige a preposição "a". As demais erram: "aspirar" (desejar) pede "a" e "obedecer" pede "às".'),
  ((select id from b_port_ex), 2, 'Português',
   'Assinale a frase correta.',
   '{"A":"Prefiro mais estudar do que descansar.","B":"Prefiro estudar do que descansar.","C":"Prefiro estudar a descansar.","D":"Prefiro estudar que descansar."}'::jsonb,
   'C', 'A construção tradicional é "preferir uma coisa a outra", sem "mais", "do que" ou "que".'),
  ((select id from b_port_ex), 3, 'Português',
   'Complete corretamente: "O funcionário obedeceu ______ determinações da chefia."',
   '{"A":"as","B":"às","C":"das","D":"pelas"}'::jsonb,
   'B', '"Obedecer" exige a preposição "a", que se une ao artigo feminino plural: "às determinações".'),
  ((select id from b_port_ex), 4, 'Português',
   'Assinale a alternativa com regência correta.',
   '{"A":"O servidor chegou na agência, segundo a norma tradicional exigida em provas.","B":"O candidato aspira o cargo público.","C":"A funcionária foi à agência.","D":"O gerente visou ao documento, no sentido de rubricá-lo."}'::jsonb,
   'C', '"Foi à agência": destino com "a" + artigo. A erra "chegar na"; B erra "aspirar ao"; D erra porque "visar", no sentido de rubricar, é transitivo direto ("visou o documento").'),

  ((select id from b_mat_ex), 1, 'Matemática Financeira',
   'Um capital de R$ 3.000 foi aplicado a juros simples de 2% ao mês durante 5 meses. Os juros foram:',
   '{"A":"R$ 200","B":"R$ 250","C":"R$ 300","D":"R$ 350"}'::jsonb,
   'C', 'J = 3000 × 0,02 × 5 = 300.'),
  ((select id from b_mat_ex), 2, 'Matemática Financeira',
   'Uma aplicação de R$ 2.000 rende juros simples de 3% ao mês durante 4 meses. O montante será:',
   '{"A":"R$ 2.120","B":"R$ 2.200","C":"R$ 2.240","D":"R$ 2.300"}'::jsonb,
   'C', 'J = 2000 × 0,03 × 4 = 240. M = 2000 + 240 = 2240.'),
  ((select id from b_mat_ex), 3, 'Matemática Financeira',
   'R$ 1.000 foram aplicados a juros compostos de 10% ao mês durante 2 meses. O montante é:',
   '{"A":"R$ 1.200","B":"R$ 1.210","C":"R$ 1.220","D":"R$ 1.100"}'::jsonb,
   'B', 'M = 1000 × (1,10)² = 1210.'),
  ((select id from b_mat_ex), 4, 'Matemática Financeira',
   'Uma pessoa aplicou R$ 5.000 a juros simples de 1,5% ao mês durante 8 meses. Qual foi o montante?',
   '{"A":"R$ 5.400","B":"R$ 5.500","C":"R$ 5.600","D":"R$ 5.800"}'::jsonb,
   'C', 'J = 5000 × 0,015 × 8 = 600. M = 5000 + 600 = 5600.'),

  ((select id from b_const_ex), 1, 'Constitucional',
   'O princípio da inafastabilidade da jurisdição significa que:',
   '{"A":"O Poder Judiciário não pode analisar questões administrativas.","B":"A lei não pode excluir da apreciação judicial lesão ou ameaça a direito.","C":"Somente servidores públicos podem recorrer à Justiça.","D":"Toda questão deve ser resolvida exclusivamente por processo administrativo."}'::jsonb,
   'B', 'Art. 5º, XXXV: a lei não excluirá da apreciação do Judiciário lesão ou ameaça a direito.'),
  ((select id from b_const_ex), 2, 'Constitucional',
   'O remédio constitucional destinado à proteção da liberdade de locomoção é:',
   '{"A":"Habeas Data.","B":"Mandado de Segurança.","C":"Habeas Corpus.","D":"Ação Popular."}'::jsonb,
   'C', 'O habeas corpus protege a liberdade de ir e vir.'),
  ((select id from b_const_ex), 3, 'Constitucional',
   'Sobre o direito de reunião, assinale a alternativa correta.',
   '{"A":"É necessária autorização da autoridade pública.","B":"Pode ocorrer com armas, desde que pacificamente.","C":"É permitido reunir-se pacificamente, sem armas, em locais abertos ao público, com prévio aviso e sem necessidade de autorização.","D":"É proibido em locais públicos."}'::jsonb,
   'C', 'A Constituição exige prévio aviso, não autorização, e veda armas.'),
  ((select id from b_const_ex), 4, 'Constitucional',
   'O Habeas Data destina-se principalmente a:',
   '{"A":"Proteger a liberdade de locomoção.","B":"Corrigir ou conhecer informações pessoais em registros ou bancos de dados públicos, nos termos constitucionais.","C":"Anular qualquer ato administrativo.","D":"Garantir direito de reunião."}'::jsonb,
   'B', 'O habeas data trata do acesso e da correção de informações pessoais em registros ou bancos de dados governamentais ou de caráter público.'),

  ((select id from b_banc_ex), 1, 'Conhecimentos Bancários',
   'O cartão de débito caracteriza-se por:',
   '{"A":"Utilizar obrigatoriamente crédito concedido pelo banco.","B":"Utilizar recursos disponíveis na conta do cliente.","C":"Não permitir compras.","D":"Ser exclusivamente utilizado para saques."}'::jsonb,
   'B', 'O débito usa o saldo disponível na conta.'),
  ((select id from b_banc_ex), 2, 'Conhecimentos Bancários',
   'O CDB é:',
   '{"A":"Um título emitido por instituição financeira.","B":"Um seguro obrigatório.","C":"Um título exclusivamente público.","D":"Uma modalidade de cheque."}'::jsonb,
   'A', 'CDB é título de captação emitido por instituição financeira.'),
  ((select id from b_banc_ex), 3, 'Conhecimentos Bancários',
   'A LCI está relacionada principalmente:',
   '{"A":"Ao crédito imobiliário.","B":"Ao crédito exclusivamente rural.","C":"À compra de ações.","D":"Ao seguro de vida."}'::jsonb,
   'A', 'LCI = Letra de Crédito Imobiliário.'),
  ((select id from b_banc_ex), 4, 'Conhecimentos Bancários',
   'O conceito de suitability está relacionado:',
   '{"A":"À proibição de oferecer produtos financeiros.","B":"À adequação de produtos e serviços ao perfil e às necessidades do cliente.","C":"À emissão de moeda.","D":"À fiscalização de concursos públicos."}'::jsonb,
   'B', 'Suitability é a adequação do produto ao perfil, objetivos e necessidades do cliente.'),

  ((select id from b_simulado), 1, 'Português',
   'Assinale a alternativa correta segundo a norma-padrão.',
   '{"A":"O candidato assistiu o curso.","B":"O candidato obedeceu as instruções.","C":"O candidato aspirava ao cargo.","D":"O candidato preferia mais estudar do que descansar."}'::jsonb,
   'C', '"Aspirar", no sentido de desejar, exige "a".'),
  ((select id from b_simulado), 2, 'Português',
   'Assinale a alternativa correta.',
   '{"A":"Cheguei na agência, conforme a regência tradicional exigida em provas.","B":"O funcionário informou o resultado ao candidato.","C":"O candidato visou o cargo público.","D":"O servidor assistiu à paciente, no sentido de presenciar."}'::jsonb,
   'B', '"Informar algo a alguém" é construção correta. A erra "chegar na"; C erra "visar ao" (objetivo); D confunde os sentidos de assistir.'),
  ((select id from b_simulado), 3, 'Português',
   'Complete corretamente: "Ela demonstrou grande interesse ______ vaga e era favorável ______ proposta."',
   '{"A":"na — a","B":"pela — à","C":"com — na","D":"de — da"}'::jsonb,
   'B', '"Interesse pela vaga" e "favorável à proposta" (a + a = à).'),
  ((select id from b_simulado), 4, 'Matemática Financeira',
   'Um capital de R$ 4.000 foi aplicado a juros simples de 2% ao mês durante 6 meses. Os juros serão:',
   '{"A":"R$ 400","B":"R$ 420","C":"R$ 480","D":"R$ 500"}'::jsonb,
   'C', 'J = 4000 × 0,02 × 6 = 480.'),
  ((select id from b_simulado), 5, 'Matemática Financeira',
   'Uma aplicação de R$ 2.000 rende juros compostos de 5% ao mês durante 2 meses. O montante será:',
   '{"A":"R$ 2.200","B":"R$ 2.205","C":"R$ 2.210","D":"R$ 2.250"}'::jsonb,
   'B', 'M = 2000 × (1,05)² = 2000 × 1,1025 = 2205.'),
  ((select id from b_simulado), 6, 'Matemática Financeira',
   'R$ 10.000 são aplicados a juros simples de 1% ao mês durante 12 meses. O montante final será:',
   '{"A":"R$ 10.100","B":"R$ 11.000","C":"R$ 11.200","D":"R$ 12.000"}'::jsonb,
   'C', 'J = 10000 × 0,01 × 12 = 1200. M = 10000 + 1200 = 11200.'),
  ((select id from b_simulado), 7, 'Constitucional',
   'A entrada em domicílio por determinação judicial pode ocorrer:',
   '{"A":"A qualquer hora, independentemente das circunstâncias.","B":"Durante o dia, conforme a regra constitucional.","C":"Apenas com autorização do morador.","D":"Somente em caso de flagrante."}'::jsonb,
   'B', 'O mandado judicial só autoriza o ingresso durante o dia.'),
  ((select id from b_simulado), 8, 'Constitucional',
   'O remédio constitucional destinado a proteger direito líquido e certo, não amparado por habeas corpus ou habeas data, é:',
   '{"A":"Ação Popular.","B":"Habeas Corpus.","C":"Mandado de Segurança.","D":"Mandado de Injunção."}'::jsonb,
   'C', 'É a definição do mandado de segurança.'),
  ((select id from b_simulado), 9, 'Constitucional',
   'A respeito da liberdade de reunião, é correto afirmar:',
   '{"A":"Depende de autorização prévia.","B":"É permitida reunião pacífica, sem armas, com prévio aviso, sem necessidade de autorização.","C":"É permitida apenas em ambientes privados.","D":"Não possui proteção constitucional."}'::jsonb,
   'B', 'Reunião pacífica, sem armas, com prévio aviso e sem autorização.'),
  ((select id from b_simulado), 10, 'Conhecimentos Bancários',
   'Um cliente utiliza cartão de débito para pagar uma compra. O valor normalmente é:',
   '{"A":"Acrescentado à fatura do cartão de crédito.","B":"Descontado dos recursos disponíveis na conta.","C":"Financiado automaticamente pelo banco.","D":"Pago exclusivamente no mês seguinte."}'::jsonb,
   'B', 'O débito reduz o saldo disponível na conta.'),
  ((select id from b_simulado), 11, 'Conhecimentos Bancários',
   'O produto relacionado ao crédito imobiliário é:',
   '{"A":"LCA.","B":"LCI.","C":"CDB.","D":"Tesouro Selic."}'::jsonb,
   'B', 'LCI = Letra de Crédito Imobiliário.'),
  ((select id from b_simulado), 12, 'Conhecimentos Bancários',
   'Em uma operação de seguro, o valor pago pelo segurado para contratar a cobertura é denominado:',
   '{"A":"Sinistro.","B":"Indenização.","C":"Prêmio.","D":"Cota."}'::jsonb,
   'C', 'Prêmio é o valor pago pelo segurado; sinistro é o evento coberto e indenização é o que a seguradora paga.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
