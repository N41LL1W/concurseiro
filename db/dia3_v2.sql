-- Cadastra o Dia 3 (versão completa e robusta).
delete from days where week = 1 and day_number = 3;

with d as (
  insert into days (week, day_number, title)
  values (1, 3, 'Classes de palavras + Informática (hardware, software, internet e segurança)')
  returning id
),
b_port_teoria1 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Classes gramaticais — substantivo, artigo, adjetivo, numeral, pronome, verbo', 75, $$Concurso não pergunta só "o que é um substantivo?" — a banca coloca a palavra num contexto e pergunta a que classe ela pertence ali. Por isso o foco de hoje é identificar, não só definir.

1. AS 10 CLASSES GRAMATICAIS
Variáveis: substantivo, artigo, adjetivo, numeral, pronome, verbo. Invariáveis: advérbio, preposição, conjunção, interjeição. "Variável" significa que a palavra pode sofrer alterações de gênero, número, pessoa, tempo etc.

2. SUBSTANTIVO
Nomeia pessoas, lugares, objetos, animais, sentimentos, ações, ideias, conceitos. Ex.: casa, funcionário, Brasil, cachorro, felicidade, estudo, liberdade. Em frase: "O servidor chegou cedo" → servidor = substantivo. "A felicidade é importante" → felicidade = substantivo.

3. SUBSTANTIVAÇÃO
Uma palavra de outra classe pode virar substantivo. Ex.: "O belo nem sempre é útil" — "belo" normalmente é adjetivo, mas aqui, puxado pelo artigo "o", está substantivado.

4. ARTIGO
Acompanha o substantivo. Definido: o, a, os, as (ex.: "O funcionário chegou" — um funcionário determinado). Indefinido: um, uma, uns, umas (ex.: "Um funcionário chegou" — não identifica qual).

5. ADJETIVO
Caracteriza ou atribui qualidade ao substantivo. Ex.: funcionário dedicado, casa grande, prova difícil.
Pegadinha: "O brasileiro estudou para a prova" — aqui "brasileiro" pode ser substantivo. "O cidadão brasileiro estudou" — aqui "brasileiro" caracteriza "cidadão": é adjetivo. Regra: não classifique a palavra isolada, observe a função dela na frase.

6. NUMERAL
Indica quantidade, ordem, multiplicação ou fração. Cardinal: um, dois, três. Ordinal: primeiro, segundo. Multiplicativo: dobro, triplo. Fracionário: meio, terço, quarto. Ex.: "Tenho dois livros" (cardinal); "Fiquei em segundo lugar" (ordinal); "Recebeu o dobro do valor" (multiplicativo); "Comeu meio bolo" (fracionário).

7. PRONOME
Pode substituir um substantivo, acompanhar um substantivo, indicar pessoas, demonstrar posse, localizar algo no texto ou estabelecer relações.
Pessoais: eu, tu, ele, nós, vós, eles. Ex.: "Ele estudou" — "ele" substitui uma pessoa.

8. PRONOMES POSSESSIVOS
meu, minha, seu, sua, nosso, nossa, vosso, vossa — indicam posse. Ex.: "Meu material está na mesa."

9. PRONOMES DEMONSTRATIVOS
este, esse, aquele, isto, isso, aquilo — indicam posição ou relação com o discurso. Ex.: "Este livro está comigo."

10. PRONOMES RELATIVOS
que, quem, o qual, cujo, onde — muito cobrados em concurso. Ex.: "O livro que comprei é excelente" — "que" retoma "livro".
Atenção ao "que": em "O livro que comprei", que = pronome relativo; em "Espero que você estude", que = conjunção integrante. Não decore "que = pronome" — analise o contexto.

11. VERBO
Indica ação, estado, fenômeno ou ocorrência. Ex.: "João estudou" (ação); "João está cansado" (estado); "Choveu ontem" (fenômeno da natureza).

12. TEMPO VERBAL
Presente: eu estudo. Pretérito: eu estudei. Futuro: eu estudarei. Em questões de interpretação, a mudança do tempo verbal pode alterar o sentido.$$
  from d returning id
),
b_port_teoria2 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 2, 'Português', 'teoria', 'Advérbio, preposição, conjunção, interjeição e técnica de identificação', 25, $$13. ADVÉRBIO
Modifica principalmente verbo, adjetivo ou outro advérbio. Pode indicar tempo, lugar, modo, intensidade, afirmação, negação ou dúvida.
Ex.: "Ele chegou cedo" (tempo); "Ele trabalha bem" (modo); "Ele mora aqui" (lugar); "Ele está muito cansado" (intensidade); "Ele não estudou" (negação).
Adjetivo × advérbio: "O aluno é rápido" — rápido caracteriza o aluno → adjetivo. "O aluno corre rápido" — rápido modifica a ação de correr → valor adverbial. Essa diferença cai em prova.

