-- Cadastra o Dia 16 (versão completa e robusta).
delete from days where week = 4 and day_number = 2;

with d as (
  insert into days (week, day_number, title)
  values (4, 2, 'Interpretação de textos + razão/proporção/escalas + poderes administrativos + redes/internet/computação em nuvem')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Compreensão × interpretação, inferência × extrapolação, conectivos, denotação/conotação', 30, $$COMPREENSÃO × INTERPRETAÇÃO
Compreensão é localizar uma informação explícita no texto. Interpretação é compreender o sentido, uma relação ou uma conclusão sustentada pelo texto — sem estar escrita exatamente daquela forma. Atenção: interpretar não é inventar; a conclusão deve ser sustentada pelas informações apresentadas.

TEMA, IDEIA PRINCIPAL E FINALIDADE
Tema: assunto geral. Ideia principal: informação central que o autor transmite sobre o tema. Finalidade: objetivo do texto (informar, convencer, orientar, criticar, narrar). Ex.: texto sobre leitura — tema é "leitura"; ideia principal é que a leitura frequente melhora habilidades importantes; finalidade é defender/recomendar o hábito de leitura.

INFORMAÇÃO EXPLÍCITA × IMPLÍCITA
Explícita: diretamente afirmada. Implícita: deduzida a partir de pistas do texto. Ex.: "João pegou o guarda-chuva antes de sair. O céu estava escuro e havia trovões." Explícito: pegou o guarda-chuva. Inferência razoável: provavelmente esperava chuva. Não dá para afirmar que ele se molhou ou que a chuva já começou — não foi dito.

INFERÊNCIA × EXTRAPOLAÇÃO × CONTRADIÇÃO
Inferência válida: conclusão compatível com o texto. Extrapolação: afirmação que vai além do que o texto permite concluir. Contradição: afirmação que conflita com o texto.
Ex.: "O número de atendimentos aumentou em março em comparação com fevereiro." → "Março teve mais atendimentos que fevereiro" (confirmado) × "O serviço melhorou em todos os aspectos" (extrapolação) × "Março teve menos atendimentos" (contradição). Mais atendimentos não prova, por si só, que a qualidade melhorou ou piorou.

CONECTIVOS
Mas/porém/contudo → oposição ("Estudou, mas errou."). Porque/pois → causa/explicação ("Faltou porque estava doente."). Portanto/logo → conclusão ("Estudou; portanto, estava preparado."). Embora/apesar de → concessão ("Embora estivesse cansado, continuou."). Se/caso → condição ("Se estudar, poderá melhorar."). Além disso → adição ("Leu o texto; além disso, fez anotações."). Por exemplo → exemplificação ("Há várias funções, por exemplo, SOMA e MÉDIA."). Não basta decorar a palavra isolada — observe como ela conecta as ideias no contexto.

DENOTAÇÃO × CONOTAÇÃO
Denotação: sentido literal ("A porta está aberta" = fisicamente aberta). Conotação: sentido figurado ("Ele abriu as portas para novas oportunidades" = criou possibilidades, não necessariamente uma porta física).

COMO RESOLVER
1) Leia o texto inteiro uma vez. 2) Identifique assunto e ideia principal. 3) Leia o comando com atenção. 4) Volte ao trecho que sustenta a resposta. 5) Elimine alternativas que exageram, contradizem ou acrescentam informações não apresentadas. 6) Desconfie de "sempre", "nunca", "todos", "somente" quando o texto não sustenta essa certeza.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 2, 'Português', 'exercicios', 'Fixação — interpretação de texto sobre digitalização de documentos (Q1 a Q4)', 15,
    $$Texto-base: "A digitalização de documentos pode facilitar o acesso às informações e reduzir a necessidade de espaço físico para armazenamento. Entretanto, a simples conversão de documentos em arquivos digitais não garante, por si só, a organização ou a segurança das informações. Para obter bons resultados, é necessário adotar critérios de classificação, controle de acesso, cópias de segurança e procedimentos de preservação dos arquivos."$$
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Razão, proporção, divisão proporcional, escalas e velocidade média', 35, $$RAZÃO
Comparação entre grandezas por divisão. Turma com 12 homens e 18 mulheres: razão homens/mulheres = 12/18 = 2/3 (para cada 2 homens, 3 mulheres). A ordem importa: mulheres/homens = 18/12 = 3/2. Não confunda razão entre partes com razão entre parte e total: homens/total(30) = 12/30 = 2/5.

