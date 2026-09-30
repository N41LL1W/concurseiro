-- Substitui o Dia 2 pela versão completa e robusta.
-- Apaga o Dia 2 antigo (blocos, questões, respostas e conclusões em cascata) e recadastra do zero.
delete from days where week = 1 and day_number = 2;

with d as (
  insert into days (week, day_number, title)
  values (1, 2, 'Razão, proporção, regra de três e porcentagem + Administrativo (LIMPE completo)')
  returning id
),
b_mat_teoria1 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Matemática/RLM', 'teoria', 'Razão, proporção e regra de três', 70, $$Sequência de hoje: Razão → Proporção → Regra de três → Porcentagem → Variações percentuais.

1. RAZÃO
Razão é uma comparação entre duas grandezas por meio de uma divisão.
Ex.: uma agência tem 20 funcionários, sendo 5 caixas. Razão entre caixas e funcionários = 5/20, que simplifica para 1/4 — para cada 4 funcionários, 1 é caixa.
Cuidado com a ordem: razão entre homens e mulheres com 20 homens e 30 mulheres é 20/30 = 2/3; já mulheres/homens seria 30/20 = 3/2. A ordem importa.

2. RAZÃO COM GRANDEZAS DIFERENTES
Ex.: um veículo percorre 240 km em 4 horas. Razão = 240/4 = 60, ou seja, 60 km/h — uma razão entre distância e tempo.

3. PROPORÇÃO
Proporção é uma igualdade entre duas razões. Ex.: 2/3 = 4/6 é uma proporção.

4. PROPRIEDADE FUNDAMENTAL
Se a/b = c/d, podemos multiplicar em cruz: a×d = b×c.
Ex.: x/5 = 12/15 → multiplicando em cruz: 15x = 60 → x = 4.

5. REGRA DE TRÊS
Aparece quando conhecemos três valores e precisamos descobrir o quarto.
Ex.: 4 funcionários organizam 200 documentos em certo período. Quantos documentos 6 funcionários organizam, no mesmo ritmo? Mais funcionários → mais documentos: relação direta. 4/6 = 200/x → 4x = 1200 → x = 300 documentos.

6. GRANDEZAS DIRETAMENTE PROPORCIONAIS
Uma aumenta, a outra também aumenta na mesma proporção. Ex.: mais funcionários → maior produção; mais produtos → maior preço total; mais horas trabalhadas → maior remuneração (quando proporcional ao tempo).

7. GRANDEZAS INVERSAMENTE PROPORCIONAIS
Uma aumenta, a outra diminui. Ex.: 4 trabalhadores fazem uma tarefa em 12 dias. Com 8 trabalhadores, no mesmo ritmo: mais trabalhadores → menos dias → inversamente proporcionais. 4×12 = 8×x → 48 = 8x → x = 6 dias.
Pegadinha: não escolha "multiplicação cruzada" no automático — primeiro pergunte se a relação é direta ou inversa.

8. COMO IDENTIFICAR DIRETA OU INVERSA
Imagine que uma grandeza aumentou: se a outra também precisa aumentar, é direta; se a outra precisa diminuir, é inversa.$$
  from d returning id
),
b_mat_teoria2 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 2, 'Matemática/RLM', 'teoria', 'Porcentagem, aumentos e descontos (inclusive sucessivos)', 30, $$9. PORCENTAGEM
Porcentagem significa "por cem". 10% = 10/100 = 0,10. 25% = 0,25. 50% = 0,50. 75% = 0,75.

10. CALCULANDO UMA PORCENTAGEM
Quanto é 20% de 500? 500 × 0,20 = 100. (Ou 500 × 20/100 = 100.)

11. PORCENTAGENS IMPORTANTES PARA MEMORIZAR
10% = 1/10 = 0,10 | 20% = 1/5 = 0,20 | 25% = 1/4 = 0,25 | 50% = 1/2 = 0,50 | 75% = 3/4 = 0,75 | 100% = 1 = 1,00.

