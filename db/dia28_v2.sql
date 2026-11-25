-- Cadastra o Dia 28 (4h: 55+55+55+55+20). Semana 6, dia 4.
delete from days where week = 6 and day_number = 4;

with d as (
  insert into days (week, day_number, title)
  values (6, 4, 'Colocação pronominal + sistemas de equações do 1º grau + nacionalidade (art. 12) + Sistema de Pagamentos Brasileiro')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Colocação pronominal: próclise, ênclise, mesóclise e locuções verbais', 40, $$A colocação pronominal trata da posição dos pronomes oblíquos átonos em relação ao verbo. Principais: me, te, se, o, a, lhe, nos, vos, os, as, lhes. Três posições: próclise (antes do verbo), mesóclise (no meio) e ênclise (depois).

PRÓCLISE
Pronome antes do verbo. Na norma-padrão, é obrigatória em certos contextos, quando há palavra atrativa.
Palavras negativas atraem o pronome: "Não me avisaram."; "Nunca se esqueça."; "Ninguém me procurou."; "Nada lhe aconteceu."; "Jamais o encontrei." Pegadinha: "Não entregaram-me o documento" é inadequado na norma tradicional; o correto é "Não me entregaram o documento."
Pronomes relativos: "O candidato que se preparou passou."; "A pessoa que me ajudou chegou."; "O documento que lhe entreguei foi arquivado." (que, quem, onde, cujo podem atrair o pronome, conforme a construção).
Pronomes indefinidos: "Alguém me chamou."; "Todos se apresentaram."; "Muitos nos ajudaram."; "Nada lhe faltava."
Pronomes demonstrativos: "Isso me preocupa."; "Aquilo lhe interessa."; "Esta situação nos prejudica."
Conjunções subordinativas: "Quando me chamaram, eu estava ocupado."; "Se me avisarem, comparecerei."; "Embora se esforçasse, não conseguiu."; "Porque me disseram isso, fiquei preocupado."

ÊNCLISE
Pronome depois do verbo: "Entregaram-me o documento."; "Encontrou-se com o gerente."; "Avisaram-nos ontem."; "Faça-me um favor."
Quando se usa: 1) início de oração, sem palavra atrativa — "Informaram-me sobre a reunião."; "Entregaram-lhe os documentos."; "Apresentou-se ao gerente." (na norma tradicional, não se inicia oração com pronome oblíquo átono). 2) Imperativo afirmativo — "Faça-me um favor."; "Diga-lhe a verdade."; "Entreguem-nos os documentos." 3) Infinitivo — "É necessário informar-lhe o resultado."; "Quero ajudá-lo."; "Precisamos encontrar-nos." 4) Gerúndio — "Saiu, despedindo-se dos colegas."

MESÓCLISE
Pronome no meio do verbo; usada com futuro do presente ou futuro do pretérito, quando NÃO há palavra atrativa. "Entregar-lhe-ei o documento." (de "entregarei"); "Informar-me-ão sobre o resultado."; "Encontrar-se-ia com o gerente."; "Informar-lhe-ia o resultado." (de "informaria").
Com palavra atrativa, não se usa mesóclise: "Não lhe entregarei o documento." (correto) × "Não entregar-lhe-ei o documento." (inadequado na norma tradicional).

RESUMO
Próclise: "Não me avisaram." Ênclise: "Avisaram-me." Mesóclise: "Avisar-me-ão."

LOCUÇÕES VERBAIS
Locução verbal: dois ou mais verbos que funcionam juntos (vou estudar, está trabalhando, pode resolver, deve entregar). O pronome pode aparecer em posições diferentes conforme a construção: "Não me vai avisar." / "Não vai me avisar." / "Não vai avisar-me." Em provas, observe a palavra atrativa e a estrutura da locução. Formas mais tradicionais: "O funcionário se deve apresentar." / "O funcionário deve-se apresentar." / "O funcionário deve apresentar-se." Com palavra atrativa, tende-se à próclise: "O funcionário não se deve apresentar." / "O funcionário não deve se apresentar."

