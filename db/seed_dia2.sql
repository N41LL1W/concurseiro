-- DIA 2 — Semana 1: Matemática (razão, proporção, regra de três, %) + Administrativo (LIMPE)
with d as (
  insert into days (week, day_number, title)
  values (1, 2, 'Razão, proporção e regra de três + Princípios da Administração Pública (LIMPE)')
  returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Matemática/RLM', 'teoria', 'Razão, proporção, regra de três e porcentagem', 60, $$1. RAZÃO
Razão é uma comparação entre duas grandezas.
Ex.: uma sala tem 20 homens e 30 mulheres. Razão entre homens e mulheres = 20/30 = 2/3 (para cada 2 homens, 3 mulheres).
Atenção: a ordem importa. Razão homens/mulheres (20/30) é diferente de mulheres/homens (30/20).

2. PROPORÇÃO
Proporção é uma igualdade entre duas razões. Ex.: 2/3 = 4/6. Verifica-se multiplicando em cruz: 2×6 = 3×4 → 12 = 12, logo há proporção.

3. REGRA DE TRÊS DIRETA
Quando aumenta→aumenta ou diminui→diminui, as grandezas são diretamente proporcionais.
Ex.: 3 funcionários analisam 120 processos. Quantos 5 funcionários analisariam? 3/5 = 120/X → 3X = 600 → X = 200.
Outros exemplos de relação direta: mais funcionários → mais produção; mais produtos → maior preço total.

4. REGRA DE TRÊS INVERSA
Quando aumenta→diminui, as grandezas são inversamente proporcionais.
Ex.: 4 funcionários fazem um serviço em 12 dias. Com 6 funcionários, mantendo o ritmo, o número de dias diminui: 4×12 = 6×X → 48 = 6X → X = 8 dias.
Como identificar: pergunte "se a primeira grandeza aumentar, a segunda aumenta ou diminui?". Aumenta→aumenta = direta. Aumenta→diminui = inversa.

5. PORCENTAGEM
10% = 10/100 = 0,10. Ex.: 20% de R$ 500 = 500 × 0,20 = 100.
Pegadinha importante: aumentar 20% e depois dar desconto de 20% NÃO volta ao valor original.
R$ 100 + 20% = R$ 120. Desconto de 20% sobre R$ 120 = R$ 24. R$ 120 − 24 = R$ 96 (não R$ 100).
Isso será essencial em matemática financeira.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Matemática/RLM', 'exercicios', 'Questões de razão, proporção e regra de três (Q1 a Q5)', 60
  from d returning id
),
b_adm_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Administrativo', 'teoria', 'Princípios da Administração Pública — LIMPE (art. 37, CF)', 60, $$A Administração Pública deve obedecer, entre outros, aos princípios do art. 37 da Constituição Federal, conhecidos pelo macete LIMPE:
L - Legalidade
I - Impessoalidade
M - Moralidade
P - Publicidade
E - Eficiência

1. LEGALIDADE
O agente público deve atuar conforme a lei. Diferente do particular, que pode fazer tudo o que a lei não proíbe, a Administração só pode agir com fundamento jurídico para sua atuação.

2. IMPESSOALIDADE
A Administração não deve agir para beneficiar ou prejudicar alguém por razões pessoais; o interesse público deve prevalecer. Ex.: um servidor não pode usar a estrutura pública para favorecer um amigo — isso viola a impessoalidade.

3. MORALIDADE
Não basta o ato ser formalmente permitido: a Administração também deve observar padrões éticos. A moralidade é princípio jurídico, não apenas moral.

4. PUBLICIDADE
Os atos administrativos devem, em regra, ser divulgados, para permitir transparência, controle e conhecimento pela sociedade. Mas publicidade é a regra — existem sigilos constitucional ou legalmente protegidos como exceção.

5. EFICIÊNCIA
Busca-se melhor uso dos recursos, qualidade, produtividade, bons resultados e redução de desperdícios.

TABELA PARA DECORAR
Legalidade = agir conforme a lei | Impessoalidade = sem favorecimentos pessoais | Moralidade = atuação ética | Publicidade = transparência | Eficiência = bons resultados.

Pegadinha clássica: o LIMPE está expressamente no art. 37, mas existem outros princípios administrativos reconhecidos (razoabilidade, proporcionalidade, supremacia do interesse público, continuidade do serviço público, autotutela). Por enquanto, o objetivo é dominar só o LIMPE.$$
  from d returning id
),
b_adm_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Administrativo', 'exercicios', 'Questões sobre o LIMPE (Q6 a Q10)', 50
  from d returning id
),
b_rev as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Revisão/Simulados', 'revisao', 'Desafio final sem consulta', 10, $$Responda mentalmente, sem olhar o material:

