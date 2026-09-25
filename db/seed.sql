-- DIA 1 — Semana 1: Português (interpretação de texto) + Constitucional (arts. 1º a 4º)
with d as (
  insert into days (week, day_number, title)
  values (1, 1, 'Interpretação de texto + Constitucional (arts. 1º a 4º)')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Interpretação e compreensão de textos', 70, $$Hoje você vai aprender a diferenciar: compreensão, interpretação, informação explícita, informação implícita, inferência, ideia principal, opinião, fato e extrapolação.

1. COMPREENSÃO x INTERPRETAÇÃO
Compreensão é descobrir o que está escrito no texto.
Ex.: "João saiu de casa às 7 horas para trabalhar." → Que horas João saiu? 7 horas. A informação está expressamente no texto.

Interpretação é compreender uma informação que pode ser deduzida a partir do texto.
Ex.: "João saiu de casa às 7 horas para trabalhar. Às 7h30, sua esposa percebeu que ele havia esquecido o celular sobre a mesa." → Podemos concluir que João provavelmente estava fora de casa às 7h30. Isso não foi dito literalmente, mas é uma conclusão compatível com o texto.

Cuidado com a pegadinha: uma alternativa pode parecer lógica mas não pode ser concluída a partir do texto. "Pode ser verdade" não significa "é possível concluir pelo texto".

2. INFORMAÇÃO EXPLÍCITA
Aparece claramente no texto. Ex.: "Maria chegou ao trabalho às 8 horas." → A que horas Maria chegou? 8 horas.

3. INFORMAÇÃO IMPLÍCITA
Não está escrita diretamente, mas pode ser deduzida.
Ex.: "Pedro saiu de casa levando um guarda-chuva. Ao chegar ao trabalho, estava completamente molhado." → Podemos inferir que provavelmente estava chovendo, mas o texto não afirma isso literalmente.

4. INFERÊNCIA
Inferir é chegar a uma conclusão usando informações do texto, sem inventar dados novos.
Ex.: "Carlos entrou no restaurante, consultou o cardápio e chamou o garçom." → Podemos inferir que pretendia fazer uma refeição. Não podemos inferir, por exemplo, que estava comemorando aniversário — nada no texto sustenta isso.

5. IDEIA PRINCIPAL
É o assunto central do texto, não uma informação secundária. Se um texto fala de bicicletas, poluição, mobilidade e saúde, a ideia central é "os benefícios do uso de bicicletas nas cidades" — não apenas um desses pontos isolado.

6. FATO x OPINIÃO
Fato: informação verificável ("O Brasil possui 26 estados e o Distrito Federal.").
Opinião: avaliação ou julgamento ("O Brasil possui um dos sistemas educacionais mais eficientes do mundo.").

7. EXTRAPOLAÇÃO
É ir além do que o texto permite concluir.
Ex.: o texto diz "A cidade aumentou o número de ciclovias." A alternativa "A cidade resolveu definitivamente os problemas de trânsito" é uma extrapolação — o texto não permite essa conclusão.

REGRA DE OURO: na dúvida entre duas alternativas, pergunte "onde exatamente no texto está a informação que sustenta essa alternativa?". Se não conseguir apontar ou construir uma inferência realmente necessária, desconfie.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Questões de interpretação (Q1 a Q5)', 50
  from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Constitucional', 'teoria', 'Constituição Federal — arts. 1º a 4º', 70, $$ARTIGO 1º — FUNDAMENTOS
A República Federativa do Brasil constitui-se em Estado Democrático de Direito e tem como fundamentos:
1. Soberania
2. Cidadania
3. Dignidade da pessoa humana
4. Valores sociais do trabalho e da livre iniciativa
5. Pluralismo político
Macete para memorizar: SO-CI-DI-VA-PLU (SOberania, CIdadania, DIgnidade, VAlores sociais do trabalho e da livre iniciativa, PLUralismo político).
Pegadinha de prova: não confunda fundamentos (art. 1º) com objetivos fundamentais (art. 3º) nem com princípios das relações internacionais (art. 4º) — isso cai muito.

ARTIGO 2º — PODERES
São três os Poderes da União, independentes e harmônicos entre si: Legislativo, Executivo e Judiciário (L-E-J).

ARTIGO 3º — OBJETIVOS FUNDAMENTAIS
I) Construir uma sociedade livre, justa e solidária.
II) Garantir o desenvolvimento nacional.
III) Erradicar a pobreza e a marginalização e reduzir as desigualdades sociais e regionais.
IV) Promover o bem de todos, sem preconceitos e discriminações.
Macete: CONSTRUIR → DESENVOLVER → REDUZIR → PROMOVER.

