-- Cadastra o Dia 22 (versão completa e robusta).
delete from days where week = 5 and day_number = 3;

with d as (
  insert into days (week, day_number, title)
  values (5, 3, 'Pontuação + probabilidade + agentes públicos (cargo/emprego/função) + redes de computadores e Internet')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Pontuação: vírgula (regras e proibições), ponto e vírgula e dois-pontos', 30, $$A pontuação organiza a frase e estabelece relações sintáticas — a vírgula não deve ser usada só porque há uma pausa na fala. As bancas cobram tanto a regra quanto a alteração de sentido provocada pela pontuação.

QUANDO USAR A VÍRGULA
1) Enumeração: "O candidato estudou Português, Matemática, Informática e Direito."
2) Vocativo (termo usado para chamar alguém, não é sujeito): "Servidor, compareça ao setor."; "Informe, senhor candidato, seus dados."; "Maria, entregue o documento." Compare: "Maria, entregue o documento" (Maria é chamada) × "Maria entregou o documento" (Maria é sujeito).
3) Aposto explicativo: "Brasília, capital do Brasil, recebe muitos visitantes."
4) Expressões explicativas/intercaladas: "O candidato, por exemplo, resolveu a questão."; "A prova, segundo o edital, será realizada domingo."; "O servidor, em razão do ocorrido, apresentou justificativa."
5) Orações coordenadas: "Estudei bastante, mas não consegui terminar todas as questões." (adversativa); "Estudou, porém não passou."; "O prazo terminou, portanto o pedido não foi apresentado a tempo."
6) Oração subordinada adverbial deslocada (antes da principal): "Quando o edital foi publicado, os candidatos iniciaram os estudos." Compare: "Os candidatos começaram a estudar quando o edital foi publicado." — oração depois da principal, em regra sem vírgula.
7) Oração explicativa × restritiva: "Os candidatos, que estudaram bastante, foram aprovados." (explicativa — acrescenta informação, todos estudaram) × "Os candidatos que estudaram bastante foram aprovados." (restritiva — identifica QUAIS candidatos). A pontuação pode alterar o sentido.

QUANDO NÃO USAR A VÍRGULA
Não separe sujeito e verbo: errado "O candidato aprovado, compareceu à entrevista."; certo "O candidato aprovado compareceu à entrevista."
Não separe verbo e complemento: errado "O servidor entregou, os documentos."; certo "O servidor entregou os documentos."
Não separe nome e complemento: errado "A necessidade, de aprovação no concurso é evidente."; certo "A necessidade de aprovação no concurso é evidente."
Não separe verbo de oração subordinada substantiva: errado "O candidato afirmou, que estudou."; certo "O candidato afirmou que estudou."

PONTO E VÍRGULA
Pausa maior que a vírgula, menor que o ponto. Usos: separar orações coordenadas extensas; separar itens complexos de enumeração; organizar partes de um texto que já contenham vírgulas. Ex.: "Os candidatos estudaram Português, Matemática e Informática; os servidores organizaram os documentos; a comissão divulgou o resultado." Ex.: "A inscrição exige documento de identidade, original ou cópia autenticada; comprovante de residência, quando solicitado; e pagamento da taxa, se aplicável."

DOIS-PONTOS
Introduzem explicação, enumeração, citação, esclarecimento ou conclusão anunciada. Ex.: "O candidato precisava de três materiais: apostila, caderno e caneta."; "A comissão comunicou: 'O resultado será divulgado amanhã'."; "O problema era evidente: faltava organização."