14. PREPOSIÇÃO
Estabelece relação entre palavras: a, ante, após, até, com, contra, de, desde, em, entre, para, por, sem, sob, sobre. Ex.: "Livro de Português" — "de" relaciona "livro" e "Português".

15. CONJUNÇÃO
Liga palavras ou orações, com relação lógica. Ex.: "Estudei e fiz exercícios" (adição).
Relações importantes: adição (e); oposição (mas, porém, contudo, entretanto); causa (porque, visto que, já que); condição (se, caso); conclusão (portanto, logo, assim); finalidade (para que, a fim de que).
Pegadinha: a mesma palavra pode mudar de função conforme o contexto — não identifique a conjunção só pela palavra isolada.

16. INTERJEIÇÃO
Expressa emoções, sentimentos ou reações: Ah!, Oh!, Nossa!, Ufa!, Oba!, Socorro! Ex.: "Ufa! Finalmente terminei a prova" — "Ufa" = interjeição.

RESUMÃO
Substantivo = nomeia. Artigo = acompanha/determina substantivo. Adjetivo = caracteriza. Numeral = quantidade/ordem. Pronome = substitui ou acompanha nome. Verbo = ação/estado/fenômeno. Advérbio = modifica verbo/adjetivo/advérbio. Preposição = relaciona termos. Conjunção = liga termos/orações. Interjeição = expressa emoção.

TÉCNICA PARA IDENTIFICAR A CLASSE DE UMA PALAVRA NA PROVA
1) Ela nomeia alguma coisa? → substantivo. 2) Está acompanhando/determinando um substantivo? → artigo ou pronome. 3) Está caracterizando um substantivo? → adjetivo. 4) Indica quantidade/ordem? → numeral. 5) Indica ação/estado? → verbo. 6) Modifica verbo, adjetivo ou advérbio? → advérbio. 7) Está ligando termos? → preposição ou conjunção. 8) Expressa emoção? → interjeição.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 3, 'Português', 'exercicios', 'Questões de classes gramaticais (Q1 a Q10)', 40
  from d returning id
),
b_info_teoria1 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 4, 'Informática', 'teoria', 'Hardware, software, CPU, RAM, armazenamento e sistema operacional', 70, $$Informática em concurso não é "você sabe mexer no computador?" — a banca cobra conceitos e costuma trocar termos parecidos para induzir erro.

1. HARDWARE
Parte física do computador: teclado, mouse, monitor, memória RAM, SSD, HD, placa-mãe, processador, impressora. Macete: hardware = você pode tocar.

2. SOFTWARE
Parte lógica: programas, sistemas e instruções executadas pelo computador. Ex.: Windows, Linux, navegador, Word, Excel, aplicativos. Macete: software = programas.

3. PROCESSADOR — CPU
Responsável pelo processamento das instruções — executa operações e instruções. CPU não é a mesma coisa que memória RAM.

4. MEMÓRIA RAM
Armazena temporariamente dados e programas em uso. É uma memória volátil: seu conteúdo é perdido quando a energia é desligada.

5. SSD/HD
Dispositivos de armazenamento de dados (documentos, fotos, vídeos, programas, arquivos). Em geral, o armazenamento permanece mesmo depois que o computador é desligado.
RAM × SSD: RAM é memória de trabalho, temporária, volátil. SSD/HD é armazenamento, persistente — não é a mesma coisa que RAM.

6. SSD × HD
Ambos armazenam dados, mas com tecnologias diferentes. HD usa discos magnéticos e partes mecânicas. SSD usa memória flash, sem as partes móveis do HD tradicional, e em geral tem maior velocidade e menor latência.

7. SISTEMA OPERACIONAL
Software que gerencia os recursos do computador e fornece uma interface de uso. Ex.: Windows, Linux, macOS, Android, iOS.

8. SISTEMA OPERACIONAL × APLICATIVO
Windows e Linux → sistema operacional. Word e Excel → aplicativo. Chrome → navegador/aplicativo.