12. AUMENTO PERCENTUAL
Um produto de R$ 200 sofre aumento de 15%. 15% de 200 = 30. Novo valor: 200 + 30 = R$ 230.
Método do fator: aumento de 15% → fator 1 + 0,15 = 1,15. Então 200 × 1,15 = 230. Esse método é essencial para aumentos sucessivos.

13. DESCONTO PERCENTUAL
Produto de R$ 500 com desconto de 20%: desconto = 500 × 0,20 = 100. Preço final = 500 − 100 = 400. Ou direto: 500 × 0,80 = 400.

14. FATOR DE DESCONTO
Desconto de 20% → fator 1 − 0,20 = 0,80. Então 500 × 0,80 = 400.

15. AUMENTOS SUCESSIVOS
Produto de R$ 100 aumenta 20% e depois mais 10%. Primeiro: 100 × 1,20 = 120. Segundo: 120 × 1,10 = 132. Valor final: R$ 132. O aumento total foi 32% — NÃO é simplesmente 20% + 10% = 30%.

16. DESCONTOS SUCESSIVOS
Produto de R$ 100 com desconto de 20% e depois mais 10%. Primeiro: 100 × 0,80 = 80. Segundo: 80 × 0,90 = 72. Preço final: R$ 72. Desconto total: 28% — não é 30%.

17. PEGADINHA — VOLTAR AO VALOR ORIGINAL
Um produto de R$ 100 aumenta 20% e vai para R$ 120. Para voltar a R$ 100, o desconto necessário não é 20%, e sim 20/120 ≈ 16,67%. Aumento de 20% não é "desfeito" com desconto de 20% — isso aparece muito em concursos.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 3, 'Matemática/RLM', 'exercicios', 'Questões de razão, proporção, regra de três e porcentagem (Q1 a Q10)', 40
  from d returning id
),
b_adm_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 4, 'Administrativo', 'teoria', 'Art. 37, CF — Princípios da Administração Pública (LIMPE completo)', 70, $$O caput do art. 37 da Constituição estabelece princípios que a Administração Pública deve observar — o famoso LIMPE: Legalidade, Impessoalidade, Moralidade, Publicidade, Eficiência.

1. LEGALIDADE
O agente público deve atuar conforme a lei. Enquanto o particular, em regra, pode fazer tudo que a lei não proíbe, a Administração está vinculada à legalidade e precisa de fundamento jurídico para agir — um servidor não pode criar obrigação para o cidadão só porque considera conveniente.
Pegadinha: "o administrador público pode fazer tudo o que a lei não proíbe" — como regra geral para a Administração, isso é FALSO. A Administração está vinculada à legalidade.

2. IMPESSOALIDADE
A Administração não deve agir para beneficiar ou prejudicar alguém por razões pessoais; a atuação deve buscar o interesse público e a finalidade pública. Ex.: um prefeito que determina contratação para favorecer um amigo viola a impessoalidade.

3. MORALIDADE
Não basta o ato ser formalmente permitido: a Administração também deve observar ética, boa-fé, honestidade, probidade e lealdade institucional.

4. PUBLICIDADE
Os atos administrativos devem, em regra, ser divulgados para permitir transparência, controle e conhecimento pela sociedade. Mas publicidade não significa que absolutamente tudo seja público em qualquer circunstância — a própria Constituição admite hipóteses de restrição de acesso quando houver fundamento jurídico.

5. EFICIÊNCIA
A Administração deve buscar bons resultados, qualidade, produtividade, melhor utilização dos recursos e redução de desperdícios. A eficiência foi incorporada expressamente ao caput do art. 37 pela Emenda Constitucional nº 19/1998.

RESUMO DO LIMPE
Legalidade = agir conforme a lei. Impessoalidade = sem favorecimento pessoal. Moralidade = ética/probidade na atuação administrativa. Publicidade = transparência/divulgação, respeitadas as exceções legais. Eficiência = buscar bons resultados com adequada utilização dos recursos públicos.