RESUMO
Vírgula: separa elementos, isola termos/orações. Ponto e vírgula: separa partes maiores ou itens complexos. Dois-pontos: introduzem explicação/enumeração/citação. Ponto final: encerra declaração. Antes de colocar vírgula, identifique a estrutura da oração — não confie só na pausa da fala.$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — pontuação (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Probabilidade: espaço amostral, complementar, independentes, mutuamente exclusivos e sem reposição', 35, $$CONCEITOS FUNDAMENTAIS
Experimento aleatório: procedimento cujo resultado não pode ser previsto com certeza (lançar moeda/dado, retirar carta, sortear pessoa). Espaço amostral: conjunto de todos os resultados possíveis (dado comum: {1,2,3,4,5,6}). Evento: conjunto de resultados que atendem a uma condição (número par: {2,4,6}).

FÓRMULA BÁSICA
Quando todos os resultados são igualmente possíveis: P(A) = casos favoráveis ÷ casos possíveis. Pode ser expressa como fração, decimal ou porcentagem. Ex.: número par em um dado: 3/6 = 1/2 = 50%.

EVENTO IMPOSSÍVEL E EVENTO CERTO
Impossível: P=0 (ex.: obter 8 em dado de seis faces). Certo: P=1 ou 100% (ex.: número entre 1 e 6 em dado comum). Sempre 0 ≤ P(A) ≤ 1.

EVENTO COMPLEMENTAR
P(A^c) = 1 − P(A). Ex.: probabilidade de chover 30% → de não chover = 1−0,30 = 70%. Dica: em "pelo menos um", costuma ser mais fácil calcular o complemento ("nenhum").

EVENTOS INDEPENDENTES
A ocorrência de um não altera a probabilidade do outro: P(A e B) = P(A) × P(B). Ex.: cara nos dois lançamentos de uma moeda: 1/2 × 1/2 = 1/4 = 25%.

EVENTOS MUTUAMENTE EXCLUSIVOS
Não podem ocorrer simultaneamente (em um único lançamento de dado: sair 2 e sair 5). P(A ou B) = P(A) + P(B). Ex.: 2 ou 5 no dado: 1/6+1/6 = 2/6 = 1/3. Se podem ocorrer simultaneamente: P(A ou B) = P(A) + P(B) − P(A e B) — o termo da interseção evita contar duas vezes.

RETIRADA DE OBJETOS
Caixa com 3 bolas vermelhas e 2 azuis (5 no total): P(azul) = 2/5 = 40%. Retirada SEM reposição: a segunda retirada depende da primeira. Ex.: duas bolas azuis sem reposição: 2/5 × 1/4 = 2/20 = 1/10 = 10%. Pegadinha: sem reposição, o total de objetos muda após cada retirada.

RESUMO
Simples: favoráveis ÷ possíveis. Complementar: 1−P(A). Independentes: P(A)×P(B). Mutuamente exclusivos: P(A)+P(B). União geral: P(A)+P(B)−P(A∩B).$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — probabilidade (Q1 a Q4)', 15
  from d returning id
),
b_adm_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Administrativo', 'teoria', 'Agentes públicos: cargo, emprego e função; contratação temporária, estabilidade e acumulação', 30, $$QUEM SÃO OS AGENTES PÚBLICOS
Em sentido amplo, agente público é toda pessoa física que exerce, ainda que temporariamente ou sem remuneração, uma função pública — abrange agentes políticos, servidores públicos, empregados públicos, militares e particulares que colaboram com o Poder Público em certas situações. Servidor público é uma categoria de agente público, não a única.

CARGO PÚBLICO
Conjunto de atribuições e responsabilidades previsto na estrutura administrativa: criado por lei, atribuições definidas, ocupado por pessoa investida conforme as regras legais, pode ser efetivo ou em comissão. Ex.: técnico judiciário, analista, escrevente (conforme a legislação do tribunal).
Cargo efetivo: em regra, preenchido por concurso público; o servidor aprovado e nomeado cumpre requisitos legais para adquirir estabilidade, quando aplicável.
Cargo em comissão: destinado EXCLUSIVAMENTE às atribuições de direção, chefia e assessoramento; livre nomeação e exoneração, conforme a lei. Pegadinha: não é destinado a qualquer atividade operacional/técnica.

EMPREGO PÚBLICO
Relação de trabalho com a Administração regida, em regra, pela legislação trabalhista (CLT): ingresso normalmente exige concurso público; vínculo contratual; não ocupa cargo estatutário. Ex.: empregados públicos de empresas públicas e sociedades de economia mista. Empregado público também é agente público — o regime celetista não elimina a exigência constitucional de concurso, quando aplicável.

FUNÇÃO PÚBLICA E FUNÇÃO DE CONFIANÇA
Função pública: conjunto de atribuições exercidas por alguém no serviço público — pode estar associada a um cargo, ser função de confiança, ou existir em situações temporárias previstas constitucionalmente e regulamentadas por lei.
Função de confiança: exercida EXCLUSIVAMENTE por servidores ocupantes de cargo efetivo; destina-se a direção, chefia e assessoramento.
Pegadinha: função de confiança ≠ cargo em comissão. Função de confiança — só servidor efetivo, não é um cargo autônomo. Cargo em comissão — é um cargo público, pode ser ocupado por pessoa sem vínculo efetivo, conforme a lei. A lei pode reservar percentuais mínimos dos cargos em comissão a servidores de carreira.