9. ARQUIVO
Unidade de armazenamento de informações. Ex.: documento.docx, foto.jpg, prova.pdf, planilha.xlsx.

10. PASTA
Organiza arquivos e outras pastas. Ex.: pasta "Documentos" contendo a subpasta "Concurso" (com Português.pdf e Matemática.pdf) e a subpasta "Pessoal" (com Documento.docx).$$
  from d returning id
),
b_info_teoria2 as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Informática', 'teoria', 'Internet, Web, protocolos, e-mail, nuvem e segurança', 20, $$11. INTERNET
Rede mundial de redes e dispositivos interconectados. Permite navegação, e-mail, transferência de arquivos, comunicação e serviços online.

12. WORLD WIDE WEB — WWW
A Web é um dos serviços que funcionam sobre a Internet — Internet ≠ Web. A Web usa HTTP, HTTPS, HTML e navegadores.
Pegadinha clássica: "Internet e World Wide Web são sinônimos" está errado — a Web é um serviço que usa a infraestrutura da Internet.

13. NAVEGADOR
Software usado para acessar páginas e recursos da Web. Ex.: Google Chrome, Mozilla Firefox, Microsoft Edge, Safari.

14. URL
Endereço usado para localizar um recurso na Web. Ex.: https://www.exemplo.com.br — tem protocolo, domínio, caminho e parâmetros.

15. HTTP
Hypertext Transfer Protocol — protocolo usado na comunicação da Web.

16. HTTPS
HTTP com uma camada de segurança baseada em criptografia, normalmente associada ao TLS. HTTPS protege a comunicação em trânsito, mas não garante que o site seja legítimo — não significa que o site seja automaticamente confiável.

17. E-MAIL
Protocolos cobrados: SMTP (envio de e-mails); POP3 (recebimento/download de mensagens); IMAP (acesso/gerenciamento das mensagens no servidor, com melhor sincronização entre dispositivos).

18. NUVEM
Computação em nuvem = uso de recursos computacionais disponibilizados por rede, normalmente a Internet (armazenamento, processamento, aplicativos, bancos de dados). Ex.: salvar um arquivo num serviço de nuvem — ele não fica só no seu computador.

19. SEGURANÇA — CONCEITOS BÁSICOS
Phishing: tentativa de enganar o usuário para obter informações (senhas, dados bancários, dados pessoais).
Malware: termo geral para software malicioso — vírus, worms, trojans, ransomware, spyware.
Ransomware: malware que normalmente bloqueia ou criptografa dados e exige pagamento para a recuperação.

RESUMÃO
Hardware = parte física. Software = programas/sistemas. CPU = processamento. RAM = memória temporária/volátil. SSD/HD = armazenamento. Windows = sistema operacional. Chrome = navegador. Internet = rede mundial. Web = serviço baseado na Internet. URL = endereço de recurso. HTTP = protocolo Web. HTTPS = HTTP protegido por TLS. SMTP = envio de e-mail. IMAP = acesso/sincronização de e-mail. Phishing = fraude por engenharia social. Malware = software malicioso. Ransomware = malware que pode criptografar/bloquear dados.$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Informática', 'exercicios', 'Questões de hardware, software, internet e segurança (Q11 a Q20)', 30
  from d returning id
),
b_rev as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Revisão/Simulados', 'revisao', 'Desafio final + caderno de erros', 20, $$DESAFIO FINAL — responda sem consultar o material
Português:
1. Quais são as 10 classes gramaticais?
2. Qual a diferença básica entre substantivo e adjetivo?
3. O que é um verbo?
4. O que é um advérbio?
5. Qual a diferença entre preposição e conjunção?
6. Por que não podemos classificar uma palavra sem observar o contexto?

Informática:
7. Qual a diferença entre hardware e software?
8. Qual a função básica da RAM?
9. Qual a diferença entre RAM e SSD?
10. Windows é hardware ou software?
11. Internet e Web são a mesma coisa?
12. Para que serve um navegador?
13. O que significa HTTPS?
14. Qual protocolo está associado ao envio de e-mails?
15. O que é phishing?