ARTIGO 4º — PRINCÍPIOS DAS RELAÇÕES INTERNACIONAIS
Independência nacional; prevalência dos direitos humanos; autodeterminação dos povos; não intervenção; igualdade entre os Estados; defesa da paz; solução pacífica dos conflitos; repúdio ao terrorismo e ao racismo; cooperação entre os povos; concessão de asilo político.
Parágrafo único: a República buscará a integração econômica, política, social e cultural dos povos da América Latina.

RESUMO PARA DECORAR
Art. 1º = Fundamentos | Art. 2º = Poderes | Art. 3º = Objetivos fundamentais | Art. 4º = Relações internacionais.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Constitucional', 'exercicios', 'Questões sobre os arts. 1º a 4º (Q6 a Q10)', 40
  from d returning id
),
b_rev as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Revisão/Simulados', 'revisao', 'Teste final sem consulta', 10, $$Antes de encerrar o estudo, responda mentalmente, sem olhar o material:

PORTUGUÊS
1. Qual a diferença entre compreensão e interpretação?
2. O que é uma informação explícita?
3. O que é uma inferência?
4. O que significa extrapolar o texto?
5. Como identificar a ideia principal?

CONSTITUCIONAL
1. Quais são os cinco fundamentos do art. 1º?
2. Quais são os três Poderes?
3. Quantos são os objetivos fundamentais do art. 3º?
4. Qual artigo trata dos princípios das relações internacionais?
5. Qual a diferença entre fundamento e objetivo fundamental?