PEGADINHAS QUE MAIS APARECEM
"Não disseram-me nada" → Não me disseram nada. "Me entregaram o documento" → na norma tradicional: Entregaram-me o documento. "Avisar-lhe-ei amanhã" → correto (mesóclise no futuro). "Nunca esquecerei-me disso" → Nunca me esquecerei disso. "Faça-me o favor" → correto (ênclise com imperativo afirmativo). "Não faça-me isso" → Não me faça isso.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — colocação pronominal (Q1 a Q4)', 15 from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Sistemas de equações do 1º grau: substituição, adição e problemas (compras, idade, quantidades)', 40, $$O QUE É UM SISTEMA
Conjunto de duas ou mais equações com incógnitas em comum. x + y = 10 e x − y = 2: precisamos de x e y que satisfaçam as duas ao mesmo tempo. Resposta: x = 6, y = 4 (6 + 4 = 10 e 6 − 4 = 2).
Aparece em problemas de idades, compras, quantidades, valores de produtos, números, funcionários e proporções.

MÉTODO DA SUBSTITUIÇÃO
Isola-se uma incógnita numa equação e substitui-se na outra.
Ex. 1: x + y = 12 e x = 8 → 8 + y = 12 → y = 4. Ex. 2: x + y = 15 e x = 2y → 2y + y = 15 → 3y = 15 → y = 5 → x = 2 × 5 = 10.

MÉTODO DA ADIÇÃO
Somam-se as equações para eliminar uma incógnita.
Ex. 1: x + y = 20 e x − y = 4 → somando: 2x = 24 → x = 12 → 12 + y = 20 → y = 8. Ex. 2: 2x + y = 14 e x − y = 4 → somando: 3x = 18 → x = 6 → 6 − y = 4 → y = 2.

QUANDO MULTIPLICAR UMA EQUAÇÃO
Se as incógnitas não se anulam de imediato. Ex.: 2x + 3y = 16 e x + y = 6. Multiplicando a segunda por −2: −2x − 2y = −12. Somando com a primeira: y = 4. Na segunda: x + 4 = 6 → x = 2.

PROBLEMAS COM COMPRAS
2 cadernos e 3 canetas custam R$ 18; 3 cadernos e 2 canetas custam R$ 22. Caderno = x, caneta = y: 2x + 3y = 18 e 3x + 2y = 22. Multiplicando a primeira por 3 (6x + 9y = 54) e a segunda por −2 (−6x − 4y = −44): 5y = 10 → y = 2 (caneta R$ 2). 2x + 6 = 18 → x = 6 (caderno R$ 6).

PROBLEMAS DE IDADE
A soma das idades é 50 e a mais velha tem 10 anos a mais que a mais nova. x + y = 50 e y − x = 10. Somando: 2y = 60 → y = 30; x = 20.

PROBLEMAS DE QUANTIDADE
30 pessoas, homens 6 a mais que mulheres: x + y = 30 e x − y = 6 → 2x = 36 → x = 18 homens; y = 12 mulheres.

COMO ESCOLHER O MÉTODO
Uma incógnita já isolada → substituição. Coeficientes opostos ou fáceis de igualar → adição. Equação simples de substituir → substituição. Escolha o método que deixa os cálculos mais simples.

PEGADINHAS
O sistema precisa satisfazer as duas equações. Cuidado para não trocar x e y na interpretação. Em problemas de dinheiro, coloque as unidades. Leia se o problema fala em soma, diferença ou "quantidade maior". Achada uma incógnita, ainda é preciso calcular a outra. Sempre que possível, confira substituindo nas duas equações.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — sistemas de equações (Q1 a Q4)', 15 from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Nacionalidade (art. 12): natos, naturalizados, cargos privativos, extradição e perda', 40, $$O QUE É NACIONALIDADE
Vínculo jurídico e político que liga uma pessoa a um Estado, por nascimento ou aquisição posterior, conforme as regras constitucionais. No Brasil: brasileiros natos e brasileiros naturalizados.

