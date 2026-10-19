-- Cadastra o Dia 15 (versão completa e robusta).
delete from days where week = 4 and day_number = 1;

with d as (
  insert into days (week, day_number, title)
  values (4, 1, 'Pontuação (vírgula/ponto e vírgula/dois-pontos) + regra de três + atos administrativos + sistemas operacionais e arquivos')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Pontuação: vírgula, ponto e vírgula, dois-pontos, travessão e parênteses', 30, $$Sinais de pontuação organizam o texto, indicam pausas e estabelecem relações entre ideias: vírgula, ponto final, ponto e vírgula, dois-pontos, interrogação, exclamação, travessão, parênteses. O foco de hoje é a vírgula, um dos sinais que mais gera erro em prova.

QUANDO USAR A VÍRGULA
1) Separar itens de enumeração: "O candidato estudou Português, Matemática, Informática e Direito Constitucional."
2) Isolar o vocativo (termo usado para chamar alguém): "Candidato, leia o enunciado com atenção."; "Leia o enunciado, candidato, com atenção."; "Leia o enunciado com atenção, candidato."
3) Isolar expressões explicativas/intercaladas: "O servidor, segundo a chefia, cumpriu o prazo."; "A prova, entretanto, foi adiada."
4) Separar oração adverbial deslocada: "O candidato foi aprovado porque estudou." (sem vírgula, ordem direta) × "Como estudou bastante, o candidato foi aprovado." (oração antes da principal, com vírgula).
5) Isolar explicação sobre um termo anterior: "Os candidatos, que chegaram cedo, aguardaram a abertura dos portões." (explicativa: todos chegaram cedo) × "Os candidatos que chegaram cedo aguardaram a abertura dos portões." (restritiva, sem vírgula: só os que chegaram cedo). A pontuação pode alterar o sentido.

QUANDO NÃO USAR A VÍRGULA
1) Não separe sujeito e verbo: errado "O candidato aprovado, compareceu ao local."; certo "O candidato aprovado compareceu ao local."
2) Não separe o verbo do complemento: errado "O servidor entregou, o documento."; certo "O servidor entregou o documento."
3) Não separe o nome do complemento indevidamente: errado "O candidato tinha necessidade, de orientação."; certo "O candidato tinha necessidade de orientação."
4) Não use vírgula automaticamente antes de "e": "O candidato estudou e resolveu as questões" (sem vírgula na estrutura simples) — há situações em que pode ser adequada, dependendo da organização e do sentido.

PONTO E VÍRGULA
Separação maior que a vírgula, menor que o ponto final — separa partes já com vírgulas internas ou organiza itens complexos: "Para a prova, leve documento oficial; caneta transparente, de preferência azul; e o comprovante de inscrição." Também separa orações relacionadas: "O candidato revisou a matéria; em seguida, resolveu o simulado."

DOIS-PONTOS
Introduz explicação, enumeração, fala ou conclusão explicativa: "O edital exige três documentos: identidade, CPF e comprovante de inscrição."; "O fiscal anunciou: 'O tempo de prova começou.'"; "Só havia uma solução: revisar os erros."

TRAVESSÃO E PARÊNTESES
Inserem comentários ou explicações: "O candidato — bastante preparado — terminou a prova antes do prazo."; "O candidato (que havia estudado durante meses) terminou a prova antes do prazo." A escolha varia conforme estilo e efeito pretendido.