SIMPLIFICAÇÃO DE RAZÕES
Divida os dois termos pelo mesmo número ≠ 0. Ex.: 24/36 = (24÷12)/(36÷12) = 2/3.

PROPORÇÃO
Igualdade entre duas razões: 2/3 = 8/12 (pois 2×12 = 3×8). Propriedade fundamental: a/b = c/d → a×d = b×c (denominadores ≠ 0) — base de muitos cálculos de regra de três.

DIVISÃO PROPORCIONAL
Ex.: dividir R$ 600 na razão 2:3. Soma das partes: 2+3=5. Valor de cada parte: 600÷5=120. Primeira pessoa: 2×120=240. Segunda: 3×120=360. Confira: 240+360=600.

ESCALAS
Compara medida no desenho/mapa com a medida real. Escala 1:100.000 → 1 unidade no mapa = 100.000 unidades reais (1 cm no mapa = 100.000 cm reais = 1 km real). Ex.: mapa 1:50.000, distância de 4 cm no mapa. Real: 4×50.000=200.000 cm → ÷100=2.000 m → ÷1.000=2 km.
Pegadinha: confira se as unidades são compatíveis antes de converter — converta só depois do cálculo, de forma consistente.

VELOCIDADE MÉDIA
v_m = distância total ÷ tempo total. Ex.: 150 km em 3h → v_m = 150/3 = 50 km/h. Atenção: em trajetos com velocidades diferentes, a velocidade média usa distância total ÷ tempo total — não é a média aritmética das velocidades.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — razão, proporção e escalas (Q1 a Q4)', 15
  from d returning id
),
b_adm_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Administrativo', 'teoria', 'Poderes administrativos: vinculado, discricionário, hierárquico, disciplinar, regulamentar, de polícia e abuso de poder', 30, $$Poderes administrativos são instrumentos jurídicos que permitem à Administração cumprir suas atribuições e atender ao interesse público — não são privilégios pessoais; devem ser usados conforme a lei e a finalidade pública.

PODER VINCULADO
A lei estabelece os requisitos e a atuação não deixa margem de escolha quanto à decisão, uma vez preenchidos os requisitos. Ex.: licença que a lei determina conceder quando cumpridos os requisitos — a Administração não pode negar por preferência pessoal.

PODER DISCRICIONÁRIO
Margem de escolha dentro dos limites do ordenamento — pode envolver conveniência e oportunidade, respeitando competência, finalidade pública, motivação e demais limites legais. Pegadinha: discricionariedade não é arbitrariedade — o agente não escolhe "qualquer coisa" nem age por interesse pessoal.

PODER HIERÁRQUICO
Organização interna: distribuir e organizar funções, dar ordens aos subordinados, fiscalizar atividades, delegar/avocar competências (quando permitido), rever atos de subordinados. Ex.: chefe distribui tarefas e acompanha a execução. A hierarquia não autoriza ordem manifestamente ilegal.

PODER DISCIPLINAR
Apurar infrações e aplicar sanções a quem está sob disciplina administrativa (servidores e, em certas situações, particulares com vínculo específico). Deve respeitar legalidade, devido processo legal, contraditório e ampla defesa quando exigidos.
Diferença: hierárquico = organização/direção/fiscalização interna; disciplinar = apuração de infrações e sanções.

PODER REGULAMENTAR
Competência para editar atos normativos destinados à fiel execução das leis, nos limites constitucionais e legais. Regra geral: o regulamento não pode contrariar a lei nem criar obrigação sem fundamento jurídico. A Constituição prevê hipóteses específicas de decreto autônomo (art. 84, VI) — isso não é autorização geral para o Executivo legislar livremente.

PODER DE POLÍCIA
Atividade que condiciona ou restringe o exercício de direitos, atividades ou bens em benefício do interesse público, conforme a lei. Ex.: fiscalização sanitária, controle de atividades poluidoras, fiscalização de trânsito, verificação de regras de segurança. Pode envolver consentimento, fiscalização, medidas preventivas e sanções.
Atributos frequentemente associados: discricionariedade (há margem de escolha em certas decisões, mas existem atos de polícia vinculados), autoexecutoriedade (execução direta em hipóteses admitidas, não em toda medida), coercibilidade (medidas podem ser impostas ao particular, dentro da lei). Não generalize que todo ato de polícia tem necessariamente os três atributos.