BRASILEIROS NATOS (art. 12, I)
Adquirem a nacionalidade originariamente.
Hipótese 1 — nascimento no Brasil: os nascidos na República Federativa do Brasil, ainda que de pais estrangeiros, desde que estes não estejam a serviço de seu país. Ex.: criança nasce no Brasil de pais estrangeiros que não estão a serviço do país de origem → brasileira nata. Pegadinha: pais estrangeiros não impedem a nacionalidade nata; o que importa é se estavam a serviço de seu país.
Hipótese 2 — nascimento no exterior, pai ou mãe brasileiro a serviço do Brasil: nascidos no estrangeiro de pai brasileiro ou mãe brasileira, desde que qualquer deles esteja a serviço da República Federativa do Brasil. Ex.: servidor brasileiro em representação diplomática no exterior, filho nascido lá → brasileiro nato.
Hipótese 3 — nascimento no exterior, pai ou mãe brasileiro: nascidos no estrangeiro de pai ou mãe brasileiro, desde que sejam registrados em repartição brasileira competente OU venham a residir no Brasil e optem, em qualquer tempo, depois de atingida a maioridade, pela nacionalidade brasileira. Ex.: criança nasce na França, filha de mãe brasileira, e é registrada em repartição brasileira competente. Ou: nasce no exterior, filho de pai brasileiro, sem registro; depois vem morar no Brasil e, após a maioridade, opta pela nacionalidade brasileira.

BRASILEIROS NATURALIZADOS (art. 12, II)
Adquirem a nacionalidade na forma da lei.
Naturalização ordinária: para pessoas originárias de países de língua portuguesa, condições favorecidas — residência por um ano ininterrupto e idoneidade moral.
Naturalização extraordinária (art. 12, II, "b"): estrangeiros de qualquer nacionalidade, residentes no Brasil há mais de 15 anos ininterruptos e sem condenação penal, desde que requeiram a nacionalidade brasileira.

NATO × NATURALIZADO
Nato: nacionalidade originária; não pode ser extraditado; pode ocupar os cargos privativos de nato. Naturalizado: nacionalidade adquirida; pode ser extraditado nas hipóteses constitucionais; não pode ocupar os cargos privativos de nato.

CARGOS PRIVATIVOS DE BRASILEIRO NATO
Presidente e Vice-Presidente da República; Presidente da Câmara dos Deputados; Presidente do Senado Federal; Ministro do Supremo Tribunal Federal; carreira diplomática; oficial das Forças Armadas; Ministro de Estado da Defesa. Pegadinha: nem todo ministro de Estado precisa ser nato — o cargo reservado é o de Ministro de Estado da Defesa (ministro da Fazenda, por exemplo, não é).

EXTRADIÇÃO
Brasileiro nato: não será extraditado. Brasileiro naturalizado: pode ser extraditado (1) por crime comum praticado antes da naturalização, ou (2) por comprovado envolvimento em tráfico ilícito de entorpecentes e drogas afins, na forma constitucional.

PERDA DA NACIONALIDADE
Atenção à redação atual: cancelamento da naturalização por sentença judicial nos casos constitucionais (atividade nociva ao interesse nacional) e pedido expresso de perda da nacionalidade brasileira perante autoridade competente, ressalvadas situações que resultem em apatridia. A aquisição de outra nacionalidade, por si só, não é automaticamente causa de perda na redação atual — materiais antigos podem trazer regras desatualizadas.

QUADRO DE MEMORIZAÇÃO
Nasceu no Brasil, pais estrangeiros não a serviço de seu país: nato. Nasceu no exterior, pai ou mãe brasileiro a serviço do Brasil: nato. Nasceu no exterior, filho de brasileiro, registrado em repartição brasileira competente: nato. Nasceu no exterior, filho de brasileiro, reside no Brasil e opta após a maioridade: nato. Estrangeiro que obtém naturalização: naturalizado. Estrangeiro de país de língua portuguesa com os requisitos: naturalização ordinária facilitada. Estrangeiro com mais de 15 anos de residência, sem condenação penal, que requer: naturalização extraordinária.