PEGADINHAS
Não coloque vírgula entre sujeito e verbo sem justificativa sintática. Uma oração explicativa entre vírgulas pode ter sentido diferente de uma restritiva sem vírgulas. Uma pausa na fala não significa, por si só, que deva haver vírgula na escrita.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — pontuação (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Regra de três simples (direta/inversa) e composta — introdução', 35, $$REGRA DE TRÊS SIMPLES DIRETA
Duas grandezas são diretamente proporcionais quando uma aumenta e a outra também aumenta na mesma proporção (ou ambas diminuem). Ex.: 3 cadernos custam R$ 24, quanto custam 5? Mais cadernos → maior preço: relação direta. 3x = 5×24 → 3x = 120 → x = 40.

REGRA DE TRÊS SIMPLES INVERSA
Uma aumenta, a outra diminui na mesma relação. Ex.: 4 trabalhadores concluem um serviço em 12 dias; em quanto tempo 6 trabalhadores concluiriam o mesmo serviço? Mais trabalhadores, menos dias: relação inversa. Multiplica-se diretamente: 4×12 = 6×x → 48 = 6x → x = 8 dias.

COMO SABER SE É DIRETA OU INVERSA
Pergunte: se eu aumentar a primeira grandeza, o que acontece com a segunda? Direta: mais produtos → maior preço (preço unitário fixo); mais horas trabalhadas → maior produção (ritmo mantido). Inversa: mais trabalhadores → menos tempo para o mesmo serviço; maior velocidade → menos tempo para a mesma distância. Cuidado: verifique se existe relação proporcional real e se as demais condições permanecem constantes.

EXEMPLO COM VELOCIDADE
Veículo percorre 180 km em 3h, velocidade constante. Quantos km em 5h? Mais tempo, maior distância: direta. 180/3 = x/5 → 3x = 900 → x = 300 km.

REGRA DE TRÊS COMPOSTA — INTRODUÇÃO
Envolve três ou mais grandezas. Ex.: 4 máquinas produzem 200 peças em 5 horas. Quantas peças 6 máquinas produzirão em 8 horas, mesma produtividade? Mais máquinas → mais peças (direta); mais horas → mais peças (direta). x = 200 × (6/4) × (8/5) = 200 × 1,5 × 1,6 = 480 peças.
O segredo é comparar cada grandeza com a que contém a incógnita, verificando se a relação é direta ou inversa, grandeza por grandeza.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — regra de três (Q1 a Q4)', 15
  from d returning id
),
b_adm_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Administrativo', 'teoria', 'Atos administrativos: elementos (CO-FI-FO-MO-OB), atributos, anulação/revogação, vinculado/discricionário', 30, $$Ato administrativo é a manifestação unilateral da Administração Pública (ou de quem exerça função administrativa) que produz efeitos jurídicos, sob regime de direito público. Ex.: aplicar penalidade, conceder licença (requisitos legais), nomear servidor, autorizar atividade. Não confunda com fato administrativo (realização material, como executar uma obra).

OS CINCO ELEMENTOS — macete CO-FI-FO-MO-OB
Competência: quem tem atribuição legal para o ato. Finalidade: objetivo público previsto pelo ordenamento. Forma: maneira pela qual o ato se exterioriza. Motivo: pressupostos de fato e de direito que justificam o ato. Objeto: conteúdo/efeito jurídico produzido.
Ex.: multa administrativa — competência (autoridade com atribuição), finalidade (interesse público legal), forma (exigida em lei), motivo (fato + fundamento jurídico), objeto (a multa em si). Falta ou vício de elemento pode comprometer a validade, conforme a natureza do defeito.

ATRIBUTOS DOS ATOS ADMINISTRATIVOS
Presunção de legitimidade e veracidade: o ato é presumido conforme o direito e os fatos declarados são presumidos verdadeiros — presunção RELATIVA, admite prova em contrário.
Imperatividade: certos atos impõem obrigações independentemente da concordância do particular — nem todo ato tem imperatividade.
Autoexecutoriedade: em certas hipóteses, a Administração executa sua decisão sem autorização judicial prévia (previsão legal ou situações urgentes admitidas).
Tipicidade: o ato deve corresponder a uma figura prevista pelo ordenamento, com efeitos previstos pelo direito.

ANULAÇÃO × REVOGAÇÃO
Anulação: relacionada à ilegalidade; pode ser feita pela Administração e, quando cabível, pelo Judiciário; examina legalidade; desfaz ato ilegal.
Revogação: relacionada à conveniência e oportunidade; feita pela própria Administração; examina mérito administrativo; retira ato válido por razões supervenientes, nos limites legais.
Macete: ato ilegal → anulação. Ato legal que deixou de ser conveniente/oportuno → revogação. O Judiciário controla legalidade, mas não substitui a Administração no mérito legítimo (ressalvado o controle de juridicidade cabível).