CONTRATAÇÃO TEMPORÁRIA
A Constituição permite contratação por tempo determinado para atender necessidade temporária de excepcional interesse público, conforme a lei: precisa existir necessidade temporária, excepcional interesse público e respeito à legislação. Não é forma geral de substituir permanentemente servidores efetivos. Pegadinha: não significa contratação livre e sem critérios.

CONCURSO E ESTABILIDADE
Regra para investidura em cargo/emprego público: concurso, ressalvadas as exceções constitucionais. Validade do concurso: até 2 anos, prorrogável uma vez por igual período. Aprovação em concurso não gera estabilidade automática. Servidor nomeado para cargo efetivo por concurso adquire estabilidade após 3 anos de efetivo exercício, observadas as condições constitucionais, incluindo avaliação especial de desempenho. Estabilidade não significa que o servidor jamais possa perder o cargo.

ACUMULAÇÃO DE CARGOS PÚBLICOS
Regra: proibição de acumulação remunerada, ressalvadas hipóteses com compatibilidade de horários: dois cargos de professor; um cargo de professor com outro cargo de qualquer natureza; dois cargos ou empregos privativos de profissionais de saúde com profissões regulamentadas. Atenção: a compatibilidade de horários é requisito essencial — não basta a situação se encaixar numa das hipóteses permitidas.$$
  from d returning id
),
b_adm_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Administrativo', 'exercicios', 'Fixação — agentes públicos (Q1 a Q4)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'Redes (PAN/LAN/MAN/WAN), Internet/intranet/extranet, protocolos, IP/DNS e equipamentos', 25, $$REDE DE COMPUTADORES
Conjunto de dispositivos conectados para compartilhar informações, recursos e serviços. Por abrangência: PAN (alcance pessoal, dispositivos próximos); LAN (rede local — escritório/residência); MAN (área metropolitana); WAN (grande abrangência geográfica). Pegadinha: a Internet é uma rede mundial de redes, não apenas uma LAN.

INTERNET, INTRANET E EXTRANET
Internet: rede mundial que conecta redes e dispositivos por protocolos de comunicação — acesso a páginas, e-mail, videoconferências, compartilhamento de arquivos, serviços online. Intranet: rede privada de uma organização para comunicação/compartilhamento interno (ex.: portal interno de uma instituição pública), pode usar tecnologias semelhantes às da Internet, mas com acesso restrito. Extranet: extensão controlada de uma rede privada para usuários externos autorizados (ex.: portal restrito para fornecedores).

NAVEGADOR × MECANISMO DE BUSCA
Navegador: programa para acessar/visualizar páginas e aplicações web (Chrome, Edge, Firefox, Safari). Mecanismo de busca: serviço para pesquisar informações na web (Google, Bing, DuckDuckGo). Google Chrome é navegador; Google Search é mecanismo de busca. O navegador não é a Internet — é uma ferramenta de acesso.

PROTOCOLOS IMPORTANTES
HTTP: transferência de conteúdo web. HTTPS: HTTP protegido por TLS. FTP: transferência de arquivos. SMTP: envio de e-mails. POP3: recebimento de e-mails (geralmente download ao cliente). IMAP: acesso e sincronização de mensagens no servidor. DNS: traduz nomes de domínio em informações para localizar serviços (ex.: IPs). DHCP: distribui automaticamente configurações de rede, como IPs. TCP: comunicação orientada à conexão, com confiabilidade e ordenação. UDP: sem conexão prévia, menor sobrecarga.
HTTPS acrescenta proteção por TLS (ajuda a proteger confidencialidade e integridade e a autenticar o servidor) — mas não garante que o site seja honesto; um site fraudulento também pode usar HTTPS.
Memorize: SMTP = envio; POP3 = recebimento; IMAP = acesso/sincronização.

ENDEREÇO IP E DNS
IP identifica uma interface de rede para comunicação. IPv4: endereços de 32 bits. IPv6: endereços de 128 bits (criado para ampliar o espaço de endereçamento). DNS (Domain Name System): resolve nomes de domínio (exemplo.com) em informações para localizar os serviços. Pegadinha: DNS não é protocolo de envio de e-mail nem de transferência de arquivos.