MATEMÁTICA
1. O que é razão?
2. O que é proporção?
3. Como saber se uma regra de três é direta ou inversa?
4. Quanto é 15% de R$ 800?
5. Por que aumentar 20% e depois diminuir 20% não retorna ao valor original?

ADMINISTRATIVO
1. O que significa LIMPE?
2. Qual princípio impede favorecimentos pessoais?
3. Qual princípio está relacionado à transparência?
4. Qual princípio exige atuação conforme a lei?
5. Qual princípio está relacionado à produtividade e bons resultados?

Marque este bloco como concluído para fechar o Dia 2.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Em uma turma há 18 homens e 27 mulheres. A razão entre o número de homens e o número de mulheres, simplificada, é:',
   '{"A":"1/2","B":"2/3","C":"3/2","D":"2/5","E":"3/5"}'::jsonb,
   'B', '18/27 simplifica dividindo por 9: 2/3.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Se 5 funcionários conseguem atender 200 clientes em determinado período, mantendo a mesma produtividade, 8 funcionários atenderão:',
   '{"A":"280","B":"300","C":"320","D":"350","E":"400"}'::jsonb,
   'C', 'Regra de três direta: 5/8 = 200/X → 5X = 1600 → X = 320.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Uma equipe de 6 trabalhadores realiza determinado serviço em 15 dias. Mantendo a mesma produtividade, quantos dias seriam necessários para 10 trabalhadores realizarem o mesmo serviço?',
   '{"A":"6","B":"8","C":"9","D":"10","E":"12"}'::jsonb,
   'C', 'Regra de três inversa: 6×15 = 10×X → 90 = 10X → X = 9 dias.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Um produto custa R$ 800. Seu preço sofre aumento de 15%. O novo preço será:',
   '{"A":"R$ 880","B":"R$ 900","C":"R$ 920","D":"R$ 940","E":"R$ 960"}'::jsonb,
   'C', '800 × 1,15 = 920.'),

  ((select id from b_mat_ex), 5, 'Matemática/RLM',
   'Um produto de R$ 500 sofre um desconto de 20%. Seu novo preço é:',
   '{"A":"R$ 380","B":"R$ 400","C":"R$ 420","D":"R$ 450","E":"R$ 480"}'::jsonb,
   'B', '500 × 0,80 = 400.'),

  ((select id from b_adm_ex), 1, 'Administrativo',
   'Constitui princípio expressamente previsto no caput do art. 37 da Constituição Federal:',
   '{"A":"supremacia do interesse público.","B":"autotutela.","C":"eficiência.","D":"continuidade do serviço público.","E":"proporcionalidade."}'::jsonb,
   'C', 'Eficiência integra o LIMPE, expresso no art. 37. As demais são princípios reconhecidos, mas não estão no caput do art. 37.'),

  ((select id from b_adm_ex), 2, 'Administrativo',
   'Um agente público utiliza sua posição para favorecer pessoalmente um amigo na obtenção de determinado benefício administrativo. A conduta descrita viola principalmente o princípio da:',
   '{"A":"publicidade.","B":"impessoalidade.","C":"eficiência.","D":"continuidade.","E":"especialidade."}'::jsonb,
   'B', 'Favorecimento pessoal é a violação central da impessoalidade: o interesse público deve prevalecer sobre interesses pessoais.'),

  ((select id from b_adm_ex), 3, 'Administrativo',
   'O princípio segundo o qual a Administração Pública deve atuar de acordo com a lei é o princípio da:',
   '{"A":"moralidade.","B":"eficiência.","C":"publicidade.","D":"legalidade.","E":"impessoalidade."}'::jsonb,
   'D', 'Legalidade: a Administração só pode agir com fundamento jurídico.'),

  ((select id from b_adm_ex), 4, 'Administrativo',
   'A divulgação dos atos da Administração Pública, permitindo maior transparência e controle social, relaciona-se principalmente ao princípio da:',
   '{"A":"legalidade.","B":"moralidade.","C":"publicidade.","D":"eficiência.","E":"impessoalidade."}'::jsonb,
   'C', 'Publicidade: os atos devem, em regra, ser divulgados para permitir transparência e controle.'),

  ((select id from b_adm_ex), 5, 'Administrativo',
   'Uma Administração Pública que busca reduzir desperdícios, melhorar a produtividade e alcançar melhores resultados está diretamente relacionada ao princípio da:',
   '{"A":"publicidade.","B":"legalidade.","C":"moralidade.","D":"eficiência.","E":"impessoalidade."}'::jsonb,
   'D', 'Eficiência: melhor uso dos recursos, produtividade e bons resultados.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