Se você conseguir responder sem olhar, não precisa reler tudo. Marque este bloco como concluído para fechar o Dia 1.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_port_ex), 1, 'Português',
   'O avanço da tecnologia modificou profundamente a maneira como as pessoas se comunicam. Mensagens que antes demoravam dias para chegar podem atualmente alcançar seu destinatário em poucos segundos. Entretanto, a rapidez na comunicação não significa necessariamente maior qualidade nas relações humanas. De acordo com o texto, é correto afirmar que:',
   '{"A":"a tecnologia tornou todas as relações humanas melhores.","B":"a comunicação atualmente é mais lenta do que no passado.","C":"a tecnologia aumentou a velocidade da comunicação, mas isso não garante relações humanas melhores.","D":"as pessoas deixaram de utilizar meios tradicionais de comunicação.","E":"a tecnologia prejudicou completamente as relações humanas."}'::jsonb,
   'C', 'C é a única sustentada pelo texto: mais velocidade não garante mais qualidade. As demais extrapolam ("todas", "completamente") ou invertem a informação.'),

  ((select id from b_port_ex), 2, 'Português',
   'Embora o acesso à informação tenha aumentado significativamente nas últimas décadas, isso não significa que todas as pessoas consigam avaliar criticamente aquilo que leem. O grande volume de informações disponíveis torna cada vez mais importante desenvolver a capacidade de verificar fontes e identificar conteúdos enganosos. A principal ideia do texto é:',
   '{"A":"Atualmente existem poucas informações disponíveis.","B":"O aumento da informação torna desnecessária a verificação das fontes.","C":"O acesso à informação aumentou, mas é necessário desenvolver capacidade crítica para avaliá-la.","D":"Todo conteúdo disponível na internet é enganoso.","E":"A tecnologia eliminou a necessidade de análise crítica."}'::jsonb,
   'C', 'C resume a ideia central: mais acesso à informação + necessidade de avaliação crítica. As demais distorcem ou extrapolam o texto.'),

  ((select id from b_port_ex), 3, 'Português',
   'Carlos saiu de casa levando um casaco. Ao chegar ao trabalho, percebeu que havia deixado o guarda-chuva no carro. É possível inferir que:',
   '{"A":"Carlos certamente estava esperando uma tempestade.","B":"Carlos tinha dois carros.","C":"Carlos provavelmente considerava a possibilidade de chuva.","D":"Carlos chegou atrasado ao trabalho.","E":"Carlos não gostava de chuva."}'::jsonb,
   'C', 'C é inferência razoável: levar casaco e guarda-chuva sugere previsão de frio/chuva. As demais extrapolam ("certamente") ou inventam dados não presentes no texto.'),

  ((select id from b_port_ex), 4, 'Português',
   'O município implantou novas linhas de ônibus para atender bairros que anteriormente possuíam poucas opções de transporte coletivo. Segundo a prefeitura, a medida busca ampliar a mobilidade dos moradores dessas regiões. Assinale a alternativa que apresenta uma informação expressamente presente no texto.',
   '{"A":"As novas linhas eliminaram os problemas de transporte do município.","B":"Os moradores ficaram satisfeitos com a medida.","C":"As novas linhas atendem bairros que tinham poucas opções de transporte coletivo.","D":"O número de passageiros aumentou.","E":"O preço das passagens foi reduzido."}'::jsonb,
   'C', 'C repete literalmente o que o texto afirma. As demais são conclusões que o texto não escreve.'),

  ((select id from b_port_ex), 5, 'Português',
   'Muitos trabalhadores passaram a utilizar aplicativos para organizar suas atividades diárias. Essas ferramentas permitem estabelecer lembretes, acompanhar tarefas e visualizar compromissos. Apesar dessas vantagens, o excesso de notificações pode também prejudicar a concentração. Assinale a alternativa que NÃO pode ser concluída a partir do texto:',
   '{"A":"Aplicativos podem auxiliar na organização das atividades.","B":"Algumas ferramentas permitem criar lembretes.","C":"O excesso de notificações pode prejudicar a concentração.","D":"Todos os trabalhadores utilizam aplicativos diariamente.","E":"Aplicativos podem ser utilizados para acompanhar tarefas."}'::jsonb,
   'D', 'D extrapola: o texto diz "muitos trabalhadores", nunca "todos". As demais alternativas repetem o que o texto afirma.'),

  ((select id from b_const_ex), 1, 'Constitucional',
   'Constitui fundamento da República Federativa do Brasil:',
   '{"A":"desenvolvimento nacional.","B":"defesa da paz.","C":"dignidade da pessoa humana.","D":"erradicação da pobreza.","E":"redução das desigualdades sociais."}'::jsonb,
   'C', 'Dignidade da pessoa humana é fundamento (art. 1º). As demais são objetivo fundamental (art. 3º) ou princípio das relações internacionais (art. 4º).'),

  ((select id from b_const_ex), 2, 'Constitucional',
   'São Poderes da União, independentes e harmônicos entre si:',
   '{"A":"Executivo, Militar e Judiciário.","B":"Legislativo, Executivo e Judiciário.","C":"Legislativo, Executivo e Ministério Público.","D":"Executivo, Judiciário e Tribunal de Contas.","E":"Legislativo, Judiciário e Ministério Público."}'::jsonb,
   'B', 'Art. 2º: Legislativo, Executivo e Judiciário (L-E-J).'),

  ((select id from b_const_ex), 3, 'Constitucional',
   'Constitui objetivo fundamental da República Federativa do Brasil:',
   '{"A":"soberania.","B":"cidadania.","C":"pluralismo político.","D":"garantir o desenvolvimento nacional.","E":"independência nacional."}'::jsonb,
   'D', 'Garantir o desenvolvimento nacional é objetivo fundamental (art. 3º, II). As demais são fundamentos (art. 1º) ou princípio das relações internacionais (art. 4º).'),

  ((select id from b_const_ex), 4, 'Constitucional',
   'Assinale a alternativa que apresenta princípio que rege as relações internacionais do Brasil:',
   '{"A":"pluralismo político.","B":"dignidade da pessoa humana.","C":"prevalência dos direitos humanos.","D":"livre iniciativa.","E":"desenvolvimento nacional."}'::jsonb,
   'C', 'Prevalência dos direitos humanos é princípio das relações internacionais (art. 4º). As demais pertencem a outros artigos.'),

  ((select id from b_const_ex), 5, 'Constitucional',
   'Um candidato afirmou: "A dignidade da pessoa humana é um objetivo fundamental da República, previsto no art. 3º da Constituição." A afirmação está:',
   '{"A":"correta.","B":"incorreta, pois a dignidade da pessoa humana é fundamento da República, previsto no art. 1º.","C":"incorreta, pois a dignidade da pessoa humana é princípio das relações internacionais.","D":"incorreta, pois a dignidade da pessoa humana não está prevista na Constituição.","E":"correta, mas apenas para os servidores públicos."}'::jsonb,
   'B', 'Dignidade da pessoa humana é fundamento (art. 1º), não objetivo fundamental (art. 3º).')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