PEGADINHAS
Pais estrangeiros não impedem que a criança nascida no Brasil seja nata; a exceção é pais a serviço de seu país. Nato não é extraditado; naturalizado pode ser, nas hipóteses constitucionais. Presidente da República e Ministro da Defesa são cargos de nato. Não confunda naturalização ordinária com extraordinária.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — nacionalidade (Q1 a Q4)', 15 from d returning id
),
b_banc_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Conhecimentos Bancários', 'teoria', 'SPB: liquidação, Banco Central, STR, SPI, Pix, QR Code, TED, boleto e segurança', 40, $$O QUE É O SPB
Conjunto de entidades, sistemas, procedimentos e regras relacionados ao processamento e à liquidação de pagamentos e transferências de recursos e de ativos financeiros no Brasil. Permite que operações financeiras ocorram de forma organizada e segura: transferências entre bancos, pagamentos, liquidação de operações financeiras, transferências de recursos entre instituições e operações com títulos e valores mobiliários.

POR QUE IMPORTA
Numa transferência de R$ 10.000 entre bancos, o sistema precisa garantir que a ordem seja recebida, a operação processada, os valores movimentados conforme as regras, a operação liquidada e que as instituições tenham segurança na movimentação. O SPB contribui para a segurança e eficiência dessas operações.

LIQUIDAÇÃO FINANCEIRA
Processo pelo qual ocorre a transferência efetiva dos recursos relacionados a uma operação — o cumprimento financeiro da operação. Processamento: a operação é recebida, analisada e encaminhada conforme os procedimentos do sistema. Liquidação: ocorre a transferência efetiva dos recursos.

BANCO CENTRAL E O SPB
Regulamenta e supervisiona sistemas de pagamento dentro de suas competências; zela pelo funcionamento eficiente e seguro do sistema; atua na infraestrutura de liquidação; acompanha riscos dos sistemas de pagamento.

STR — SISTEMA DE TRANSFERÊNCIA DE RESERVAS
Operado pelo Banco Central. Usado para transferência de fundos entre instituições participantes, com liquidação em tempo real, usando recursos mantidos em contas apropriadas no Banco Central; importante para a liquidação de operações financeiras. Ex.: o Banco A transfere recursos ao Banco B, processados no sistema correspondente, conforme as regras do STR.

SPI — SISTEMA DE PAGAMENTOS INSTANTÂNEOS
Infraestrutura central de liquidação do Pix: liquidação instantânea, funcionamento contínuo, participação de instituições autorizadas, segurança e disponibilidade. Atenção: o Pix é o arranjo de pagamento instantâneo; o SPI é a infraestrutura central que liquida as operações Pix entre participantes. Não confunda os dois.

PIX
Criado para pagamentos e transferências instantâneas: disponibilidade contínua, rapidez, facilidade, uso de chaves, pagamentos por QR Code, transferências entre pessoas e empresas, pagamentos a estabelecimentos. Chaves: CPF/CNPJ, e-mail, telefone, chave aleatória — a chave facilita a identificação da conta de recebimento. Ex.: para receber R$ 50, em vez de informar todos os dados bancários, a pessoa informa sua chave Pix.

QR CODE
Facilita pagamentos em lojas, restaurantes, estabelecimentos, contas e transferências. Estático: pode servir a múltiplas cobranças, conforme a configuração (ex.: pequena loja que recebe pagamentos). Dinâmico: traz informações específicas de determinada cobrança (ex.: cobrança com valor definido).