ATO VINCULADO × DISCRICIONÁRIO
Vinculado: a lei estabelece os requisitos; a Administração não tem liberdade de escolha quanto ao conteúdo, preenchidos os requisitos. Ex.: conceder licença quando a lei determina e os requisitos estão comprovados.
Discricionário: a lei permite margem de escolha, dentro dos limites jurídicos, considerando conveniência e oportunidade. Discricionariedade não é liberdade para agir arbitrariamente — o ato continua sujeito à lei, à finalidade pública e aos princípios administrativos.

ATOS SIMPLES, COMPLEXOS E COMPOSTOS
Simples: manifestação de vontade de um único órgão (mesmo que colegiado). Complexo: conjugação de manifestações de órgãos distintos, formando um ato único. Composto: um ato principal e outro que o aprova/controla/complementa.

PEGADINHAS
Nem todo ato tem imperatividade ou autoexecutoriedade. Presunção de legitimidade não significa impossibilidade de contestação. Revogação ≠ anulação. Discricionariedade não permite desrespeitar a lei. A Administração anula atos ilegais respeitando competência, procedimento e segurança jurídica.$$
  from d returning id
),
b_adm_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Administrativo', 'exercicios', 'Fixação — atos administrativos (Q1 a Q4)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'Sistema operacional, arquivos, extensões, atalhos, RAM/armazenamento, backup/sincronização', 25, $$SISTEMA OPERACIONAL
Software que gerencia processador, memória, dispositivos e periféricos, fornecendo interface ao usuário e serviços aos aplicativos. Ex.: Windows, Linux, macOS, Android, iOS. Word, Excel e navegadores são aplicativos, não sistemas operacionais.

ARQUIVO, PASTA E CAMINHO
Arquivo: dados armazenados sob um nome (documento, imagem, planilha). Pasta: organiza arquivos e outras pastas. Caminho: localização do arquivo/pasta. Ex.: C:\Users\Usuario\Documents\concurso.pdf — C: é a unidade; Users/Usuario e Documents são a estrutura de pastas; concurso.pdf é o arquivo com extensão.

EXTENSÕES COMUNS
.pdf (documento PDF), .docx (Word), .xlsx (Excel), .pptx (PowerPoint), .txt (texto simples), .jpg/.png (imagem), .mp3 (áudio), .mp4 (vídeo), .zip (compactado), .exe (executável do Windows). A extensão não garante segurança nem que o conteúdo corresponda ao nome — arquivos maliciosos podem usar nomes enganosos.

OPERAÇÕES COM ARQUIVOS
Copiar: cria outra cópia no destino. Recortar e colar: move o arquivo. Renomear: altera o nome. Excluir: remove do local original, pode ir à Lixeira. Restaurar: recupera da Lixeira. Compactar: agrupa e pode reduzir espaço. Extrair: recupera arquivos de um pacote compactado. O comportamento pode variar conforme configuração e tipo de unidade.

ATALHOS DO WINDOWS
Win+E: Explorador de Arquivos. Win+D: mostra/oculta a área de trabalho. Alt+Tab: alterna janelas. Ctrl+C/X/V: copia/recorta/cola. Ctrl+Z: desfaz. F2: renomeia o item selecionado. Delete: exclui (normalmente para a Lixeira). Shift+Delete: exclusão sem passar pela Lixeira, em situações compatíveis.

MEMÓRIA RAM × ARMAZENAMENTO
RAM: armazena temporariamente dados em uso, é volátil (perde o conteúdo ao desligar), ajuda a executar tarefas. SSD/HD: armazenamento persistente, guardam arquivos mesmo após desligar; SSD normalmente é mais rápido que HD mecânico. Macete: RAM = memória de trabalho; SSD/HD = armazenamento de longo prazo.

BACKUP, SINCRONIZAÇÃO E NUVEM
Backup: cópia para recuperação em caso de perda/dano. Sincronização: mantém arquivos alinhados entre dispositivos/serviços. Nuvem: armazenamento em infraestrutura acessada pela rede. Atenção: sincronizar não substitui backup — se um arquivo é apagado/corrompido, a alteração pode se propagar aos outros locais. Backups com histórico de versões e testes de restauração reduzem esse risco.$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — sistemas operacionais e arquivos (Q1 a Q4)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 15, com revisão acumulada dos Dias 11 a 14 (Q17 a Q28)', 40,
    $$Sem consulta. 12 questões misturando pontuação, regra de três, atos administrativos, sistemas operacionais e revisão de regência, aumento percentual, remédios constitucionais, Excel e LIMPE dos dias anteriores.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Revisão final, caderno de erros e checklist do Dia 15', 20, $$CHECKLIST DO DIA 15
