-- Cadastra o Dia 11 (versão completa e robusta).
delete from days where week = 3 and day_number = 1;

with d as (
  insert into days (week, day_number, title)
  values (3, 1, 'Classes gramaticais e funções das palavras + razão/proporção/regra de três + direitos sociais/trabalhadores + Windows/arquivos/atalhos')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Classes gramaticais e a função das palavras no texto', 30, $$As 10 classes gramaticais: substantivo (nomeia: casa, servidor, justiça), adjetivo (caracteriza: eficiente, público, honesto), artigo (determina/indetermina: o, a, um, uma), numeral (quantidade/ordem/multiplicação: dois, primeiro, dobro), pronome (acompanha/substitui um nome: ele, meu, aquele), verbo (ação/estado/fenômeno: estudar, ser, chover), advérbio (modifica verbo/adjetivo/advérbio: ontem, muito, bem), preposição (relaciona termos: de, com, para, por), conjunção (liga orações/termos: mas, porque, portanto), interjeição (expressa emoção: Ah!, Nossa!, Ufa!).
Atenção: a classe de uma palavra pode depender do contexto — não decore a palavra isolada.

SUBSTANTIVO
Nomeia pessoas, lugares, objetos, sentimentos, instituições, conceitos — concretos ("mesa", "servidor") ou abstratos ("coragem", "beleza", "honestidade").
Pegadinha: "O servidor apresentou um relatório claro" → "claro" é adjetivo (caracteriza o relatório). "O servidor explicou o assunto com clareza" → "clareza" é substantivo (nomeia uma qualidade).

ADJETIVO
Atribui característica a um substantivo: prova difícil, atendimento rápido, funcionário responsável.
Compare: "O atendimento foi rápido" (rápido = adjetivo) × "O funcionário respondeu rapidamente" (rapidamente = advérbio) — o primeiro caracteriza o atendimento, o segundo indica como o funcionário respondeu.

VERBO
Expressa ação ("O candidato estuda diariamente"), estado ("O documento está correto") ou fenômeno da natureza ("Choveu durante a madrugada"). Tempos: presente (ação atual/habitual), pretérito (ação passada), futuro (ação futura) — as provas exploram se a frase é fato habitual, ação concluída ou previsão.

ADVÉRBIO
Modifica verbo, adjetivo ou outro advérbio. Pode indicar tempo (hoje, ontem, cedo), lugar (aqui, ali, longe), modo (bem, mal, rapidamente), intensidade (muito, pouco, bastante), negação (não, nunca, jamais), afirmação (sim, certamente), dúvida (talvez, possivelmente).
Pegadinha: em "O funcionário é muito competente", "muito" não caracteriza o funcionário diretamente — intensifica o adjetivo "competente".

PRONOME
Substitui ou acompanha um substantivo. Pessoais (eu, tu, ele, nós, eles), possessivos (meu, sua, nosso), demonstrativos (este, esse, aquele), indefinidos (alguém, ninguém, tudo, algum), interrogativos (quem, qual, quanto), relativos (que, quem, cujo, onde).

PREPOSIÇÃO × CONJUNÇÃO
Preposição liga palavras/estabelece relação entre termos: "Preciso de ajuda."; "Estudo para o concurso."; "Saí com meus documentos."
Conjunção liga palavras ou orações com relação de sentido: "Estudei, mas errei a questão." (oposição); "Estudei porque queria aprender." (causa); "Estudei, portanto estava preparado." (conclusão); "Estudarei se tiver tempo." (condição).

UMA MESMA PALAVRA PODE MUDAR DE CLASSE
"Tomei meio copo de água" (meio = numeral fracionário) × "Ela estava meio cansada" (meio = advérbio, "um pouco"). "O carro rápido venceu a corrida" (rápido = adjetivo) × "O carro passou rápido" (rápido = valor adverbial, equivalente a "rapidamente").
Regra de ouro: analise o papel da palavra na frase, não apenas sua aparência.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — classes gramaticais (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Razão, proporção, regra de três direta e inversa', 35, $$RAZÃO
Comparação entre duas quantidades por divisão. Ex.: agência com 12 funcionários e 4 caixas → razão funcionários/caixas = 12/4 = 3 (3 funcionários para cada caixa). Pode ser escrita como 12/4, 12:4 ou "12 para 4".
Ex.: sala com 15 homens e 10 mulheres → razão homens/mulheres = 15/10 = 3/2 (simplificada). Cuidado: a ordem importa — razão mulheres/homens seria 10/15.

PROPORÇÃO
Igualdade entre duas razões: 2/4 = 3/6 (ambas representam "metade"). Se a/b = c/d, então a×d = b×c (multiplicação em cruz).
Ex.: 3/5 = x/20 → 5x = 3×20 = 60 → x = 12.

REGRA DE TRÊS SIMPLES
Usada quando há três valores conhecidos e se quer descobrir um quarto, mantendo relação proporcional. Duas possibilidades: diretamente ou inversamente proporcionais — essa distinção é uma das maiores pegadinhas de prova.

REGRA DE TRÊS DIRETA
O aumento de uma grandeza provoca aumento proporcional da outra (e a redução, redução proporcional).
Ex.: 4 cadernos custam R$ 32; quanto custam 7? Mais cadernos → maior preço: relação direta. 4/7 = 32/x → 4x = 224 → x = 56. Atalho: preço unitário = 32÷4 = 8; 8×7 = 56.

REGRA DE TRÊS INVERSA
O aumento de uma grandeza provoca diminuição proporcional da outra.
Ex.: 4 funcionários fazem um serviço em 12 dias; em quantos dias 8 funcionários fariam o mesmo serviço? Mais funcionários → menos dias: relação inversa. 4×12 = 8×x → 48 = 8x → x = 6 dias.

COMO IDENTIFICAR DIRETA OU INVERSA
Pergunte: se eu aumentar a primeira grandeza, o que acontece com a segunda? Direta: mais produtos → maior preço total (preço unitário fixo); mais horas trabalhadas → maior remuneração (valor por hora fixo). Inversa: mais trabalhadores → menos tempo (mesma produtividade); maior velocidade → menos tempo para a mesma distância; mais pessoas dividindo uma conta fixa → menos valor por pessoa; mais torneiras iguais → menos tempo para encher um reservatório.
Atenção: essas relações dependem das condições do problema — descontos por quantidade, horas extras ou produtividades diferentes podem mudar o raciocínio.

NOÇÃO INICIAL DE REGRA DE TRÊS COMPOSTA
Ex.: 6 funcionários trabalham 4h/dia durante 5 dias. Quantas horas por dia seriam necessárias para concluir um serviço equivalente em 2 dias, com os mesmos funcionários? Como funcionários e quantidade de serviço são os mesmos, o total de horas deve permanecer igual: 4×5 = x×2 → 20 = 2x → x = 10 horas por dia. Por enquanto, foque em reconhecer bem as relações diretas e inversas — a composta será aprofundada depois.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — razão, proporção e regra de três (Q1 a Q4)', 15
  from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Direitos sociais (art. 6º) e direitos dos trabalhadores (art. 7º)', 30, $$DIREITOS SOCIAIS — ART. 6º
São direitos fundamentais ligados às condições necessárias para uma vida digna, buscando proteção social e melhores condições de vida: educação, saúde, alimentação, trabalho, moradia, transporte, lazer, segurança, previdência social, proteção à maternidade e à infância, assistência aos desamparados.
Como cai na prova: a banca lista itens e pergunta qual é direito social — saúde e educação são (art. 6º); nacionalidade está em outro capítulo. Pegadinha: não confunda direitos sociais com direitos individuais, direitos políticos ou regras de nacionalidade.

AGRUPANDO OS DIREITOS DO ART. 6º
Serviços essenciais: saúde e educação. Vida cotidiana: alimentação, moradia, transporte, lazer. Proteção social: previdência social e assistência aos desamparados. Segurança e proteção: segurança, proteção à maternidade e à infância. Vida profissional: trabalho.

SAÚDE (art. 196) E EDUCAÇÃO (art. 205)
Saúde é direito de todos e dever do Estado, garantida por políticas sociais e econômicas voltadas à redução do risco de doenças e ao acesso universal e igualitário às ações e serviços de promoção, proteção e recuperação. Educação é direito de todos e dever do Estado e da família, promovida e incentivada com a colaboração da sociedade.
Pegadinha: dizer que a saúde é direito só de quem contribui para a Previdência está errado — é direito de todos, sem depender de contribuição previdenciária individual.

DIREITOS DOS TRABALHADORES — ART. 7º
Salário mínimo (nas condições constitucionais); décimo terceiro salário; repouso semanal remunerado; férias anuais remuneradas com pelo menos um terço a mais que o salário normal; licença à gestante; licença-paternidade (nos termos legais); aviso-prévio proporcional ao tempo de serviço; redução dos riscos do trabalho por normas de saúde, higiene e segurança; proibição de discriminação salarial e de critérios de admissão por motivos vedados; FGTS.
Não precisa decorar todos de uma vez — comece pelos mais conhecidos e aprenda a reconhecer afirmações incorretas.

FÉRIAS E ADICIONAL DE UM TERÇO
Férias anuais remuneradas com, pelo menos, um terço a mais que o salário normal. Ex. ilustrativo: salário de R$ 2.400 → adicional mínimo = 2400÷3 = R$ 800, além da remuneração de férias. Pegadinha: é "pelo menos um terço", não 10% nem 20%.

DÉCIMO TERCEIRO SALÁRIO
Direito constitucional dos trabalhadores — o cálculo considera remuneração e período trabalhado, conforme a legislação. Em prova, cuidado com palavras absolutas: "sempre", "nunca", "exclusivamente", "somente" podem tornar a afirmação incorreta.

DIREITOS SOCIAIS E ADMINISTRAÇÃO PÚBLICA
Educação (escolas/políticas educacionais), saúde (ações/serviços públicos de saúde), previdência (proteção previdenciária legal), assistência social (proteção a quem necessitar), trabalho (proteção constitucional). Atenção: Previdência Social e Assistência Social são diferentes, embora ambas integrem a seguridade social — isso será aprofundado quando chegarmos aos conteúdos específicos do INSS.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — direitos sociais e trabalhadores (Q1 a Q4)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'Windows, arquivos, pastas, extensões e atalhos de teclado', 25, $$SISTEMA OPERACIONAL
Software que administra os recursos do computador e permite a interação entre usuário, programas e hardware. Ex.: Windows, Linux, macOS, Android, iOS. Não confunda: Word/Excel/PowerPoint são aplicativos; Windows é sistema operacional.

ARQUIVO × PASTA
Arquivo armazena informações (texto, imagem, planilha, vídeo). Pasta organiza arquivos e outras pastas. Ex.: pasta "Concursos" com subpastas "Português" (contendo Aula_11.pdf, Exercicios.docx) e "Matemática" (contendo Porcentagem.xlsx).

EXTENSÕES DE ARQUIVO
.docx = Word. .xlsx = Excel. .pptx = PowerPoint. .pdf = PDF. .txt = texto simples. .jpg/.png = imagem. .mp3 = áudio. .mp4 = vídeo. .zip = compactado.
Pegadinha: renomear documento.docx para documento.pdf NÃO converte o conteúdo — mudar a extensão não é o mesmo que converter o formato.

ATALHOS DE TECLADO
Ctrl+C: copiar. Ctrl+X: recortar. Ctrl+V: colar. Ctrl+Z: desfazer. Ctrl+A: selecionar tudo. Ctrl+S: salvar. Ctrl+P: imprimir. Alt+Tab: alternar janelas. Windows+E: abrir o Explorador de Arquivos. Windows+D: mostrar a área de trabalho. F2: renomear o item selecionado. Delete: excluir (normalmente enviando à Lixeira).
Memorização: C=Copy, X=recortar, V=colar, Z=desfazer, S=Save, P=Print.

COPIAR × RECORTAR
Copiar (Ctrl+C): cria uma cópia ao colar — o original permanece. Recortar (Ctrl+X): prepara para mover — ao colar, o item normalmente deixa o local original.
Ex.: arquivo Curriculo.pdf em "Documentos" — copiar e colar em "Concursos" deixa original + cópia; recortar e colar move o arquivo para "Concursos".

LIXEIRA E EXCLUSÃO
Arquivos excluídos normalmente vão para a Lixeira, de onde podem ser restaurados — mas há situações de exclusão permanente (certos atalhos, ou locais que não usam Lixeira). Excluir ≠ Restaurar ≠ Excluir permanentemente. Em prova, evite afirmar que todo arquivo excluído sempre vai para a Lixeira.

EXPLORADOR DE ARQUIVOS
Recurso do Windows para navegar e administrar arquivos, pastas e unidades: criar pastas, copiar/mover/renomear arquivos, pesquisar documentos, visualizar unidades, excluir/restaurar itens. Atalho principal: Windows+E.$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — Windows, arquivos e atalhos (Q1 a Q4)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 11, 3 questões por matéria (Q17 a Q28)', 40,
    $$Sem consulta. 12 questões, 3 de cada matéria: Português (classes gramaticais), Matemática (razão/proporção/regra de três), Constitucional (direitos sociais/trabalhadores) e Informática (Windows/arquivos/atalhos).$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Correção, caderno de erros e checklist do Dia 11', 20, $$CORREÇÃO
O que faz você evoluir é entender por que uma alternativa está certa e por que as outras estão erradas. Para cada erro registre: a matéria, o motivo do erro e o que revisar. Registre também acertos por chute — merecem revisão igual. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app.

PLANO DE REVISÃO
Em 24h (Dia 12): 10–15 min para lembrar as classes gramaticais, refazer uma regra de três, recitar os direitos sociais e praticar os atalhos do Windows.
Em 7 dias: refaça as questões erradas sem consultar o gabarito e explique em voz alta como chegou à resposta.
Em 30 dias: revisão acumulada, misturando os conteúdos dos Dias 10 e 11, para treinar a troca de assunto que acontece nas provas.
(O app já agenda isso sozinho via o caderno de erros — 24h, 7 dias e 30 dias, visíveis no Painel.)

CHECKLIST DO DIA 11
Marque mentalmente o que já consegue fazer sem consultar a aula: identificar substantivo, adjetivo, verbo, advérbio e pronome; reconhecer oposição e concessão no texto; resolver regra de três direta; resolver regra de três inversa; citar direitos sociais da Constituição; reconhecer direitos dos trabalhadores no art. 7º; diferenciar arquivos, pastas e extensões; lembrar os principais atalhos do Windows. Marque este bloco como concluído para fechar o Dia 11.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Na frase "O servidor respondeu educadamente ao cidadão", a palavra "educadamente" é:',
   '{"A":"Substantivo.","B":"Adjetivo.","C":"Advérbio.","D":"Preposição.","E":"Pronome."}'::jsonb,
   'C', '"Educadamente" modifica o verbo "respondeu", indicando modo — é advérbio.'),

  ((select id from b_port_ex), 2, 'Português',
   'Em "A honestidade é essencial no serviço público", a palavra "honestidade" é:',
   '{"A":"Verbo.","B":"Substantivo.","C":"Advérbio.","D":"Conjunção.","E":"Artigo."}'::jsonb,
   'B', '"Honestidade" nomeia uma qualidade abstrata — é substantivo.'),

  ((select id from b_port_ex), 3, 'Português',
   'Em "O candidato estudou, mas não conseguiu a aprovação", a palavra "mas" expressa:',
   '{"A":"Conclusão.","B":"Causa.","C":"Condição.","D":"Oposição.","E":"Finalidade."}'::jsonb,
   'D', '"Mas" é conjunção adversativa — contrapõe o estudo à não aprovação.'),

  ((select id from b_port_ex), 4, 'Português',
   'Na frase "A prova estava muito difícil", a palavra "muito":',
   '{"A":"Intensifica o adjetivo \"difícil\".","B":"Nomeia uma característica.","C":"Substitui um substantivo.","D":"Liga duas orações.","E":"Indica uma ação."}'::jsonb,
   'A', '"Muito" é advérbio de intensidade, modificando o adjetivo "difícil".'),

  -- Matemática — fixação (Q1-4)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Se 5 canetas custam R$ 20, quanto custarão 8 canetas do mesmo preço unitário?',
   '{"A":"R$ 25,00.","B":"R$ 28,00.","C":"R$ 32,00.","D":"R$ 35,00.","E":"R$ 40,00."}'::jsonb,
   'C', 'Preço unitário: 20/5 = 4. Para 8 canetas: 8 × 4 = 32.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Se 6 funcionários executam um trabalho em 10 dias, quantos dias 12 funcionários levariam para executar o mesmo trabalho, nas mesmas condições?',
   '{"A":"2 dias.","B":"4 dias.","C":"5 dias.","D":"10 dias.","E":"20 dias."}'::jsonb,
   'C', 'Regra de três inversa: 6×10 = 12×x → 60 = 12x → x = 5 dias.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'A razão entre 18 e 24, na forma simplificada, é:',
   '{"A":"2/3.","B":"3/2.","C":"4/3.","D":"5/6.","E":"3/4."}'::jsonb,
   'E', '18/24 simplifica dividindo por 6: 3/4.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Se 3 máquinas produzem 180 peças em determinado período, quantas peças 5 máquinas iguais produziriam no mesmo período, mantendo a mesma produtividade?',
   '{"A":"240.","B":"270.","C":"300.","D":"360.","E":"450."}'::jsonb,
   'C', 'Produção por máquina: 180/3 = 60. Para 5 máquinas: 5 × 60 = 300.'),

  -- Constitucional — fixação (Q1-4)
  ((select id from b_const_ex), 1, 'Constitucional',
   'De acordo com o artigo 6º da Constituição Federal, é um direito social:',
   '{"A":"A extradição de brasileiro nato.","B":"A saúde.","C":"A perda automática da nacionalidade em qualquer hipótese.","D":"A criação de partido político.","E":"A elegibilidade para qualquer cargo sem requisitos."}'::jsonb,
   'B', 'Saúde é direito social expresso no art. 6º. As demais tratam de nacionalidade ou direitos políticos.'),

  ((select id from b_const_ex), 2, 'Constitucional',
   'Conforme o artigo 196 da Constituição Federal, a saúde é:',
   '{"A":"Direito exclusivo dos trabalhadores com carteira assinada.","B":"Benefício restrito a quem contribui para a Previdência.","C":"Direito de todos e dever do Estado.","D":"Serviço facultativo do Estado, sem compromisso constitucional.","E":"Direito exclusivo de pessoas em situação de desemprego."}'::jsonb,
   'C', 'Art. 196: a saúde é direito de todos e dever do Estado, sem depender de contribuição previdenciária individual.'),

  ((select id from b_const_ex), 3, 'Constitucional',
   'Segundo o artigo 7º da Constituição Federal, as férias anuais remuneradas devem ter, no mínimo:',
   '{"A":"Um quinto a mais que o salário normal.","B":"Um décimo a mais que o salário normal.","C":"Um terço a mais que o salário normal.","D":"Metade do salário normal, sem adicional.","E":"O mesmo valor do salário normal, sem qualquer adicional constitucional."}'::jsonb,
   'C', 'O adicional constitucional mínimo de férias é de um terço a mais que o salário normal.'),

  ((select id from b_const_ex), 4, 'Constitucional',
   'Assinale a alternativa que apresenta um direito constitucional dos trabalhadores previsto no artigo 7º:',
   '{"A":"Décimo terceiro salário.","B":"Direito de receber dois salários mínimos em qualquer emprego.","C":"Garantia de emprego vitalício em toda empresa privada.","D":"Isenção universal de tributos.","E":"Direito a férias ilimitadas, sem regras legais."}'::jsonb,
   'A', 'O décimo terceiro salário é direito expresso do art. 7º. As demais não existem como regra geral constitucional.'),

  -- Informática — fixação (Q1-4)
  ((select id from b_info_ex), 1, 'Informática',
   'No Windows, qual atalho é normalmente utilizado para copiar um arquivo selecionado?',
   '{"A":"Ctrl + X","B":"Ctrl + V","C":"Ctrl + C","D":"Ctrl + Z","E":"Ctrl + P"}'::jsonb,
   'C', 'Ctrl+C copia o item selecionado.'),

  ((select id from b_info_ex), 2, 'Informática',
   'Qual é a principal função de uma pasta no sistema operacional?',
   '{"A":"Converter automaticamente todos os documentos em PDF.","B":"Organizar arquivos e outras pastas.","C":"Substituir o sistema operacional.","D":"Impedir permanentemente qualquer exclusão.","E":"Executar apenas arquivos de áudio."}'::jsonb,
   'B', 'A pasta serve para organizar arquivos e outras pastas.'),

  ((select id from b_info_ex), 3, 'Informática',
   'Qual extensão está normalmente associada a uma planilha do Microsoft Excel?',
   '{"A":".mp3","B":".pdf","C":".pptx","D":".xlsx","E":".jpg"}'::jsonb,
   'D', '.xlsx é a extensão padrão de planilhas do Excel.'),

  ((select id from b_info_ex), 4, 'Informática',
   'No Windows, o atalho Windows + E é normalmente utilizado para:',
   '{"A":"Abrir o Explorador de Arquivos.","B":"Desligar o computador imediatamente.","C":"Excluir permanentemente todos os arquivos.","D":"Imprimir o documento atual.","E":"Desfazer a última operação em qualquer programa."}'::jsonb,
   'A', 'Windows+E abre o Explorador de Arquivos.'),

  -- Mini-simulado (Q17-28)
  ((select id from b_simulado), 1, 'Português',
   'Na frase "O candidato resolveu cuidadosamente as questões", a palavra "cuidadosamente" indica:',
   '{"A":"Lugar.","B":"Intensidade.","C":"Modo.","D":"Negação.","E":"Afirmação."}'::jsonb,
   'C', '"Cuidadosamente" indica o modo como o candidato resolveu as questões.'),

  ((select id from b_simulado), 2, 'Português',
   'Em "Embora estivesse cansado, o servidor terminou o trabalho", a expressão "embora" introduz uma ideia de:',
   '{"A":"Conclusão.","B":"Concessão.","C":"Finalidade.","D":"Adição.","E":"Explicação."}'::jsonb,
   'B', '"Embora" introduz concessão: mesmo cansado, ele terminou o trabalho.'),

  ((select id from b_simulado), 3, 'Português',
   'Na frase "Aquele funcionário apresentou seus documentos", a palavra "aquele" é um pronome:',
   '{"A":"Pessoal.","B":"Possessivo.","C":"Indefinido.","D":"Demonstrativo.","E":"Interrogativo."}'::jsonb,
   'D', '"Aquele" indica posição/relação com o discurso — é pronome demonstrativo.'),

  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Se 8 livros custam R$ 120,00, quanto custarão 5 livros do mesmo preço unitário?',
   '{"A":"R$ 60,00.","B":"R$ 65,00.","C":"R$ 70,00.","D":"R$ 75,00.","E":"R$ 80,00."}'::jsonb,
   'D', 'Preço unitário: 120/8 = 15. Para 5 livros: 5 × 15 = 75.'),

  ((select id from b_simulado), 5, 'Matemática/RLM',
   'Uma equipe de 10 trabalhadores conclui um serviço em 18 dias. Mantidas as mesmas condições de produtividade, em quantos dias 15 trabalhadores concluiriam o mesmo serviço?',
   '{"A":"9 dias.","B":"10 dias.","C":"12 dias.","D":"15 dias.","E":"27 dias."}'::jsonb,
   'C', 'Regra de três inversa: 10×18 = 15×x → 180 = 15x → x = 12.'),

  ((select id from b_simulado), 6, 'Matemática/RLM',
   'A razão entre 20 e 30, na forma simplificada, é:',
   '{"A":"2/3.","B":"3/2.","C":"1/2.","D":"3/4.","E":"5/3."}'::jsonb,
   'A', '20/30 simplifica dividindo por 10: 2/3.'),

  ((select id from b_simulado), 7, 'Constitucional',
   'Qual alternativa apresenta somente direitos sociais previstos no artigo 6º da Constituição Federal?',
   '{"A":"Nacionalidade, extradição e direito de voto.","B":"Saúde, educação e moradia.","C":"Criação de partidos, elegibilidade e nacionalidade.","D":"Proibição de associação e perda de direitos políticos.","E":"Direito de voto, extradição e naturalização."}'::jsonb,
   'B', 'Saúde, educação e moradia são direitos sociais do art. 6º. As demais tratam de nacionalidade ou direitos políticos.'),

  ((select id from b_simulado), 8, 'Constitucional',
   'Sobre o direito à saúde, conforme a Constituição Federal, assinale a alternativa correta.',
   '{"A":"É exclusivo de quem possui emprego formal.","B":"Depende de contribuição prévia à Previdência Social.","C":"É direito de todos e dever do Estado.","D":"Só pode ser oferecido por instituições privadas.","E":"Não está previsto entre os direitos constitucionais."}'::jsonb,
   'C', 'Art. 196: saúde é direito de todos e dever do Estado.'),

  ((select id from b_simulado), 9, 'Constitucional',
   'A Constituição Federal assegura aos trabalhadores o direito a férias anuais remuneradas com, pelo menos:',
   '{"A":"Um décimo a mais que o salário normal.","B":"Um quinto a mais que o salário normal.","C":"Um quarto a mais que o salário normal.","D":"Um terço a mais que o salário normal.","E":"O dobro do salário normal em todos os casos."}'::jsonb,
   'D', 'O adicional constitucional de férias é de pelo menos um terço a mais que o salário normal.'),

  ((select id from b_simulado), 10, 'Informática',
   'Qual atalho é normalmente utilizado para desfazer a última ação em muitos aplicativos do Windows?',
   '{"A":"Ctrl + S","B":"Ctrl + Z","C":"Ctrl + P","D":"Ctrl + A","E":"Windows + E"}'::jsonb,
   'B', 'Ctrl+Z desfaz a última ação.'),

  ((select id from b_simulado), 11, 'Informática',
   'Qual alternativa apresenta uma afirmação correta sobre arquivos e pastas?',
   '{"A":"Toda pasta é obrigatoriamente um arquivo PDF.","B":"Renomear um arquivo sempre converte seu conteúdo para outro formato.","C":"Uma pasta pode organizar arquivos e outras pastas.","D":"Um arquivo .xlsx é normalmente um arquivo de áudio.","E":"A Lixeira impede qualquer exclusão permanente."}'::jsonb,
   'C', 'Pastas organizam arquivos e outras pastas — as demais alternativas contêm erros conceituais.'),

  ((select id from b_simulado), 12, 'Informática',
   'Qual alternativa descreve corretamente a diferença entre copiar e recortar um arquivo?',
   '{"A":"Copiar e recortar sempre produzem exatamente o mesmo resultado.","B":"Copiar normalmente preserva o original; recortar e colar normalmente move o item.","C":"Copiar exclui o original e recortar cria uma cópia.","D":"Recortar é utilizado exclusivamente para imprimir arquivos.","E":"Copiar só funciona com documentos PDF."}'::jsonb,
   'B', 'Copiar (Ctrl+C) preserva o original; recortar (Ctrl+X) e colar move o item para o novo local.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