CADERNO DE ERROS — DIA 3
Separe por matéria e registre só o essencial: o erro e a regra.
Ex. Português: "Erro: confundi adjetivo com advérbio. Regra: adjetivo caracteriza substantivo; advérbio modifica verbo, adjetivo ou outro advérbio."
Ex. Informática: "Erro: achei que RAM fosse armazenamento permanente. Regra: RAM é memória de trabalho e é volátil."
As questões erradas nos exercícios de hoje já entram automaticamente no caderno de erros do app — isso aqui é para os erros do desafio final, resolvido de memória.
Marque este bloco como concluído para fechar o Dia 3.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  ((select id from b_port_ex), 1, 'Português',
   'Na frase "O servidor dedicado recebeu uma promoção.", a palavra "servidor" é:',
   '{"A":"verbo.","B":"adjetivo.","C":"substantivo.","D":"advérbio.","E":"pronome."}'::jsonb,
   'C', '"Servidor" nomeia uma pessoa — é substantivo.'),

  ((select id from b_port_ex), 2, 'Português',
   'Na frase "O servidor dedicado recebeu uma promoção.", a palavra "dedicado" exerce função de:',
   '{"A":"substantivo.","B":"adjetivo.","C":"verbo.","D":"advérbio.","E":"pronome."}'::jsonb,
   'B', '"Dedicado" caracteriza "servidor" — é adjetivo.'),

  ((select id from b_port_ex), 3, 'Português',
   'Na frase "Dois candidatos foram aprovados.", a palavra "dois" é:',
   '{"A":"artigo.","B":"pronome.","C":"numeral.","D":"adjetivo.","E":"substantivo."}'::jsonb,
   'C', '"Dois" indica quantidade — é numeral cardinal.'),

  ((select id from b_port_ex), 4, 'Português',
   'Assinale a alternativa em que a palavra destacada é um advérbio:',
   '{"A":"O aluno é rápido.","B":"O aluno fez uma prova difícil.","C":"O aluno estudou bastante.","D":"O aluno é dedicado.","E":"O aluno comprou um livro novo."}'::jsonb,
   'C', '"Bastante" modifica o verbo "estudou", indicando intensidade — é advérbio. Nas demais, as palavras caracterizam substantivos (adjetivos).'),

  ((select id from b_port_ex), 5, 'Português',
   'Na frase "Meu material está sobre a mesa.", a palavra "meu" é:',
   '{"A":"artigo definido.","B":"pronome possessivo.","C":"pronome relativo.","D":"adjetivo.","E":"numeral."}'::jsonb,
   'B', '"Meu" indica posse — é pronome possessivo.'),

  ((select id from b_port_ex), 6, 'Português',
   'Na frase "O livro que comprei é excelente.", o termo "que" é:',
   '{"A":"artigo.","B":"conjunção coordenativa.","C":"pronome relativo.","D":"advérbio.","E":"preposição."}'::jsonb,
   'C', '"Que" retoma "livro" — é pronome relativo.'),

  ((select id from b_port_ex), 7, 'Português',
   'Na frase "Estudei porque precisava melhorar.", a palavra "porque" estabelece relação de:',
   '{"A":"oposição.","B":"causa.","C":"conclusão.","D":"condição.","E":"finalidade."}'::jsonb,
   'B', '"Porque" introduz a causa do fato de ter estudado.'),

  ((select id from b_port_ex), 8, 'Português',
   'Assinale a alternativa que apresenta uma interjeição:',
   '{"A":"portanto.","B":"porque.","C":"rapidamente.","D":"ufa!","E":"durante."}'::jsonb,
   'D', '"Ufa!" expressa uma reação/emoção — é interjeição. As demais são conjunção, conjunção, advérbio e preposição.'),

  ((select id from b_port_ex), 9, 'Português',
   'Na frase "João estudou muito.", a palavra "muito" exerce função de:',
   '{"A":"substantivo.","B":"artigo.","C":"advérbio.","D":"pronome pessoal.","E":"preposição."}'::jsonb,
   'C', '"Muito" modifica o verbo "estudou", indicando intensidade — é advérbio.'),

  ((select id from b_port_ex), 10, 'Português',
   'Na frase "O estudante comprou um livro de Direito.", a palavra "de" é:',
   '{"A":"conjunção.","B":"preposição.","C":"artigo.","D":"advérbio.","E":"pronome."}'::jsonb,
   'B', '"De" estabelece relação entre "livro" e "Direito" — é preposição.'),

  ((select id from b_info_ex), 1, 'Informática',
   'É exemplo de hardware:',
   '{"A":"Windows.","B":"Microsoft Word.","C":"Google Chrome.","D":"memória RAM.","E":"sistema operacional."}'::jsonb,
   'D', 'RAM é um componente físico — hardware. As demais são software.'),

  ((select id from b_info_ex), 2, 'Informática',
   'É exemplo de software:',
   '{"A":"teclado.","B":"monitor.","C":"SSD.","D":"mouse.","E":"Windows."}'::jsonb,
   'E', 'Windows é um sistema operacional — software. As demais são componentes físicos.'),

  ((select id from b_info_ex), 3, 'Informática',
   'Sobre a memória RAM, é correto afirmar que:',
   '{"A":"é exclusivamente utilizada para armazenamento permanente.","B":"é uma memória volátil utilizada durante a execução de programas.","C":"substitui obrigatoriamente o processador.","D":"permanece com todos os dados após o desligamento.","E":"é um dispositivo exclusivamente de entrada."}'::jsonb,
   'B', 'RAM é memória de trabalho, volátil: perde os dados quando a energia é desligada.'),

  ((select id from b_info_ex), 4, 'Informática',
   'Assinale a alternativa correta:',
   '{"A":"SSD e RAM são exatamente o mesmo componente.","B":"RAM é normalmente utilizada como memória de trabalho, enquanto SSD pode armazenar dados de forma persistente.","C":"SSD é exclusivamente uma memória volátil.","D":"RAM é um sistema operacional.","E":"HD é um tipo de software."}'::jsonb,
   'B', 'RAM = memória de trabalho, volátil. SSD = armazenamento persistente. Não são a mesma coisa.'),

  ((select id from b_info_ex), 5, 'Informática',
   'Assinale a alternativa que apresenta exclusivamente sistemas operacionais:',
   '{"A":"Windows, Linux e Android.","B":"Chrome, Edge e Firefox.","C":"Word, Excel e PowerPoint.","D":"SSD, HD e RAM.","E":"Gmail, Outlook e Chrome."}'::jsonb,
   'A', 'Windows, Linux e Android são sistemas operacionais. As demais listas trazem navegadores, aplicativos ou hardware.'),

  ((select id from b_info_ex), 6, 'Informática',
   'Sobre Internet e Web, é correto afirmar que:',
   '{"A":"são necessariamente sinônimos.","B":"a Web é um dos serviços que utilizam a infraestrutura da Internet.","C":"a Internet é um navegador.","D":"a Web funciona exclusivamente sem Internet.","E":"HTTP é um sistema operacional."}'::jsonb,
   'B', 'A Web é um serviço (baseado em HTTP/HTML) que roda sobre a infraestrutura da Internet — não são sinônimos.'),

  ((select id from b_info_ex), 7, 'Informática',
   'Um navegador é utilizado principalmente para:',
   '{"A":"armazenar eletricidade.","B":"executar exclusivamente tarefas de impressão.","C":"acessar recursos e páginas da Web.","D":"substituir a memória RAM.","E":"funcionar como placa-mãe."}'::jsonb,
   'C', 'Navegador (Chrome, Firefox, Edge, Safari) serve para acessar páginas e recursos da Web.'),

  ((select id from b_info_ex), 8, 'Informática',
   'Sobre HTTPS, assinale a alternativa correta:',
   '{"A":"é um sistema operacional.","B":"é um tipo de memória RAM.","C":"é uma forma de comunicação HTTP protegida por mecanismos de criptografia, normalmente usando TLS.","D":"é exclusivamente um antivírus.","E":"é um dispositivo físico."}'::jsonb,
   'C', 'HTTPS é HTTP com criptografia em trânsito, normalmente via TLS.'),

  ((select id from b_info_ex), 9, 'Informática',
   'O protocolo associado tradicionalmente ao envio de mensagens de correio eletrônico é:',
   '{"A":"SMTP.","B":"HTTP.","C":"FTP.","D":"HTML.","E":"HTTPS."}'::jsonb,
   'A', 'SMTP é o protocolo de envio de e-mails. POP3 e IMAP tratam do recebimento/acesso às mensagens.'),

  ((select id from b_info_ex), 10, 'Informática',
   'Uma tentativa fraudulenta de induzir o usuário a fornecer informações confidenciais por meio de mensagens ou páginas falsas caracteriza, em geral:',
   '{"A":"backup.","B":"firewall.","C":"phishing.","D":"compactação.","E":"formatação."}'::jsonb,
   'C', 'Phishing é exatamente a tentativa de enganar o usuário para obter informações como senhas e dados bancários.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