Sei quando a vírgula separa termos e quando seu uso é inadequado. Consigo distinguir regra de três direta e inversa. Sei calcular regra de três composta simples. Memorizei competência, finalidade, forma, motivo e objeto (CO-FI-FO-MO-OB). Diferencio anulação de revogação. Sei distinguir sistema operacional de aplicativo. Reconheço extensões comuns e atalhos do Windows. Lembro a diferença entre RAM, armazenamento e backup.

PLANO DE REVISÃO
Amanhã, antes do Dia 16: 10–15 min para revisar pontuação, regra de três e os cinco elementos do ato administrativo.
Após 7 dias: refaça as questões erradas dos Dias 14 e 15.
Após 30 dias: simulado cumulativo, misturando Português, Matemática, Constitucional, Administrativo e Informática.
(O app já agenda isso sozinho via o caderno de erros — 24h, 7 dias e 30 dias, visíveis no Painel.)

CADERNO DE ERROS
Para cada erro, anote o assunto, por que errou e qual regra resolveria a questão — isso ajuda a não repetir o mesmo erro em outras provas. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app. Marque este bloco como concluído para fechar o Dia 15 e abrir a Semana 4.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a frase com pontuação adequada.',
   '{"A":"Os candidatos, chegaram cedo.","B":"Os candidatos chegaram cedo.","C":"Os candidatos chegaram, cedo ao local.","D":"Os, candidatos chegaram cedo."}'::jsonb,
   'B', 'Não se separa sujeito ("os candidatos") do verbo ("chegaram") por vírgula.'),

  ((select id from b_port_ex), 2, 'Português',
   'Em qual alternativa o vocativo está pontuado corretamente?',
   '{"A":"Servidor entregue o relatório.","B":"Servidor, entregue o relatório.","C":"Servidor entregue, o relatório.","D":"Servidor; entregue, o relatório."}'::jsonb,
   'B', '"Servidor" é vocativo e deve ser isolado por vírgula.'),

  ((select id from b_port_ex), 3, 'Português',
   'Qual frase apresenta uma enumeração corretamente pontuada?',
   '{"A":"Foram estudados Português Matemática e Informática.","B":"Foram estudados, Português Matemática e Informática.","C":"Foram estudados Português, Matemática e Informática.","D":"Foram, estudados Português, Matemática e Informática."}'::jsonb,
   'C', 'Os itens da enumeração são separados por vírgula, com "e" antes do último.'),

  ((select id from b_port_ex), 4, 'Português',
   'Qual alternativa usa os dois-pontos adequadamente?',
   '{"A":"O edital exigia: que o candidato estudasse.","B":"O candidato levou: seus documentos.","C":"Foram exigidos três itens: identidade, caneta e comprovante.","D":"O servidor: entregou o documento."}'::jsonb,
   'C', 'Os dois-pontos introduzem corretamente a enumeração dos três itens exigidos.'),

  -- Matemática — fixação (Q1-4)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Se 4 canetas custam R$ 12, quanto custam 10 canetas iguais?',
   '{"A":"R$ 24","B":"R$ 30","C":"R$ 32","D":"R$ 36"}'::jsonb,
   'B', 'Preço unitário: 12/4 = 3. Para 10 canetas: 10 × 3 = 30.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Oito trabalhadores fazem um serviço em 15 dias. Em quantos dias 12 trabalhadores fariam o mesmo serviço, no mesmo ritmo?',
   '{"A":"8 dias","B":"10 dias","C":"12 dias","D":"22,5 dias"}'::jsonb,
   'B', 'Regra de três inversa: 8×15 = 12×x → 120 = 12x → x = 10 dias.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Um veículo percorre 240 km em 4 horas, com velocidade constante. Quantos quilômetros percorrerá em 6 horas?',
   '{"A":"300 km","B":"320 km","C":"360 km","D":"400 km"}'::jsonb,
   'C', 'Velocidade: 240/4 = 60 km/h. Em 6 horas: 6 × 60 = 360 km.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Cinco máquinas produzem 300 peças em 6 horas. Quantas peças 10 máquinas produzirão em 4 horas, na mesma produtividade?',
   '{"A":"300","B":"350","C":"400","D":"600"}'::jsonb,
   'C', 'Produção por máquina/hora: 300/(5×6) = 10. Para 10 máquinas em 4h: 10×4×10 = 400.'),

  -- Administrativo — fixação (Q1-4)
  ((select id from b_adm_ex), 1, 'Administrativo',
   'Qual elemento do ato administrativo corresponde ao conteúdo ou efeito jurídico produzido?',
   '{"A":"Competência","B":"Finalidade","C":"Objeto","D":"Forma"}'::jsonb,
   'C', 'Objeto é o conteúdo/efeito jurídico produzido pelo ato.'),

  ((select id from b_adm_ex), 2, 'Administrativo',
   'A Administração identifica que um ato é ilegal e decide desfazê-lo. Em regra, trata-se de:',
   '{"A":"Revogação por conveniência.","B":"Anulação por ilegalidade.","C":"Convalidação obrigatória em todos os casos.","D":"Delegação de competência."}'::jsonb,
   'B', 'Ato ilegal → anulação.'),

  ((select id from b_adm_ex), 3, 'Administrativo',
   'A presunção de legitimidade dos atos administrativos é, em regra:',
   '{"A":"Absoluta e impossível de contestar.","B":"Relativa, admitindo prova em contrário.","C":"Uma autorização para descumprir a lei.","D":"Aplicável somente a atos judiciais."}'::jsonb,
   'B', 'A presunção é relativa — admite prova em contrário.'),

  ((select id from b_adm_ex), 4, 'Administrativo',
   'A revogação de um ato administrativo válido relaciona-se, em regra:',
   '{"A":"À conveniência e oportunidade administrativas, dentro dos limites legais.","B":"À constatação obrigatória de crime.","C":"Exclusivamente à decisão judicial.","D":"À ausência de competência em todos os casos."}'::jsonb,
   'A', 'Revogação examina o mérito administrativo — conveniência e oportunidade.'),

  -- Informática — fixação (Q1-4)
  ((select id from b_info_ex), 1, 'Informática',
   'Qual alternativa apresenta um sistema operacional?',
   '{"A":"Microsoft Word","B":"Microsoft Excel","C":"Windows","D":"Adobe Acrobat Reader"}'::jsonb,
   'C', 'Windows é sistema operacional; as demais são aplicativos.'),

  ((select id from b_info_ex), 2, 'Informática',
   'A extensão .xlsx está normalmente associada a:',
   '{"A":"Uma planilha do Excel.","B":"Um arquivo de áudio.","C":"Um vídeo.","D":"Um programa executável."}'::jsonb,
   'A', '.xlsx é a extensão de planilhas do Excel.'),

  ((select id from b_info_ex), 3, 'Informática',
   'No Windows, qual atalho abre o Explorador de Arquivos?',
   '{"A":"Win + E","B":"Ctrl + P","C":"Alt + F4","D":"Win + L"}'::jsonb,
   'A', 'Win+E abre o Explorador de Arquivos.'),

  ((select id from b_info_ex), 4, 'Informática',
   'Qual é a característica da memória RAM?',
   '{"A":"Armazena permanentemente todos os arquivos mesmo sem energia.","B":"É uma memória volátil usada durante a execução de tarefas.","C":"É sempre mais lenta que um HD.","D":"É um tipo de arquivo compactado."}'::jsonb,
   'B', 'RAM é memória de trabalho, volátil — perde o conteúdo ao desligar.'),

  -- Mini-simulado (Q17-28)
  ((select id from b_simulado), 1, 'Português',
   'Assinale a frase corretamente pontuada.',
   '{"A":"O servidor, entregou o documento.","B":"O servidor entregou o documento.","C":"O servidor entregou, o documento.","D":"O, servidor entregou o documento."}'::jsonb,
   'B', 'Não se separa sujeito e verbo, nem verbo e complemento, por vírgula.'),

  ((select id from b_simulado), 2, 'Matemática/RLM',
   'Se 6 produtos custam R$ 42, quanto custam 10 produtos iguais?',
   '{"A":"R$ 60","B":"R$ 65","C":"R$ 70","D":"R$ 72"}'::jsonb,
   'C', 'Preço unitário: 42/6 = 7. Para 10 produtos: 10 × 7 = 70.'),

  ((select id from b_simulado), 3, 'Administrativo',
   'Qual elemento do ato administrativo corresponde à razão de fato e de direito que justifica sua prática?',
   '{"A":"Objeto","B":"Forma","C":"Motivo","D":"Competência"}'::jsonb,
   'C', 'Motivo são os pressupostos de fato e de direito que justificam o ato.'),

  ((select id from b_simulado), 4, 'Informática',
   'Qual extensão está normalmente associada a um arquivo compactado?',
   '{"A":".mp3","B":".zip","C":".xlsx","D":".pptx"}'::jsonb,
   'B', '.zip é a extensão típica de arquivo compactado.'),

  ((select id from b_simulado), 5, 'Português',
   'A frase "O candidato assistiu à palestra" está correta porque o verbo assistir, no sentido de presenciar:',
   '{"A":"Não admite complemento.","B":"Exige a preposição a.","C":"Exige sempre a preposição de.","D":"É sempre intransitivo."}'::jsonb,
   'B', '"Assistir" no sentido de presenciar exige a preposição "a", que se funde com o artigo feminino de "palestra".'),

  ((select id from b_simulado), 6, 'Matemática/RLM',
   'Quatro funcionários fazem um serviço em 18 dias. Mantidas as condições, seis funcionários fariam o mesmo serviço em:',
   '{"A":"9 dias","B":"12 dias","C":"15 dias","D":"27 dias"}'::jsonb,
   'B', 'Regra de três inversa: 4×18 = 6×x → 72 = 6x → x = 12 dias.'),

  ((select id from b_simulado), 7, 'Administrativo',
   'Qual alternativa diferencia corretamente anulação e revogação?',
   '{"A":"Anulação decorre de ilegalidade; revogação, em regra, de conveniência e oportunidade.","B":"Anulação e revogação são sinônimos.","C":"Revogação é sempre feita pelo Poder Judiciário.","D":"Anulação ocorre somente quando o ato é conveniente."}'::jsonb,
   'A', 'É a diferença central entre os dois institutos.'),

  ((select id from b_simulado), 8, 'Informática',
   'Qual atalho do Windows é usado normalmente para alternar entre janelas abertas?',
   '{"A":"Ctrl + C","B":"Alt + Tab","C":"Win + E","D":"Ctrl + S"}'::jsonb,
   'B', 'Alt+Tab alterna entre as janelas abertas.'),

  ((select id from b_simulado), 9, 'Matemática/RLM',
   'Um produto de R$ 300 recebe aumento de 20%. Qual é o novo preço?',
   '{"A":"R$ 320","B":"R$ 340","C":"R$ 360","D":"R$ 380"}'::jsonb,
   'C', '300 × 1,20 = 360.'),

  ((select id from b_simulado), 10, 'Constitucional',
   'Segundo a Constituição, uma reunião pacífica em local aberto ao público:',
   '{"A":"Depende sempre de autorização judicial.","B":"Independe de autorização, mas exige prévio aviso à autoridade competente e observância dos demais requisitos constitucionais.","C":"Pode ocorrer com armas livremente.","D":"Só pode ocorrer dentro de edifícios públicos."}'::jsonb,
   'B', 'Não se exige autorização, mas sim aviso prévio e os demais requisitos constitucionais.'),

  ((select id from b_simulado), 11, 'Informática',
   'Qual função do Excel calcula a média aritmética de um intervalo?',
   '{"A":"SOMA","B":"MÁXIMO","C":"MÉDIA","D":"CONT.NÚM"}'::jsonb,
   'C', '=MÉDIA calcula a média aritmética do intervalo.'),

  ((select id from b_simulado), 12, 'Administrativo',
   'Um servidor concede tratamento privilegiado a um conhecido, sem fundamento legal. Qual princípio administrativo é diretamente comprometido?',
   '{"A":"Impessoalidade","B":"Publicidade","C":"Eficiência, exclusivamente","D":"Continuidade, exclusivamente"}'::jsonb,
   'A', 'Favorecimento pessoal sem fundamento legal viola diretamente a impessoalidade.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