COMO A BANCA COBRA (situações práticas)
Servidor favorece parente → impessoalidade. Administrador age sem respaldo legal → legalidade. Agente pratica ato desonesto → moralidade. Administração esconde informação pública sem justificativa → publicidade. Órgão desperdiça recursos e apresenta resultados ruins → eficiência.

LEGALIDADE × MORALIDADE — não confunda
Legalidade pergunta: "existe autorização/base legal para essa atuação?". Moralidade pergunta: "a atuação é ética, proba e compatível com os padrões exigidos da Administração?". Um mesmo comportamento pode precisar ser analisado sob mais de um princípio.

PUBLICIDADE NÃO É PROPAGANDA
A finalidade da publicidade administrativa é dar transparência aos atos — não é propaganda pessoal do governante. A publicidade dos atos, programas, obras, serviços e campanhas dos órgãos públicos deve ter caráter educativo, informativo ou de orientação social, sem elementos que caracterizem promoção pessoal de autoridades ou servidores. Isso é muito cobrado em prova.

EFICIÊNCIA NÃO É "FAZER MAIS RÁPIDO, DO JEITO QUE FOR"
Eficiência envolve bons resultados e adequada utilização dos recursos — não basta atender muita gente se a qualidade e os resultados forem ruins.$$
  from d returning id
),
b_lei_seca as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Administrativo', 'revisao', 'Lei Seca (art. 37, caput e §1º) + desafio final', 20, $$LEI SECA — TAREFA DE HOJE
Leia diretamente na Constituição Federal:
- Art. 37, caput
- Art. 37, §1º — especialmente a parte sobre a publicidade dos atos, programas, obras, serviços e campanhas dos órgãos públicos.
Objetivo de hoje não é decorar tudo: entender → ler → revisar → fazer questões.

DESAFIO FINAL — responda sem consultar o material
Matemática:
1. O que é razão?
2. Qual a diferença entre razão e proporção?
3. Como saber se uma regra de três é direta ou inversa?
4. Quanto é 25% de 800?
5. Um produto de R$ 200 aumenta 10%. Qual o novo preço?
6. Um produto de R$ 200 sofre desconto de 10%. Qual o novo preço?
7. Por que dois aumentos sucessivos de 10% não correspondem a um aumento total de 20%?

Administrativo:
8. O que significa LIMPE?
9. Qual princípio está relacionado ao favorecimento pessoal?
10. Qual princípio exige atuação conforme a lei?
11. Qual princípio está relacionado à ética e probidade?
12. Qual princípio está relacionado à transparência?
13. Qual princípio busca melhores resultados?