EQUIPAMENTOS DE REDE
Roteador: encaminha pacotes entre redes diferentes (em residências, geralmente também oferece Wi-Fi). Switch: conecta dispositivos em uma rede local e encaminha quadros com base em endereços MAC. Ponto de acesso: permite que dispositivos sem fio se conectem à rede. Modem: modulação/demodulação ou adaptação do sinal, conforme a tecnologia de acesso.$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — redes e Internet (Q1 a Q4)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 22 (Q17 a Q28)', 40,
    $$Sem consulta. 12 questões misturando pontuação, probabilidade, agentes públicos e redes/Internet.$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Caderno de erros, revisão espaçada e checklist do Dia 22', 20, $$CADERNO DE ERROS
Marque o que precisa reforçar: uso da vírgula e separação de termos; oração restritiva × explicativa; probabilidade simples e espaço amostral; eventos independentes e complementares; cargo × emprego × função pública; concurso, estabilidade e contratação temporária; Internet, intranet, protocolos e equipamentos de rede. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app.

REVISÃO ESPAÇADA
Amanhã: revisar as regras e refazer as questões erradas.
Daqui a 7 dias: resolver 8 a 12 questões sobre as quatro matérias.
Daqui a 30 dias: revisão cumulativa dos Dias 1 a 22.
(O app já agenda isso sozinho via o caderno de erros — 24h, 7 dias e 30 dias, visíveis no Painel.)