ABUSO DE PODER
Excesso de poder: o agente ultrapassa sua competência/atribuições. Ex.: pratica medida que legalmente não poderia determinar.
Desvio de finalidade: o agente usa a competência para finalidade diferente da prevista, especialmente pessoal ou imprópria. Ex.: transferir servidor como perseguição pessoal, sem finalidade pública legítima.
Macete: excesso = ultrapassou os limites da competência; desvio = usou o poder com finalidade indevida.$$
  from d returning id
),
b_adm_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Administrativo', 'exercicios', 'Fixação — poderes administrativos (Q1 a Q4)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'Redes (LAN/WAN/WLAN), internet/intranet/extranet, URL/DNS, HTTP/HTTPS, upload/download, nuvem (SaaS/PaaS/IaaS)', 25, $$REDE DE COMPUTADORES
Conjunto de dispositivos conectados para trocar informações e compartilhar recursos (arquivos, impressoras, serviços, acesso à internet). LAN: rede local (ex.: escritório). WAN: rede de longa distância, conectando redes afastadas. WLAN: rede local sem fio (Wi-Fi). Internet: rede mundial de redes interconectadas. Atenção: Wi-Fi é tecnologia de comunicação sem fio, não é sinônimo de internet — um dispositivo pode estar na rede Wi-Fi sem acesso à internet.

INTERNET, INTRANET E EXTRANET
Internet: rede mundial acessível por diferentes redes e serviços. Intranet: ambiente de rede privado que disponibiliza recursos internos a uma organização. Extranet: permite que usuários externos autorizados (fornecedores, parceiros) acessem parte dos recursos de uma organização. Ex.: site público de uma prefeitura = internet; sistema interno de gestão = intranet; portal restrito para fornecedores = extranet.

NAVEGADOR × MECANISMO DE BUSCA
Navegador: programa para acessar páginas/aplicações web (Chrome, Edge, Firefox, Safari). Mecanismo de busca: serviço para localizar informações na web (Google, Bing, DuckDuckGo). O navegador é a ferramenta usada para acessar o mecanismo de busca — não são a mesma coisa.

URL, DOMÍNIO E IP
URL é o endereço de um recurso: https://www.exemplo.com.br/documentos — https é o protocolo; www.exemplo.com.br é o host/domínio; /documentos é o caminho. Endereço IP identifica um destino de rede para comunicação. DNS traduz nomes de domínio em endereçamento, como IPs. Não confunda: domínio é um nome; IP é um endereço de rede.

HTTP E HTTPS
HTTP: protocolo para transferir informações na web. HTTPS: HTTP protegido por TLS — criptografia e autenticação do servidor, conforme o certificado. Protege a transmissão, mas não garante que o site seja honesto — site fraudulento também pode usar HTTPS. O cadeado não garante confiabilidade.

UPLOAD × DOWNLOAD
Upload: envio de dados do dispositivo para outro sistema/servidor (ex.: enviar currículo a um portal). Download: recebimento de dados para o dispositivo (ex.: baixar comprovante de inscrição).

COMPUTAÇÃO EM NUVEM
Uso de recursos computacionais via rede (normalmente internet), sem manter toda a infraestrutura localmente — armazenamento, aplicações online, processamento. Modelos: SaaS (Software como Serviço — aplicação pronta, ex.: e-mail online); PaaS (Plataforma como Serviço — ambiente para desenvolver/executar aplicações); IaaS (Infraestrutura como Serviço — máquinas virtuais, armazenamento, redes).
Macete: SaaS = software pronto; PaaS = plataforma; IaaS = infraestrutura.

CUIDADOS DE SEGURANÇA EM REDES
Senhas exclusivas + MFA; evitar sistemas sensíveis em redes públicas sem proteção; conferir o domínio antes de digitar credenciais; não abrir anexos inesperados sem verificar origem; manter sistemas/navegadores atualizados; backups com testes de recuperação.$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — redes, internet e nuvem (Q1 a Q4)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 16, com revisão acumulada (Q17 a Q28)', 40,
    $$Sem consulta. 12 questões misturando interpretação de texto, razão/proporção, poderes administrativos, redes/internet, e revisão de pontuação, regra de três, anulação/revogação, habeas corpus, Excel, porcentagem, segurança e desvio de finalidade.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Revisão final e checklist do Dia 16', 20, $$CHECKLIST DO DIA 16