TED
Transferência eletrônica entre instituições financeiras: usa dados bancários do destinatário, tem processamento conforme regras e horários aplicáveis e não tem as mesmas características do Pix.
Pix × TED: Pix é instantâneo, funciona continuamente, pode usar chave e é sistema de pagamento instantâneo. A TED não é necessariamente instantânea, depende das regras de funcionamento, a identificação por chave não é seu mecanismo tradicional e não é sistema de pagamento instantâneo. Ambos transferem entre instituições.

BOLETO BANCÁRIO
Instrumento de cobrança e pagamento: contas de consumo, compras, mensalidades, serviços e cobranças empresariais. Elementos: beneficiário, pagador, valor, vencimento, código de barras e linha digitável. Ex.: empresa envia boleto de R$ 150; o cliente paga no banco, aplicativo ou canal autorizado, e o pagamento é processado e liquidado conforme as regras.

DÉBITO AUTOMÁTICO
Paga contas diretamente da conta do cliente mediante autorização (água, luz, telefone, internet, mensalidades). Acompanhe saldo disponível, data de vencimento, autorização e confirmação do pagamento.

RISCOS EM PAGAMENTOS ELETRÔNICOS
Phishing: mensagem falsa para obter dados do cliente. Falso atendimento: golpista se passa por funcionário do banco. QR Code adulterado: cliente é direcionado a pagamento fraudulento. Engenharia social: manipulação emocional para obter informações ou transferências.
Boas práticas: não compartilhar senhas; não informar códigos de autenticação; conferir o destinatário antes de transferir; verificar o valor; não clicar em links suspeitos; usar canais oficiais; desconfiar de pedidos urgentes de transferência.

PEGADINHAS
Pix só funciona em dias úteis: falso (funciona continuamente). STR é operado pelo Banco Central: verdadeiro. SPI é a infraestrutura central de liquidação do Pix: verdadeiro. TED e Pix são exatamente iguais: falso. Boleto é instrumento de cobrança e pagamento: verdadeiro. QR Code garante que a cobrança seja legítima: falso — é preciso conferir os dados. Liquidação é a transferência efetiva dos recursos da operação: verdadeiro.$$
  from d returning id
),
b_banc_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Conhecimentos Bancários', 'exercicios', 'Fixação — Sistema de Pagamentos Brasileiro (Q1 a Q4)', 15 from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 28 (12 questões)', 12,
    $$Sem consultar o material. 12 questões misturando colocação pronominal, sistemas de equações, nacionalidade e Sistema de Pagamentos Brasileiro.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Caderno de erros, revisão programada e resumo do Dia 28', 8, $$CADERNO DE ERROS
Marque o que precisa reforçar: próclise (palavras negativas; pronomes e conjunções atrativas); ênclise (início de oração e imperativo afirmativo); mesóclise (futuro do presente e do pretérito); sistemas pelos métodos da adição e da substituição; problemas de compras e valores; brasileiros natos (hipóteses do art. 12); naturalizados; cargos privativos de nato; extradição; SPB; STR e SPI; Pix, TED, boleto e liquidação. Os erros nas questões de hoje entram automaticamente no caderno do app.

REVISÃO PROGRAMADA
Amanhã: colocação pronominal + 5 questões. Em 3 dias: sistemas de equações. Em 7 dias: nacionalidade + questões constitucionais. Em 15 dias: SPB, Pix, STR e SPI. Em 30 dias: revisão geral do Dia 28.
Como revisar: tente explicar o assunto sem olhar; resolva uma questão; confira; identifique onde errou; refaça sem consultar a resolução.