CHECKLIST DO DIA 22
Estudei as regras de pontuação. Resolvi os exercícios de probabilidade. Aprendi as diferenças entre cargo, emprego e função pública. Revisei concurso público, estabilidade e contratação temporária. Estudei redes, Internet e protocolos. Fiz o mini-simulado e registrei meus erros. Marque este bloco como concluído para fechar o Dia 22.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a alternativa em que a vírgula está corretamente empregada.',
   '{"A":"O candidato aprovado, entregou os documentos.","B":"O servidor, analisou o processo.","C":"Maria, compareça à secretaria.","D":"O funcionário entregou, os formulários."}'::jsonb,
   'C', '"Maria" é vocativo e deve ser isolado por vírgula. As demais separam indevidamente sujeito/verbo ou verbo/complemento.'),

  ((select id from b_port_ex), 2, 'Português',
   'Em qual frase a vírgula separa uma oração subordinada adverbial deslocada?',
   '{"A":"O candidato, estudou muito.","B":"Quando terminou a prova, o candidato saiu.","C":"O servidor entregou, os documentos.","D":"O resultado, foi divulgado ontem."}'::jsonb,
   'B', '"Quando terminou a prova" é oração adverbial colocada antes da principal — separada por vírgula.'),

  ((select id from b_port_ex), 3, 'Português',
   'Assinale a alternativa em que os dois-pontos foram empregados corretamente.',
   '{"A":"O candidato: estudou bastante.","B":"O servidor entregou: os documentos.","C":"O edital exige três documentos: identidade, CPF e comprovante de residência.","D":"A comissão, divulgou: o resultado."}'::jsonb,
   'C', 'Os dois-pontos introduzem corretamente a enumeração dos três documentos exigidos.'),

  ((select id from b_port_ex), 4, 'Português',
   'A pontuação altera o sentido em qual exemplo?',
   '{"A":"O candidato estudou e passou.","B":"O servidor entregou o documento.","C":"Os candidatos que estudaram passaram / Os candidatos, que estudaram, passaram.","D":"A prova foi realizada ontem."}'::jsonb,
   'C', 'Sem vírgulas a oração é restritiva (só os que estudaram); entre vírgulas é explicativa (todos estudaram) — o sentido muda.'),

  -- Matemática — fixação (Q1-4)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Ao lançar um dado comum, qual é a probabilidade de sair um número maior que 4?',
   '{"A":"1/6","B":"1/3","C":"1/2","D":"2/3"}'::jsonb,
   'B', 'Favoráveis: {5,6} = 2; possíveis: 6. P = 2/6 = 1/3.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'Uma moeda é lançada duas vezes. Qual é a probabilidade de sair cara nos dois lançamentos?',
   '{"A":"25%","B":"50%","C":"75%","D":"100%"}'::jsonb,
   'A', 'Eventos independentes: 1/2 × 1/2 = 1/4 = 25%.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Uma caixa possui 4 bolas vermelhas e 6 azuis. Qual é a probabilidade de retirar uma bola vermelha?',
   '{"A":"20%","B":"30%","C":"40%","D":"60%"}'::jsonb,
   'C', 'P = 4/(4+6) = 4/10 = 40%.'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'A probabilidade de um evento ocorrer é 35%. Qual é a probabilidade de ele não ocorrer?',
   '{"A":"35%","B":"55%","C":"65%","D":"75%"}'::jsonb,
   'C', 'Evento complementar: 100% − 35% = 65%.'),

  -- Administrativo — fixação (Q1-4)
  ((select id from b_adm_ex), 1, 'Administrativo',
   'Segundo a Constituição, as funções de confiança são exercidas exclusivamente por:',
   '{"A":"Qualquer cidadão indicado pela autoridade.","B":"Servidores ocupantes de cargo efetivo.","C":"Empregados de empresas privadas.","D":"Pessoas contratadas temporariamente, em qualquer hipótese."}'::jsonb,
   'B', 'Função de confiança é exercida exclusivamente por servidor ocupante de cargo efetivo.'),

  ((select id from b_adm_ex), 2, 'Administrativo',
   'Os cargos em comissão destinam-se exclusivamente às atribuições de:',
   '{"A":"Execução operacional, sem responsabilidade de chefia.","B":"Atividades técnicas de qualquer natureza.","C":"Direção, chefia e assessoramento.","D":"Atividades temporárias de emergência exclusivamente."}'::jsonb,
   'C', 'Cargos em comissão são para direção, chefia e assessoramento.'),

  ((select id from b_adm_ex), 3, 'Administrativo',
   'A contratação temporária pela Administração Pública deve atender:',
   '{"A":"Qualquer necessidade administrativa, sem previsão legal.","B":"Exclusivamente à substituição permanente de servidores efetivos.","C":"À necessidade temporária de excepcional interesse público, conforme a lei.","D":"Apenas a atividades de direção e assessoramento."}'::jsonb,
   'C', 'É a hipótese constitucional da contratação temporária.'),

  ((select id from b_adm_ex), 4, 'Administrativo',
   'A estabilidade constitucional do servidor nomeado para cargo efetivo é adquirida, em regra, após:',
   '{"A":"Um ano de exercício.","B":"Dois anos de exercício.","C":"Três anos de efetivo exercício, observadas as condições constitucionais.","D":"A aprovação no concurso, automaticamente."}'::jsonb,
   'C', 'Estabilidade exige três anos de efetivo exercício, com avaliação especial de desempenho.'),

  -- Informática — fixação (Q1-4)
  ((select id from b_info_ex), 1, 'Informática',
   'Uma rede privada utilizada internamente por uma organização é denominada:',
   '{"A":"Internet pública.","B":"Intranet.","C":"Extranet pública irrestrita.","D":"DNS."}'::jsonb,
   'B', 'Intranet é a rede privada de uso interno de uma organização.'),

  ((select id from b_info_ex), 2, 'Informática',
   'Qual protocolo é utilizado para envio de e-mails?',
   '{"A":"SMTP.","B":"POP3.","C":"DNS.","D":"DHCP."}'::jsonb,
   'A', 'SMTP é o protocolo de envio de e-mails.'),

  ((select id from b_info_ex), 3, 'Informática',
   'Qual serviço auxilia na resolução de nomes de domínio?',
   '{"A":"FTP.","B":"SMTP.","C":"DNS.","D":"POP3."}'::jsonb,
   'C', 'DNS resolve nomes de domínio em informações para localizar os serviços.'),

  ((select id from b_info_ex), 4, 'Informática',
   'Qual equipamento encaminha pacotes entre redes diferentes?',
   '{"A":"Teclado.","B":"Scanner.","C":"Switch, exclusivamente em qualquer situação.","D":"Roteador."}'::jsonb,
   'D', 'Roteador encaminha pacotes entre redes diferentes.'),

  -- Mini-simulado (Q17-28)
  ((select id from b_simulado), 1, 'Português',
   'Assinale a alternativa em que a vírgula está empregada corretamente.',
   '{"A":"O candidato aprovado, entregou os documentos.","B":"O servidor analisou, o processo.","C":"João, compareça ao setor.","D":"A comissão, divulgou o resultado."}'::jsonb,
   'C', '"João" é vocativo, isolado por vírgula. As demais separam indevidamente sujeito/verbo ou verbo/complemento.'),

  ((select id from b_simulado), 2, 'Português',
   'Em qual alternativa a pontuação pode alterar o sentido da oração?',
   '{"A":"O candidato estudou ontem.","B":"Os servidores chegaram cedo.","C":"Os candidatos que estudaram passaram / Os candidatos, que estudaram, passaram.","D":"O edital foi publicado."}'::jsonb,
   'C', 'Oração restritiva × explicativa: a vírgula muda o sentido.'),

  ((select id from b_simulado), 3, 'Matemática/RLM',
   'Ao lançar um dado comum, qual é a probabilidade de sair um número ímpar?',
   '{"A":"1/6","B":"1/3","C":"1/2","D":"2/3"}'::jsonb,
   'C', 'Favoráveis: {1,3,5} = 3; possíveis: 6. P = 3/6 = 1/2.'),

  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Uma moeda é lançada duas vezes. Qual é a probabilidade de sair cara pelo menos uma vez?',
   '{"A":"25%","B":"50%","C":"75%","D":"100%"}'::jsonb,
   'C', 'Complementar de "nenhuma cara": 1 − (1/2 × 1/2) = 1 − 1/4 = 3/4 = 75%.'),

  ((select id from b_simulado), 5, 'Matemática/RLM',
   'Uma urna possui 5 bolas verdes e 3 amarelas. Qual é a probabilidade de retirar uma bola amarela?',
   '{"A":"3/8","B":"5/8","C":"1/3","D":"5/3"}'::jsonb,
   'A', 'P = 3/(5+3) = 3/8.'),

  ((select id from b_simulado), 6, 'Administrativo',
   'O conceito de agente público, em sentido amplo, abrange:',
   '{"A":"Somente servidores estatutários efetivos.","B":"Apenas ocupantes de cargos em comissão.","C":"Somente empregados de empresas públicas.","D":"Pessoas físicas que exercem função pública, conforme as diferentes categorias e situações legais."}'::jsonb,
   'D', 'Agente público é toda pessoa física que exerce função pública, em diversas categorias.'),

  ((select id from b_simulado), 7, 'Administrativo',
   'A função de confiança, conforme a Constituição, é exercida exclusivamente por:',
   '{"A":"Qualquer pessoa indicada.","B":"Servidor ocupante de cargo efetivo.","C":"Empregado de empresa privada.","D":"Contratado temporário em qualquer hipótese."}'::jsonb,
   'B', 'Função de confiança é exclusiva de servidor ocupante de cargo efetivo.'),

  ((select id from b_simulado), 8, 'Administrativo',
   'A contratação temporária prevista na Constituição destina-se a:',
   '{"A":"Atender necessidade temporária de excepcional interesse público, nos termos da lei.","B":"Substituir permanentemente todos os concursos.","C":"Permitir contratação sem requisitos legais.","D":"Preencher exclusivamente cargos em comissão."}'::jsonb,
   'A', 'É a hipótese constitucional da contratação temporária.'),

  ((select id from b_simulado), 9, 'Informática',
   'Uma rede privada de uma organização, utilizada para comunicação interna, é denominada:',
   '{"A":"Internet.","B":"Intranet.","C":"Rede pública mundial.","D":"Mecanismo de busca."}'::jsonb,
   'B', 'Intranet é a rede privada interna.'),

  ((select id from b_simulado), 10, 'Informática',
   'O protocolo normalmente associado ao envio de mensagens de e-mail é:',
   '{"A":"POP3.","B":"IMAP.","C":"SMTP.","D":"DNS."}'::jsonb,
   'C', 'SMTP é o protocolo de envio. POP3 e IMAP tratam do recebimento/acesso.'),

  ((select id from b_simulado), 11, 'Informática',
   'O HTTPS utiliza mecanismos de segurança para proteger a comunicação. Isso significa que:',
   '{"A":"Todo site HTTPS é necessariamente confiável.","B":"O site não pode conter golpes.","C":"O usuário nunca precisa verificar o endereço.","D":"A comunicação pode ser protegida, mas o site ainda pode ser fraudulento."}'::jsonb,
   'D', 'HTTPS protege a comunicação em trânsito, mas não garante a legitimidade do site.'),

  ((select id from b_simulado), 12, 'Informática',
   'Qual alternativa apresenta corretamente a função do DNS?',
   '{"A":"Enviar e-mails.","B":"Auxiliar na resolução de nomes de domínio.","C":"Criar cópias de segurança.","D":"Proteger exclusivamente contra vírus."}'::jsonb,
   'B', 'DNS auxilia na resolução de nomes de domínio em informações como IPs.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