CADERNO DE ERROS — DIA 2
Para cada questão errada, registre apenas: a questão, sua resposta, a resposta correta, por que errou e a regra que precisa lembrar. Não copie páginas inteiras — registre o erro e a regra. Ex.: "Questão 5 — Matemática. Errei porque tratei grandezas inversamente proporcionais como diretas. Regra: quando uma aumenta e a outra diminui, verificar se são inversamente proporcionais."
As questões que você errar nos exercícios de hoje já entram automaticamente nesse caderno — aqui é só para os erros do desafio final, que você resolve de memória.
Marque este bloco como concluído para fechar o Dia 2.$$
  from d returning id
),
b_adm_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Administrativo', 'exercicios', 'Questões sobre o LIMPE e o art. 37 (Q11 a Q20)', 30
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'A razão entre 18 e 24, na forma simplificada, é:',
   '{"A":"2/3","B":"3/4","C":"4/3","D":"6/8","E":"9/12"}'::jsonb,
   'B', '18/24 simplifica dividindo por 6: 3/4. D e E são frações equivalentes, mas não estão simplificadas.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Em uma repartição há 30 servidores, dos quais 12 trabalham no atendimento ao público. A razão entre servidores do atendimento e o total de servidores é:',
   '{"A":"2/5","B":"3/5","C":"5/2","D":"12/18","E":"18/30"}'::jsonb,
   'A', '12/30 simplifica dividindo por 6: 2/5.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Se x/8 = 15/20, então x é:',
   '{"A":"4","B":"5","C":"6","D":"7","E":"8"}'::jsonb,
   'C', 'Multiplicando em cruz: 20x = 120 → x = 6.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Cinco funcionários analisam 150 processos em determinado período. Mantendo o mesmo ritmo, oito funcionários analisarão:',
   '{"A":"180","B":"200","C":"220","D":"240","E":"250"}'::jsonb,
   'D', 'Regra de três direta: 5/8 = 150/x → 5x = 1200 → x = 240.'),

  ((select id from b_mat_ex), 5, 'Matemática/RLM',
   'Se 6 trabalhadores realizam uma tarefa em 15 dias, mantendo-se as mesmas condições, 10 trabalhadores realizarão a mesma tarefa em:',
   '{"A":"6 dias","B":"8 dias","C":"9 dias","D":"10 dias","E":"12 dias"}'::jsonb,
   'C', 'Regra de três inversa: 6×15 = 10×x → 90 = 10x → x = 9 dias.'),

  ((select id from b_mat_ex), 6, 'Matemática/RLM',
   'Quanto corresponde a 15% de R$ 800?',
   '{"A":"R$ 80","B":"R$ 100","C":"R$ 120","D":"R$ 140","E":"R$ 160"}'::jsonb,
   'C', '800 × 0,15 = 120.'),

  ((select id from b_mat_ex), 7, 'Matemática/RLM',
   'Um salário de R$ 2.000 sofre aumento de 12%. O novo salário será:',
   '{"A":"R$ 2.120","B":"R$ 2.200","C":"R$ 2.220","D":"R$ 2.240","E":"R$ 2.260"}'::jsonb,
   'D', '2000 × 1,12 = 2240.'),

  ((select id from b_mat_ex), 8, 'Matemática/RLM',
   'Um produto de R$ 600 sofre desconto de 25%. Seu preço passa a ser:',
   '{"A":"R$ 400","B":"R$ 425","C":"R$ 450","D":"R$ 475","E":"R$ 500"}'::jsonb,
   'C', '600 × 0,75 = 450.'),

  ((select id from b_mat_ex), 9, 'Matemática/RLM',
   'Um produto custa R$ 500 e sofre dois aumentos sucessivos: primeiro de 10% e depois de 20%. O preço final será:',
   '{"A":"R$ 600","B":"R$ 630","C":"R$ 650","D":"R$ 660","E":"R$ 680"}'::jsonb,
   'D', '500 × 1,10 = 550. Depois 550 × 1,20 = 660. O aumento total não é 30%, é 32%.'),

  ((select id from b_mat_ex), 10, 'Matemática/RLM',
   'Um produto de R$ 1.000 recebe descontos sucessivos de 10% e 20%. O preço final será:',
   '{"A":"R$ 700","B":"R$ 720","C":"R$ 750","D":"R$ 780","E":"R$ 800"}'::jsonb,
   'B', '1000 × 0,90 = 900. Depois 900 × 0,80 = 720. O desconto total não é 30%, é 28%.'),

  ((select id from b_adm_ex), 1, 'Administrativo',
   'São princípios expressamente previstos no caput do art. 37 da Constituição Federal:',
   '{"A":"legalidade, soberania, moralidade, publicidade e eficiência.","B":"legalidade, impessoalidade, moralidade, publicidade e eficiência.","C":"legalidade, cidadania, moralidade, publicidade e eficiência.","D":"legalidade, impessoalidade, probidade, publicidade e eficiência.","E":"legalidade, impessoalidade, moralidade, transparência e eficiência."}'::jsonb,
   'B', 'O LIMPE é exatamente: legalidade, impessoalidade, moralidade, publicidade e eficiência. As demais trocam um dos cinco por soberania, cidadania, probidade ou transparência, que não são os termos literais do caput.'),

  ((select id from b_adm_ex), 2, 'Administrativo',
   'O princípio segundo o qual a Administração Pública deve atuar de acordo com a lei é o da:',
   '{"A":"moralidade.","B":"publicidade.","C":"legalidade.","D":"eficiência.","E":"impessoalidade."}'::jsonb,
   'C', 'Legalidade: a Administração só pode agir com fundamento jurídico.'),

  ((select id from b_adm_ex), 3, 'Administrativo',
   'Um agente público utiliza sua posição para favorecer pessoalmente um amigo. A situação descrita afronta especialmente o princípio da:',
   '{"A":"publicidade.","B":"eficiência.","C":"impessoalidade.","D":"continuidade.","E":"especialidade."}'::jsonb,
   'C', 'Favorecimento pessoal viola diretamente a impessoalidade: deve prevalecer o interesse público.'),

  ((select id from b_adm_ex), 4, 'Administrativo',
   'A atuação administrativa pautada pela ética, honestidade e probidade está relacionada especialmente ao princípio da:',
   '{"A":"legalidade.","B":"moralidade.","C":"publicidade.","D":"eficiência.","E":"hierarquia."}'::jsonb,
   'B', 'Moralidade: a Administração deve observar padrões éticos, não bastando o ato ser formalmente permitido.'),

  ((select id from b_adm_ex), 5, 'Administrativo',
   'A divulgação dos atos administrativos, observadas as hipóteses legais de restrição, está relacionada ao princípio da:',
   '{"A":"publicidade.","B":"moralidade.","C":"eficiência.","D":"impessoalidade.","E":"legalidade."}'::jsonb,
   'A', 'Publicidade: os atos devem, em regra, ser divulgados, respeitadas as exceções legais de sigilo.'),

  ((select id from b_adm_ex), 6, 'Administrativo',
   'Uma Administração Pública que busca reduzir desperdícios, melhorar resultados e prestar serviços de maior qualidade está observando especialmente o princípio da:',
   '{"A":"publicidade.","B":"moralidade.","C":"eficiência.","D":"impessoalidade.","E":"soberania."}'::jsonb,
   'C', 'Eficiência: bons resultados, qualidade e melhor uso dos recursos públicos.'),

  ((select id from b_adm_ex), 7, 'Administrativo',
   'Assinale a alternativa INCORRETA:',
   '{"A":"A legalidade é princípio expresso da Administração Pública.","B":"A impessoalidade impede, entre outras situações, favorecimentos pessoais.","C":"A moralidade está relacionada à atuação ética da Administração.","D":"A publicidade significa que absolutamente toda informação administrativa deve ser divulgada, sem qualquer exceção.","E":"A eficiência busca melhores resultados na atuação administrativa."}'::jsonb,
   'D', 'A publicidade é a regra, mas admite exceções constitucionais e legais de sigilo — "sem qualquer exceção" está incorreto.'),

  ((select id from b_adm_ex), 8, 'Administrativo',
   'A publicidade institucional dos órgãos públicos deve observar, entre outros aspectos, caráter:',
   '{"A":"exclusivamente promocional.","B":"pessoal e partidário.","C":"educativo, informativo ou de orientação social.","D":"exclusivamente comercial.","E":"eleitoral."}'::jsonb,
   'C', 'O art. 37, §1º exige caráter educativo, informativo ou de orientação social, vedando promoção pessoal de autoridades ou servidores.'),

  ((select id from b_adm_ex), 9, 'Administrativo',
   'A Administração Pública decide contratar determinado fornecedor exclusivamente porque o administrador é amigo pessoal de seu proprietário. O princípio mais diretamente relacionado à vedação dessa conduta é:',
   '{"A":"eficiência.","B":"impessoalidade.","C":"publicidade.","D":"continuidade.","E":"autotutela."}'::jsonb,
   'B', 'Contratar por amizade pessoal, e não pelo interesse público, é violação central da impessoalidade.'),

  ((select id from b_adm_ex), 10, 'Administrativo',
   'O acrônimo utilizado tradicionalmente para memorizar os cinco princípios expressos no caput do art. 37 é:',
   '{"A":"LIPME","B":"LIMPE","C":"LEMPI","D":"MILPE","E":"PELIM"}'::jsonb,
   'B', 'LIMPE: Legalidade, Impessoalidade, Moralidade, Publicidade, Eficiência.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