Consigo diferenciar compreensão, interpretação e extrapolação. Reconheço conectivos de oposição, causa, conclusão e condição. Sei simplificar razões e resolver proporções. Consigo resolver questões de divisão proporcional e escala. Diferencio os poderes hierárquico, disciplinar e de polícia. Sei distinguir excesso de poder e desvio de finalidade. Diferencio internet, intranet, navegador e mecanismo de busca. Sei explicar HTTP/HTTPS, DNS, upload, download e nuvem.

As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app, com revisão agendada em 24h, 7 dias e 30 dias, visível no Painel. Marque este bloco como concluído para fechar o Dia 16.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4, sobre o texto de digitalização)
  ((select id from b_port_ex), 1, 'Português',
   'Qual é a ideia principal do texto?',
   '{"A":"A digitalização elimina a necessidade de organização.","B":"A digitalização pode trazer benefícios, mas exige medidas complementares para organizar e proteger as informações.","C":"Documentos digitais são sempre mais seguros que documentos físicos.","D":"A única finalidade da digitalização é economizar espaço."}'::jsonb,
   'B', 'O texto apresenta o benefício (acesso/espaço) e, logo depois com "entretanto", ressalva que isso não garante organização/segurança sem medidas complementares.'),

  ((select id from b_port_ex), 2, 'Português',
   'A palavra "Entretanto" estabelece uma relação de:',
   '{"A":"Conclusão.","B":"Adição.","C":"Oposição ou contraste.","D":"Finalidade."}'::jsonb,
   'C', '"Entretanto" é conjunção adversativa — contrapõe o benefício citado antes com a ressalva que vem depois.'),

  ((select id from b_port_ex), 3, 'Português',
   'Segundo o texto, a simples conversão de documentos em arquivos digitais:',
   '{"A":"Garante a segurança completa.","B":"Elimina a necessidade de cópias de segurança.","C":"Não garante, por si só, organização ou segurança.","D":"Impede o controle de acesso."}'::jsonb,
   'C', 'É exatamente o que o texto afirma: a conversão sozinha não garante organização nem segurança.'),

  ((select id from b_port_ex), 4, 'Português',
   'Qual medida é mencionada no texto como necessária para obter bons resultados?',
   '{"A":"Eliminar todos os documentos antigos.","B":"Adotar critérios de classificação e controle de acesso.","C":"Permitir acesso irrestrito a todos os arquivos.","D":"Substituir todas as cópias de segurança por arquivos únicos."}'::jsonb,
   'B', 'O texto cita classificação, controle de acesso, cópias de segurança e preservação como medidas necessárias.'),

  -- Matemática — fixação (Q1-4)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'A razão entre 15 e 25, na forma simplificada, é:',
   '{"A":"3/5","B":"5/3","C":"2/5","D":"5/8"}'::jsonb,
   'A', '15/25 simplifica dividindo por 5: 3/5.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'R$ 840 serão divididos na razão 3:4. Quanto receberá a pessoa correspondente a 3 partes?',
   '{"A":"R$ 240","B":"R$ 360","C":"R$ 420","D":"R$ 480"}'::jsonb,
   'B', 'Soma das partes: 3+4=7. Valor de cada parte: 840/7=120. Para 3 partes: 3×120=360.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Em uma escala 1:100.000, 3 cm no mapa correspondem a:',
   '{"A":"300 m","B":"1 km","C":"3 km","D":"30 km"}'::jsonb,
   'C', '3×100.000=300.000 cm = 3.000 m = 3 km.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Um veículo percorreu 210 km em 3,5 horas. Qual foi sua velocidade média?',
   '{"A":"50 km/h","B":"55 km/h","C":"60 km/h","D":"70 km/h"}'::jsonb,
   'C', '210 ÷ 3,5 = 60 km/h.'),

  -- Administrativo — fixação (Q1-4)
  ((select id from b_adm_ex), 1, 'Administrativo',
   'O chefe de um setor distribui tarefas e fiscaliza o trabalho dos subordinados. Qual poder está mais diretamente relacionado?',
   '{"A":"Poder hierárquico","B":"Poder de polícia","C":"Poder regulamentar","D":"Poder constituinte"}'::jsonb,
   'A', 'Distribuir tarefas e fiscalizar subordinados é exercício do poder hierárquico.'),

  ((select id from b_adm_ex), 2, 'Administrativo',
   'A aplicação de uma sanção disciplinar a um servidor, após procedimento adequado, relaciona-se principalmente ao:',
   '{"A":"Poder regulamentar","B":"Poder disciplinar","C":"Poder de polícia exclusivamente","D":"Poder legislativo"}'::jsonb,
   'B', 'Apurar infrações e aplicar sanções a quem está sob disciplina administrativa é o poder disciplinar.'),

  ((select id from b_adm_ex), 3, 'Administrativo',
   'Um agente utiliza sua competência para perseguir pessoalmente um servidor. A situação caracteriza:',
   '{"A":"Excesso de arrecadação","B":"Desvio de finalidade","C":"Poder hierárquico legítimo em qualquer caso","D":"Poder regulamentar"}'::jsonb,
   'B', 'Usar a competência para finalidade pessoal, diferente da prevista, é desvio de finalidade.'),

  ((select id from b_adm_ex), 4, 'Administrativo',
   'A fiscalização sanitária de estabelecimentos é exemplo típico de:',
   '{"A":"Poder de polícia","B":"Poder constituinte","C":"Poder jurisdicional","D":"Poder eleitoral"}'::jsonb,
   'A', 'Fiscalização sanitária condiciona/restringe atividades em prol do interesse público — poder de polícia.'),

  -- Informática — fixação (Q1-4)
  ((select id from b_info_ex), 1, 'Informática',
   'Qual alternativa define corretamente uma intranet?',
   '{"A":"Uma rede mundial pública, necessariamente aberta a todos.","B":"Um ambiente de rede privado usado por uma organização.","C":"Um tipo de arquivo compactado.","D":"Um mecanismo de busca."}'::jsonb,
   'B', 'Intranet é um ambiente de rede privado para disponibilizar recursos internos a uma organização.'),

  ((select id from b_info_ex), 2, 'Informática',
   'Qual é a principal função do DNS?',
   '{"A":"Traduzir nomes de domínio em informações de endereçamento, como IPs.","B":"Criar cópias de segurança automaticamente em todos os computadores.","C":"Substituir todos os protocolos de rede.","D":"Garantir que todos os sites sejam legítimos."}'::jsonb,
   'A', 'DNS traduz nomes de domínio em endereçamento, como endereços IP.'),

  ((select id from b_info_ex), 3, 'Informática',
   'Qual afirmação sobre HTTPS é correta?',
   '{"A":"Garante que todo site seja legítimo.","B":"Protege a comunicação com mecanismos como criptografia e autenticação do servidor.","C":"É usado exclusivamente para baixar arquivos.","D":"Dispensa qualquer cuidado com senhas."}'::jsonb,
   'B', 'HTTPS protege a comunicação (criptografia e autenticação do servidor), mas não garante legitimidade do site.'),

  ((select id from b_info_ex), 4, 'Informática',
   'Qual exemplo representa um download?',
   '{"A":"Enviar um arquivo para um portal.","B":"Publicar um documento em um sistema remoto.","C":"Receber um comprovante de inscrição no computador.","D":"Enviar uma mensagem com anexo."}'::jsonb,
   'C', 'Receber dados de um sistema remoto para o próprio dispositivo é download.'),

  -- Mini-simulado (Q17-28)
  ((select id from b_simulado), 1, 'Português',
   'Leia: "A demanda aumentou, entretanto, o prazo de atendimento permaneceu igual." A palavra "entretanto" indica:',
   '{"A":"Conclusão.","B":"Oposição ou contraste.","C":"Causa.","D":"Condição."}'::jsonb,
   'B', '"Entretanto" é conjunção adversativa — contrapõe o aumento da demanda à manutenção do prazo.'),

  ((select id from b_simulado), 2, 'Matemática/RLM',
   'Uma quantia de R$ 720 é dividida na razão 5:4. Qual é o valor correspondente a 5 partes?',
   '{"A":"R$ 320","B":"R$ 360","C":"R$ 400","D":"R$ 450"}'::jsonb,
   'C', 'Soma das partes: 5+4=9. Cada parte: 720/9=80. Para 5 partes: 5×80=400.'),

  ((select id from b_simulado), 3, 'Administrativo',
   'A fiscalização de estabelecimentos para verificar o cumprimento de regras sanitárias é manifestação típica do:',
   '{"A":"Poder hierárquico.","B":"Poder disciplinar exclusivamente.","C":"Poder de polícia.","D":"Poder constituinte."}'::jsonb,
   'C', 'É exercício do poder de polícia.'),

  ((select id from b_simulado), 4, 'Informática',
   'Qual afirmação sobre a internet e a intranet está correta?',
   '{"A":"Intranet é sempre pública e acessível a qualquer pessoa.","B":"Internet e intranet são termos necessariamente idênticos.","C":"A intranet pode ser usada para disponibilizar recursos internos de uma organização.","D":"Uma intranet não pode usar tecnologias de internet."}'::jsonb,
   'C', 'Intranet usa tecnologias de rede para disponibilizar recursos internos — não é pública.'),

  ((select id from b_simulado), 5, 'Português',
   'Assinale a frase corretamente pontuada.',
   '{"A":"O candidato, resolveu todas as questões.","B":"O candidato resolveu, todas as questões.","C":"O candidato resolveu todas as questões.","D":"O, candidato resolveu todas as questões."}'::jsonb,
   'C', 'Não se separa sujeito e verbo, nem verbo e complemento, por vírgula.'),

  ((select id from b_simulado), 6, 'Matemática/RLM',
   'Se 5 trabalhadores realizam uma tarefa em 12 dias, quantos dias 10 trabalhadores levariam, nas mesmas condições?',
   '{"A":"3 dias","B":"6 dias","C":"10 dias","D":"24 dias"}'::jsonb,
   'B', 'Regra de três inversa: 5×12 = 10×x → 60 = 10x → x = 6 dias.'),

  ((select id from b_simulado), 7, 'Administrativo',
   'Um ato administrativo é desfeito porque a Administração constatou sua ilegalidade. Em regra, isso é:',
   '{"A":"Revogação por conveniência.","B":"Anulação por ilegalidade.","C":"Delegação.","D":"Exercício de poder hierárquico exclusivamente."}'::jsonb,
   'B', 'Ato ilegal → anulação.'),

  ((select id from b_simulado), 8, 'Constitucional',
   'Qual instrumento constitucional está relacionado à proteção da liberdade de locomoção?',
   '{"A":"Habeas corpus.","B":"Habeas data.","C":"Ação popular.","D":"Mandado de injunção."}'::jsonb,
   'A', 'Habeas corpus protege a liberdade de ir e vir.'),

  ((select id from b_simulado), 9, 'Informática',
   'Em uma planilha, qual fórmula calcula a soma de C1 até C5?',
   '{"A":"=MÉDIA(C1:C5)","B":"=SOMA(C1:C5)","C":"=MÁXIMO(C1:C5)","D":"=CONT.NÚM(C1:C5)"}'::jsonb,
   'B', '=SOMA soma os valores do intervalo informado.'),

  ((select id from b_simulado), 10, 'Matemática/RLM',
   'Um produto de R$ 250 recebe desconto de 20%. Qual é o preço final?',
   '{"A":"R$ 180","B":"R$ 190","C":"R$ 200","D":"R$ 220"}'::jsonb,
   'C', '250 × 0,80 = 200.'),

  ((select id from b_simulado), 11, 'Informática',
   'Qual prática ajuda a proteger contas online contra acessos indevidos?',
   '{"A":"Reutilizar a mesma senha em todos os serviços.","B":"Compartilhar a senha com colegas.","C":"Desativar todas as atualizações.","D":"Usar senhas exclusivas e autenticação multifator."}'::jsonb,
   'D', 'Senhas exclusivas por serviço e autenticação multifator são boas práticas recomendadas.'),

  ((select id from b_simulado), 12, 'Administrativo',
   'Um agente utiliza uma competência administrativa para perseguir uma pessoa por motivo pessoal. Isso caracteriza:',
   '{"A":"Desvio de finalidade.","B":"Atuação vinculada legítima obrigatoriamente.","C":"Regulamentação de uma lei.","D":"Presunção absoluta de legitimidade."}'::jsonb,
   'A', 'Usar a competência para finalidade pessoal, diversa da prevista em lei, é desvio de finalidade.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