RESUMO FINAL
Português: próclise antes do verbo, ênclise depois, mesóclise no meio; palavras negativas atraem o pronome. Matemática: substituição isola uma incógnita; adição elimina uma incógnita somando as equações. Constitucional: nato tem nacionalidade originária; naturalizado, adquirida; há cargos privativos de nato; nato não é extraditado. Bancários: SPB é a estrutura de pagamentos e liquidação; STR transfere reservas entre instituições; SPI liquida o Pix; Pix é pagamento instantâneo.
Marque este bloco como concluído para fechar o Dia 28 e a Semana 6.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a alternativa correta conforme a norma-padrão.',
   '{"A":"Não disseram-me a verdade.","B":"Nunca esquecerei-me dessa situação.","C":"Não me informaram o resultado.","D":"Me entregaram os documentos."}'::jsonb,
   'C', 'A palavra negativa "não" atrai o pronome (próclise). As demais erram a colocação: A e B têm ênclise/mesóclise após negativa, e D inicia a oração com pronome átono.'),
  ((select id from b_port_ex), 2, 'Português',
   'Assinale a alternativa em que ocorre mesóclise.',
   '{"A":"Não me avisaram.","B":"Entregaram-me a carta.","C":"Avisar-me-ão sobre o resultado.","D":"Ela se arrependeu."}'::jsonb,
   'C', '"Avisar-me-ão" tem o pronome no meio do verbo, no futuro do presente, sem palavra atrativa.'),
  ((select id from b_port_ex), 3, 'Português',
   'Assinale a frase correta.',
   '{"A":"Faça-me um favor.","B":"Não faça-me um favor.","C":"Nunca disseram-me isso.","D":"Me avisaram ontem, conforme a norma-padrão tradicional."}'::jsonb,
   'A', 'Imperativo afirmativo admite ênclise. B e C têm palavra negativa (exigem próclise) e D inicia a oração com pronome átono.'),
  ((select id from b_port_ex), 4, 'Português',
   'A palavra que exige próclise na frase "Nunca ___ disseram a verdade" é:',
   '{"A":"A verdade.","B":"Nunca.","C":"Disseram.","D":"Verdade."}'::jsonb,
   'B', '"Nunca" é palavra negativa e atrai o pronome para antes do verbo.'),

  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Resolva o sistema: x + y = 14 e x − y = 4.',
   '{"A":"x = 8 e y = 6","B":"x = 9 e y = 5","C":"x = 10 e y = 4","D":"x = 7 e y = 7"}'::jsonb,
   'B', 'Somando: 2x = 18 → x = 9; y = 14 − 9 = 5.'),
  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Resolva o sistema: 2x + y = 13 e x + y = 8.',
   '{"A":"x = 3 e y = 5","B":"x = 4 e y = 4","C":"x = 5 e y = 3","D":"x = 6 e y = 2"}'::jsonb,
   'C', 'Subtraindo as equações: x = 5; então y = 8 − 5 = 3.'),
  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'A soma de dois números é 40 e a diferença entre eles é 8. O maior número é:',
   '{"A":"20","B":"22","C":"24","D":"26"}'::jsonb,
   'C', 'Somando as equações: 2x = 48 → x = 24 (o menor é 16).'),
  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Uma pessoa comprou 2 produtos A e 1 produto B por R$ 16. Outra comprou 1 produto A e 2 produtos B por R$ 14. O preço do produto A é:',
   '{"A":"R$ 4","B":"R$ 5","C":"R$ 6","D":"R$ 8"}'::jsonb,
   'C', '2A + B = 16 e A + 2B = 14. Multiplicando a segunda por 2 (2A + 4B = 28) e subtraindo a primeira: 3B = 12 → B = 4. Então 2A + 4 = 16 → A = 6.'),

  ((select id from b_const_ex), 1, 'Constitucional',
   'Uma criança nasce no Brasil, filha de estrangeiros que não estão a serviço de seu país. Conforme a Constituição, ela será:',
   '{"A":"Brasileira naturalizada.","B":"Estrangeira.","C":"Brasileira nata.","D":"Brasileira somente após completar 18 anos."}'::jsonb,
   'C', 'Nascido no Brasil, ainda que de pais estrangeiros que não estejam a serviço de seu país, é brasileiro nato.'),
  ((select id from b_const_ex), 2, 'Constitucional',
   'É cargo privativo de brasileiro nato:',
   '{"A":"Ministro da Defesa.","B":"Ministro da Fazenda.","C":"Governador de Estado.","D":"Prefeito municipal."}'::jsonb,
   'A', 'O Ministro de Estado da Defesa é privativo de nato; os demais ministros, governadores e prefeitos não.'),
  ((select id from b_const_ex), 3, 'Constitucional',
   'O brasileiro naturalizado poderá ser extraditado:',
   '{"A":"Em qualquer hipótese.","B":"Nunca.","C":"Por crime comum praticado antes da naturalização ou por comprovado envolvimento em tráfico ilícito de entorpecentes e drogas afins, conforme a Constituição.","D":"Somente por crimes políticos."}'::jsonb,
   'C', 'São as duas hipóteses constitucionais de extradição do naturalizado.'),
  ((select id from b_const_ex), 4, 'Constitucional',
   'A naturalização extraordinária pode ser concedida ao estrangeiro que:',
   '{"A":"Resida no Brasil por cinco anos, independentemente de outras condições.","B":"Resida no Brasil por mais de 15 anos ininterruptos, não tenha condenação penal e requeira a nacionalidade.","C":"Resida no Brasil por um ano, independentemente de nacionalidade.","D":"Nasça fora do Brasil e tenha qualquer parente brasileiro."}'::jsonb,
   'B', 'Art. 12, II, "b": mais de 15 anos ininterruptos, sem condenação penal e requerimento.'),

  ((select id from b_banc_ex), 1, 'Conhecimentos Bancários',
   'O Sistema de Pagamentos Brasileiro tem como principal finalidade:',
   '{"A":"Organizar exclusivamente o mercado de empréstimos.","B":"Processar e liquidar pagamentos e transferências de recursos e ativos financeiros.","C":"Realizar somente operações de crédito imobiliário.","D":"Fiscalizar exclusivamente cartões de crédito."}'::jsonb,
   'B', 'O SPB organiza o processamento e a liquidação de pagamentos e transferências.'),
  ((select id from b_banc_ex), 2, 'Conhecimentos Bancários',
   'O STR é um sistema:',
   '{"A":"Operado pelo Banco Central para transferência de fundos entre instituições participantes.","B":"Exclusivo para transferências de pessoas físicas.","C":"Utilizado exclusivamente para pagamentos por cartão.","D":"Que substituiu integralmente todos os sistemas bancários."}'::jsonb,
   'A', 'O STR é operado pelo Banco Central e liquida transferências entre instituições em tempo real.'),
  ((select id from b_banc_ex), 3, 'Conhecimentos Bancários',
   'O SPI está relacionado:',
   '{"A":"À emissão de cartões de crédito.","B":"À liquidação das transações do Pix.","C":"À concessão de financiamento imobiliário.","D":"À emissão de boletos exclusivamente."}'::jsonb,
   'B', 'O SPI é a infraestrutura central de liquidação do Pix.'),
  ((select id from b_banc_ex), 4, 'Conhecimentos Bancários',
   'Uma das principais características do Pix é:',
   '{"A":"Funcionamento somente em dias úteis.","B":"Necessidade de informar obrigatoriamente agência e conta em todas as operações.","C":"Possibilidade de realizar pagamentos e transferências instantâneas continuamente.","D":"Ser exclusivamente uma modalidade de empréstimo."}'::jsonb,
   'C', 'O Pix permite pagamentos instantâneos continuamente e pode usar chaves.'),

  ((select id from b_simulado), 1, 'Português',
   'Assinale a frase correta conforme a norma-padrão.',
   '{"A":"Não disseram-me nada.","B":"Nunca me avisaram.","C":"Me entregaram o relatório.","D":"Não avisaram-me."}'::jsonb,
   'B', 'Palavra negativa ("nunca") exige próclise.'),
  ((select id from b_simulado), 2, 'Português',
   'A colocação pronominal em "Entregar-lhe-ei o documento" é:',
   '{"A":"Próclise.","B":"Ênclise.","C":"Mesóclise.","D":"Nenhuma das anteriores."}'::jsonb,
   'C', 'O pronome está no meio do verbo, no futuro do presente: mesóclise.'),
  ((select id from b_simulado), 3, 'Português',
   'Assinale a alternativa correta.',
   '{"A":"Não faça-me isso.","B":"Faça-me um favor.","C":"Nunca disseram-me a verdade.","D":"Me informaram ontem, conforme a norma tradicional."}'::jsonb,
   'B', 'Imperativo afirmativo admite ênclise. As demais erram a colocação.'),
  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Resolva o sistema: x + y = 12 e x − y = 4.',
   '{"A":"x = 6 e y = 6","B":"x = 8 e y = 4","C":"x = 9 e y = 3","D":"x = 7 e y = 5"}'::jsonb,
   'B', 'Somando: 2x = 16 → x = 8; y = 4.'),
  ((select id from b_simulado), 5, 'Matemática/RLM',
   'Resolva: 2x + y = 11 e x + y = 7.',
   '{"A":"x = 2 e y = 5","B":"x = 3 e y = 4","C":"x = 4 e y = 3","D":"x = 5 e y = 2"}'::jsonb,
   'C', 'Subtraindo as equações: x = 4; então y = 7 − 4 = 3.'),
  ((select id from b_simulado), 6, 'Matemática/RLM',
   'A soma de dois números é 32 e a diferença é 10. O maior é:',
   '{"A":"19","B":"20","C":"21","D":"22"}'::jsonb,
   'C', 'Somando as equações: 2x = 42 → x = 21 (o menor é 11).'),
  ((select id from b_simulado), 7, 'Constitucional',
   'Uma criança nasce no Brasil, filha de estrangeiros que não estão a serviço de seu país. Ela é:',
   '{"A":"Brasileira naturalizada.","B":"Brasileira nata.","C":"Estrangeira.","D":"Brasileira somente após naturalização."}'::jsonb,
   'B', 'Nascido no Brasil (pais não a serviço de seu país): brasileiro nato.'),
  ((select id from b_simulado), 8, 'Constitucional',
   'Qual cargo é privativo de brasileiro nato?',
   '{"A":"Ministro da Defesa.","B":"Prefeito.","C":"Governador.","D":"Ministro da Fazenda."}'::jsonb,
   'A', 'O Ministro de Estado da Defesa é privativo de nato.'),
  ((select id from b_simulado), 9, 'Constitucional',
   'O brasileiro naturalizado pode ser extraditado:',
   '{"A":"Em qualquer situação.","B":"Nunca.","C":"Nas hipóteses constitucionais específicas.","D":"Somente por crime político."}'::jsonb,
   'C', 'Apenas nas hipóteses constitucionais (crime comum antes da naturalização ou tráfico de drogas).'),
  ((select id from b_simulado), 10, 'Conhecimentos Bancários',
   'O SPB é relacionado:',
   '{"A":"À organização e liquidação de pagamentos e transferências financeiras.","B":"Somente à concessão de empréstimos.","C":"Exclusivamente ao mercado imobiliário.","D":"Apenas à emissão de cartões."}'::jsonb,
   'A', 'O SPB organiza e liquida pagamentos e transferências.'),
  ((select id from b_simulado), 11, 'Conhecimentos Bancários',
   'O STR é operado:',
   '{"A":"Pela CVM.","B":"Pelo Banco Central.","C":"Pelo INSS.","D":"Exclusivamente por bancos comerciais."}'::jsonb,
   'B', 'O STR é operado pelo Banco Central.'),
  ((select id from b_simulado), 12, 'Conhecimentos Bancários',
   'O Pix caracteriza-se principalmente por:',
   '{"A":"Funcionar exclusivamente em horário comercial.","B":"Ser um sistema de pagamentos instantâneos e contínuo.","C":"Ser um investimento de renda fixa.","D":"Ser um sistema exclusivo de crédito."}'::jsonb,
   'B', 'O Pix é pagamento instantâneo, com funcionamento contínuo.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
