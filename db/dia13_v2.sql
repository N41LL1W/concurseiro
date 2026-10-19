-- Cadastra o Dia 13 (versão completa e robusta).
delete from days where week = 3 and day_number = 3;

with d as (
  insert into days (week, day_number, title)
  values (3, 3, 'Regência verbal/nominal + sistemas de equações + Administração Pública (art. 37) + segurança da informação')
  returning id
),
b_port_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 1, 'Português', 'teoria', 'Regência verbal e nominal: assistir, obedecer, preferir, chegar, aspirar, visar', 30, $$Regência é a relação entre uma palavra e o termo que completa seu sentido. Regência verbal: verbo e complemento. Regência nominal: nome (substantivo, adjetivo, advérbio) e complemento. Ex. verbal: "Gosto de Português" (gostar exige "de"). Ex. nominal: "Tenho necessidade de ajuda" (necessidade liga-se por "de").

VERBO ASSISTIR
Sentido de ver/presenciar → regência tradicional com "a": "Assisti ao filme."; "Assisti à palestra."; "Os candidatos assistiram à aula." (a+o=ao; a+a=à). Sentido de prestar assistência → pode ser transitivo direto: "O médico assistiu o paciente."; "A equipe assistiu as vítimas."

VERBO OBEDECER
Sempre exige "a": "Obedeça às regras."; "O servidor obedeceu ao regulamento."; "Os candidatos obedeceram às instruções." Evite "obedecer as regras" sem a preposição, no sentido de seguir regras.

VERBO PREFERIR
Construção tradicional: "preferir uma coisa A outra" — "Prefiro Português a Matemática."; "Prefiro estudar pela manhã a estudar à noite." Pegadinha: evite "prefiro mais... do que" nas questões que cobram a regência tradicional — não é necessário "mais" para marcar preferência.

VERBO CHEGAR
Indicando destino, normalmente com "a": "Cheguei ao trabalho cedo."; "Chegamos à escola." "Cheguei em casa" é comum na fala cotidiana, mas a banca pode privilegiar "cheguei a casa"/"à casa".

VERBO ASPIRAR
Sentido de respirar/sorver → transitivo direto: "O trabalhador aspirou a poeira." Sentido de desejar/almejar → exige "a": "O candidato aspira ao cargo público."; "Ela aspira à aprovação."

VERBO VISAR
Sentido de mirar/colocar visto → transitivo direto: "O funcionário visou o documento."; "O atirador visou o alvo." Sentido de ter como objetivo → tradicionalmente com "a": "A medida visa ao aperfeiçoamento do serviço."

VTD, VTI E VTDI
Transitivo direto (VTD): liga-se ao complemento sem preposição obrigatória — "O candidato resolveu a questão" (resolveu o quê? a questão). Transitivo indireto (VTI): exige preposição — "O candidato precisa de ajuda" (precisa de quê? de ajuda). Transitivo direto e indireto (VTDI): dois complementos — "O funcionário entregou o documento ao diretor" (entregou o quê? o documento; a quem? ao diretor).

REGÊNCIA NOMINAL
Necessidade de, capacidade de, interesse em, respeito a/por, favorável a, contrário a, compatível com, responsável por. Comece pelas mais frequentes e fixe com questões, sem tentar decorar todas de uma vez.

REGÊNCIA E CRASE
A crase surge, em muitos casos, quando a preposição "a" exigida por um termo encontra o artigo feminino "a"/"as": "Obedeço a + as regras" → "Obedeço às regras."; "Assisti a + a palestra" → "Assisti à palestra." Mas não coloque crase automaticamente diante de toda palavra feminina — é preciso haver a regência que a justifique. Compare: "Entreguei o documento à diretora." (crase) × "Entreguei o documento a ela." (sem crase, pronome pessoal).

COMO RESOLVER QUESTÕES DE REGÊNCIA
1) Identifique o verbo/nome destacado. 2) Determine o sentido empregado. 3) Verifique se exige preposição. 4) Analise o complemento. 5) Confira a norma-padrão. Ex.: "O candidato assistiu ___ palestra" — sentido de presenciar, exige "a"; "palestra" admite artigo feminino → "O candidato assistiu à palestra."$$
  from d returning id
),
b_port_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 2, 'Português', 'exercicios', 'Fixação — regência verbal e nominal (Q1 a Q4)', 15
  from d returning id
),
b_mat_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 3, 'Matemática/RLM', 'teoria', 'Sistemas de equações — adição, substituição e problemas com duas incógnitas', 35, $$Um sistema de equações é um conjunto de duas ou mais equações que devem ser satisfeitas ao mesmo tempo. Ex.: x+y=10 e x-y=2 → x=6, y=4 (confira: 6+4=10 e 6-4=2).

MÉTODO DA ADIÇÃO
Soma as equações para eliminar uma incógnita. Ex.: x+y=14 e x-y=4. Somando: (x+y)+(x-y) = 14+4 → +y e -y se anulam → 2x=18 → x=9. Substituindo em x+y=14: 9+y=14 → y=5. Resposta: x=9, y=5.
Funciona bem quando uma incógnita aparece com sinais opostos nas duas equações; se não forem opostos, pode-se multiplicar uma ou ambas as equações por números adequados antes de somar/subtrair.

MÉTODO DA SUBSTITUIÇÃO
Isola uma incógnita numa equação e substitui na outra. Ex.: x+y=12 e x=2y. Substituindo: 2y+y=12 → 3y=12 → y=4 → x=2×4=8. Resposta: x=8, y=4.
Use quando uma equação já deixa uma incógnita isolada, ou quando é fácil isolá-la.

COMPARANDO OS MÉTODOS
Adição: conveniente quando os coeficientes de uma incógnita são iguais ou opostos. Substituição: conveniente quando é fácil isolar uma incógnita. Em prova, escolha o método que reduz o trabalho — não há obrigação de usar sempre o mesmo.

PROBLEMAS COM DINHEIRO
Ex.: 2 cadernos + 1 caneta = R$ 17; 1 caderno + 1 caneta = R$ 11. x=caderno, y=caneta: 2x+y=17 e x+y=11. Subtraindo a segunda da primeira: x=6 (caderno R$6). Substituindo: 6+y=11 → y=5 (caneta R$5). Confira: 2×6+5=17. ✓

PROBLEMAS COM QUANTIDADES
Ex.: soma de dois números é 30, o maior é o dobro do menor. x=maior, y=menor: x+y=30 e x=2y. Substituindo: 2y+y=30 → 3y=30 → y=10 → x=20. Resposta: 20 e 10.

TRADUZINDO O ENUNCIADO
"A soma de dois números é 25" → x+y=25. "A diferença entre eles é 7" → x-y=7. "O dobro de um número é igual ao outro" → y=2x. O mais importante é definir claramente o que cada letra representa antes de calcular.

ERROS COMUNS
1) Trocar o que cada incógnita representa no meio da resolução — mantenha a definição até o final. 2) Somar equações sem observar os sinais — se ambas têm +y, somar não elimina y; talvez seja melhor subtrair. 3) Não conferir a resposta — sempre substitua os valores encontrados nas duas equações originais.$$
  from d returning id
),
b_mat_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 4, 'Matemática/RLM', 'exercicios', 'Fixação — sistemas de equações (Q1 a Q4)', 15
  from d returning id
),
b_const_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 5, 'Constitucional', 'teoria', 'Art. 37 — LIMPE, publicidade institucional, concurso público e acumulação de cargos', 30, $$Administração Pública reúne órgãos, entidades e agentes que exercem atividades administrativas (organizar serviços, processar requerimentos, gerir recursos, realizar compras/contratos, atender cidadãos, executar políticas públicas), conforme a Constituição e as leis.

OS CINCO PRINCÍPIOS DO ART. 37 — LIMPE
O caput determina que a Administração Pública direta e indireta de qualquer dos Poderes (União, estados, DF, municípios) obedeça a:
Legalidade: agir conforme a lei — o agente não atua por vontade pessoal. Ex.: conceder benefício público exige base legal.
Impessoalidade: atender ao interesse público, sem favorecimento/perseguição pessoal. Ex.: não favorecer um conhecido num procedimento.
Moralidade: padrões de ética, probidade e honestidade compatíveis com a função. Ex.: não usar o cargo para vantagem pessoal indevida.
Publicidade: divulgação exigida pelo ordenamento, respeitadas as hipóteses legais de sigilo.
Eficiência: bons resultados, qualidade e uso adequado dos recursos públicos.
Macete: LIMPE = Legalidade, Impessoalidade, Moralidade, Publicidade, Eficiência.

LEGALIDADE: ADMINISTRAÇÃO × CIDADÃO
O particular, em regra, pode fazer o que a lei não proíbe. A Administração deve atuar dentro das competências e limites do ordenamento — um servidor não pode criar exigência para o cidadão só porque considera conveniente; precisa de fundamento jurídico. Pegadinha: eficiência não autoriza descumprir a lei para obter resultados mais rápidos.

IMPESSOALIDADE E PUBLICIDADE INSTITUCIONAL (art. 37, §1º)
A publicidade dos atos, programas, obras, serviços e campanhas dos órgãos públicos deve ter caráter educativo, informativo ou de orientação social — sem nomes, símbolos ou imagens que caracterizem promoção pessoal de autoridades ou servidores. Ex.: campanha de vacinação pode informar a população, mas não promover pessoalmente o governante.

PUBLICIDADE NÃO SIGNIFICA DIVULGAR TUDO
Existe sigilo constitucional/legalmente protegido (dados pessoais, informações protegidas por lei) — a regra não é "tudo deve ser divulgado sem exceção".

EFICIÊNCIA E QUALIDADE DO SERVIÇO
Reduzir etapas burocráticas desnecessárias, melhorar tempo de atendimento, evitar desperdícios, aperfeiçoar procedimentos — mas sempre coexistindo com legalidade e impessoalidade, nunca como autorização para ignorar regras.

CONCURSO PÚBLICO (art. 37, II)
Regra: investidura em cargo/emprego público depende de aprovação prévia em concurso público de provas ou provas e títulos, conforme a natureza e complexidade do cargo, na forma da lei. Exceção: cargos em comissão de livre nomeação e exoneração, declarados em lei. Pegadinha: "todo cargo público exige concurso, sem exceção" está errado — existe a exceção dos cargos em comissão.

VALIDADE DO CONCURSO (art. 37, III)
Prazo de até dois anos, prorrogável uma vez, por igual período. O edital pode prever prazo menor; a prorrogação é uma possibilidade, não obrigação automática. Não confunda validade do concurso com prazo de inscrição ou tempo de estudo.

ACUMULAÇÃO DE CARGOS PÚBLICOS (art. 37, XVI)
Proibida em regra, mas com exceções havendo compatibilidade de horários e demais condições constitucionais: dois cargos de professor; um cargo de professor com outro cargo técnico/científico (conforme a redação vigente); dois cargos/empregos privativos de profissionais de saúde com profissões regulamentadas. Pegadinha: "é proibida qualquer acumulação, sem exceções" está errado; mas também está errado dizer que qualquer par de cargos pode ser acumulado só por haver compatibilidade de horário — a situação precisa se enquadrar numa hipótese constitucional.$$
  from d returning id
),
b_const_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 6, 'Constitucional', 'exercicios', 'Fixação — art. 37 (Q1 a Q4)', 15
  from d returning id
),
b_info_teoria as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 7, 'Informática', 'teoria', 'Tríade CID, autenticação/autorização, MFA, phishing, malware e engenharia social', 25, $$TRÍADE CID
Confidencialidade: só pessoas/sistemas autorizados acessam a informação (ex.: impedir leitura não autorizada de dados bancários). Integridade: a informação permanece correta, protegida contra alterações indevidas (ex.: valor de transferência não pode ser alterado sem autorização). Disponibilidade: informação e sistemas acessíveis quando necessários (ex.: sistema de atendimento funcionando).
Como a banca cobra: alteração indevida de saldo → integridade. Acesso não autorizado a dados confidenciais → confidencialidade. Ataque que impede o uso do sistema → disponibilidade.

AUTENTICAÇÃO × AUTORIZAÇÃO
Autenticação verifica a identidade (usuário/senha, chave de segurança, outro fator) — "quem é você?". Autorização determina quais recursos/ações a pessoa autenticada pode usar — "o que você pode fazer?". Ex.: funcionário entra no sistema (autenticado), mas só pode consultar documentos, sem alterar pagamentos (não autorizado para isso).

SENHAS FORTES E MFA
Boas práticas: senhas longas e únicas; evitar dados públicos (datas de nascimento); não compartilhar senhas; gerenciador de senhas confiável; ativar autenticação multifator (MFA). MFA combina fatores de categorias diferentes: algo que você sabe (senha/PIN), algo que você possui (dispositivo/chave), algo que você é (biometria). Pegadinha: dois códigos pelo mesmo canal não são necessariamente dois fatores independentes — MFA não é simplesmente usar duas senhas.

PHISHING
Fraude para enganar a vítima e obter informações, credenciais ou dinheiro — por e-mail, SMS, app de mensagens, página falsa, ligação. Ex.: mensagem de "conta será bloqueada em 10 min", pedindo senha e código. Proteção: desconfiar de urgência excessiva; não informar senha/código em links recebidos; conferir o domínio; acessar pelo app/endereço oficial; confirmar pedidos de dinheiro por canal independente. Phishing não depende necessariamente de vírus — pode funcionar só explorando o engano.

TIPOS DE MALWARE
Vírus: infecta arquivos/programas, espalha ao executar/compartilhar. Worm: propaga-se automaticamente entre sistemas/redes. Trojan: disfarça-se de programa legítimo. Spyware: monitora/coleta informações. Ransomware: bloqueia acesso a dados/sistemas (muitas vezes com criptografia) e exige resgate. Keylogger: registra teclas digitadas, podendo capturar dados sensíveis. As categorias podem se sobrepor — um mesmo malware pode reunir características de mais de um tipo.

ENGENHARIA SOCIAL
Manipulação de pessoas para revelar informações, executar ações ou conceder acesso — explora confiança, medo, urgência, curiosidade ou desejo de ajudar. Ex.: alguém se finge do suporte técnico pedindo senha; falso gerente de banco pedindo código; emergência falsa para convencer uma transferência. Pegadinha: nem todo ataque depende de falha técnica — muitas fraudes exploram o comportamento humano.

BACKUP × SINCRONIZAÇÃO
Backup: cópia de segurança para recuperar dados após perda/dano/incidente. Sincronização: mantém arquivos alinhados entre dispositivos/serviços — mas se você sincroniza e apaga um arquivo, a exclusão pode se propagar; sincronização não garante cópia independente. Backup bem planejado inclui cópias separadas, controle de versões e testes de restauração.

ATUALIZAÇÕES E PROTEÇÃO
Manter sistemas/apps atualizados corrige falhas conhecidas. Outras medidas: antimalware adequado, backups regulares, restringir permissões desnecessárias, evitar programas de origem duvidosa, bloquear dispositivo quando não em uso, cuidado com mídias desconhecidas. Nenhuma medida isolada elimina todos os riscos — segurança combina controles técnicos e hábitos corretos.$$
  from d returning id
),
b_info_ex as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes)
  select id, 8, 'Informática', 'exercicios', 'Fixação — segurança da informação (Q1 a Q4)', 15
  from d returning id
),
b_simulado as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 9, 'Revisão/Simulados', 'exercicios', 'Mini-simulado — Dia 13, 3 questões por matéria (Q17 a Q28)', 40,
    $$Sem consulta. 12 questões, 3 de cada matéria: Português (regência), Matemática (sistemas de equações), Constitucional (art. 37) e Informática (segurança da informação).$$
  from d returning id
),
b_fecha as (
  insert into blocks (day_id, order_index, subject, kind, title, minutes, content)
  select id, 10, 'Revisão/Simulados', 'revisao', 'Revisão acumulada, caderno de erros e checklist do Dia 13', 20, $$REVISÃO DE 24H, 7 DIAS E 30 DIAS
Dia 14 (24h): 10–15 min para lembrar as regências de "assistir", "obedecer" e "preferir"; resolver um sistema; recitar o LIMPE; diferenciar confidencialidade, integridade e disponibilidade.
Após 7 dias: refaça as questões erradas dos Dias 10 a 13, sem olhar o gabarito — priorize as regras que você confundiu.
Após 30 dias: simulado misto com os conteúdos acumulados, comparando seu desempenho com os primeiros dias.
(O app já agenda isso sozinho via o caderno de erros — 24h, 7 dias e 30 dias, visíveis no Painel.)

CADERNO DE ERROS
Para cada erro, registre: a questão; a matéria; o motivo do erro; a regra correta; a próxima ação (refazer sem consultar). Registre também acertos por chute — o objetivo é distinguir o que você realmente sabe do que ainda precisa praticar. As questões erradas nos exercícios e no simulado de hoje já entram automaticamente no caderno de erros do app.

CHECKLIST DO DIA 13
Reconheço a regência dos verbos assistir, obedecer, preferir e aspirar. Diferencio regência verbal de nominal. Resolvo sistemas de equações pela adição e pela substituição. Transformo problemas de preços e quantidades em sistemas. Memorizo o LIMPE. Compreendo as regras de concurso público e sua validade. Diferencio confidencialidade, integridade e disponibilidade. Sei distinguir autenticação de autorização. Reconheço phishing, ransomware e engenharia social. Marque este bloco como concluído para fechar o Dia 13.$$
  from d returning id
)
insert into questions (block_id, order_index, subject, statement, options, correct_option, explanation)
select * from (values
  -- Português — fixação (Q1-4)
  ((select id from b_port_ex), 1, 'Português',
   'Assinale a alternativa correta segundo a regência tradicional.',
   '{"A":"O candidato assistiu o filme no cinema.","B":"O candidato assistiu ao filme no cinema.","C":"O candidato assistiu no filme no cinema.","D":"O candidato assistiu para o filme no cinema.","E":"O candidato assistiu com o filme no cinema."}'::jsonb,
   'B', '"Assistir" no sentido de ver/presenciar exige a preposição "a": "assistiu ao filme".'),

  ((select id from b_port_ex), 2, 'Português',
   'Complete corretamente: "O servidor obedeceu ______ normas do setor."',
   '{"A":"As.","B":"Das.","C":"Às.","D":"Pelas.","E":"Nas."}'::jsonb,
   'C', '"Obedecer" exige "a"; combinada com o artigo feminino plural "as", forma "às".'),

  ((select id from b_port_ex), 3, 'Português',
   'Assinale a frase adequada à regência tradicional do verbo "preferir".',
   '{"A":"Prefiro mais Português do que Matemática.","B":"Prefiro Português que Matemática.","C":"Prefiro Português a Matemática.","D":"Prefiro de Português a Matemática.","E":"Prefiro Português com Matemática."}'::jsonb,
   'C', 'A construção tradicional é "preferir uma coisa A outra", sem "mais... do que".'),

  ((select id from b_port_ex), 4, 'Português',
   'Na frase "A equipe é responsável pelo relatório", a expressão "responsável por" exemplifica:',
   '{"A":"Regência nominal.","B":"Concordância verbal.","C":"Concordância nominal apenas.","D":"Regência de um artigo.","E":"Uso de uma conjunção conclusiva."}'::jsonb,
   'A', '"Responsável" é nome (adjetivo) que exige a preposição "por" — regência nominal.'),

  -- Matemática — fixação (Q1-4)
  ((select id from b_mat_ex), 1, 'Matemática/RLM',
   'Resolva o sistema: x + y = 12 e x − y = 4.',
   '{"A":"x=6, y=6","B":"x=7, y=5","C":"x=8, y=4","D":"x=9, y=3","E":"x=10, y=2"}'::jsonb,
   'C', 'Somando as equações: 2x = 16 → x = 8. Substituindo: 8 + y = 12 → y = 4.'),

  ((select id from b_mat_ex), 2, 'Matemática/RLM',
   'A soma de dois números é 24, e um deles é o dobro do outro. Quais são esses números?',
   '{"A":"6 e 18.","B":"8 e 16.","C":"10 e 14.","D":"12 e 12.","E":"4 e 20."}'::jsonb,
   'B', 'x + 2x = 24 → 3x = 24 → x = 8; o dobro é 16.'),

  ((select id from b_mat_ex), 3, 'Matemática/RLM',
   'Uma pessoa comprou 2 canetas e 1 caderno por R$ 13,00. Outra compra, com 1 caneta e 1 caderno, custou R$ 9,00. Qual é o preço de uma caneta?',
   '{"A":"R$ 2,00.","B":"R$ 3,00.","C":"R$ 4,00.","D":"R$ 5,00.","E":"R$ 6,00."}'::jsonb,
   'C', 'Subtraindo as equações (2x+y=13) − (x+y=9): x = 4 (caneta = R$ 4,00).'),

  ((select id from b_mat_ex), 4, 'Matemática/RLM',
   'Qual par de valores resolve o sistema: 2x + y = 13 e x + y = 8?',
   '{"A":"x=3, y=5","B":"x=4, y=4","C":"x=5, y=3","D":"x=6, y=2","E":"x=7, y=1"}'::jsonb,
   'C', 'Subtraindo as equações: x = 5. Substituindo: 5 + y = 8 → y = 3.'),

  -- Constitucional — fixação (Q1-4)
  ((select id from b_const_ex), 1, 'Constitucional',
   'Qual princípio do artigo 37 está relacionado à busca de resultados, qualidade e uso adequado dos recursos públicos?',
   '{"A":"Publicidade.","B":"Moralidade.","C":"Impessoalidade.","D":"Eficiência.","E":"Nacionalidade."}'::jsonb,
   'D', 'Eficiência: bons resultados, qualidade e uso adequado dos recursos públicos.'),

  ((select id from b_const_ex), 2, 'Constitucional',
   'Um agente público favorece um amigo em um procedimento administrativo, sem fundamento legal. Qual princípio é especialmente relacionado à vedação desse favorecimento pessoal?',
   '{"A":"Impessoalidade.","B":"Publicidade.","C":"Eficiência.","D":"Continuidade.","E":"Hierarquia."}'::jsonb,
   'A', 'Impessoalidade veda favorecimento ou perseguição pessoal.'),

  ((select id from b_const_ex), 3, 'Constitucional',
   'Segundo a Constituição Federal, o prazo de validade do concurso público será de:',
   '{"A":"Até um ano, sem possibilidade de prorrogação.","B":"Até dois anos, prorrogável uma vez por igual período.","C":"Exatamente quatro anos em todos os casos.","D":"Até cinco anos, com prorrogações ilimitadas.","E":"Prazo indeterminado."}'::jsonb,
   'B', 'Art. 37, III: até dois anos, prorrogável uma vez, por igual período.'),

  ((select id from b_const_ex), 4, 'Constitucional',
   'Sobre a acumulação remunerada de cargos públicos, assinale a alternativa correta.',
   '{"A":"É sempre permitida, independentemente dos cargos.","B":"É proibida sem nenhuma exceção constitucional.","C":"Pode ser permitida nas hipóteses constitucionais, observadas as condições exigidas, incluindo compatibilidade de horários.","D":"Depende exclusivamente da vontade do servidor.","E":"É permitida para qualquer quantidade de cargos, desde que os salários sejam baixos."}'::jsonb,
   'C', 'A acumulação só é permitida nas hipóteses do art. 37, XVI, com compatibilidade de horários.'),

  -- Informática — fixação (Q1-4)
  ((select id from b_info_ex), 1, 'Informática',
   'O princípio da segurança da informação relacionado à proteção contra alterações indevidas é:',
   '{"A":"Disponibilidade.","B":"Integridade.","C":"Portabilidade.","D":"Usabilidade.","E":"Conectividade."}'::jsonb,
   'B', 'Integridade: a informação permanece correta, protegida contra alterações indevidas.'),

  ((select id from b_info_ex), 2, 'Informática',
   'Qual alternativa descreve corretamente a autenticação?',
   '{"A":"Define apenas o horário de funcionamento de um sistema.","B":"Determina quais arquivos devem ser apagados.","C":"Verifica a identidade de quem tenta acessar um sistema.","D":"Garante que nenhum ataque digital seja possível.","E":"Substitui todas as permissões de acesso."}'::jsonb,
   'C', 'Autenticação verifica a identidade de quem acessa — "quem é você?".'),

  ((select id from b_info_ex), 3, 'Informática',
   'Um criminoso envia uma mensagem falsa imitando um banco para induzir a vítima a informar sua senha. Essa prática é conhecida como:',
   '{"A":"Backup.","B":"Desfragmentação.","C":"Sincronização.","D":"Phishing.","E":"Compactação."}'::jsonb,
   'D', 'É a definição clássica de phishing.'),

  ((select id from b_info_ex), 4, 'Informática',
   'Qual tipo de malware é especialmente associado ao bloqueio ou à criptografia de dados para exigir resgate?',
   '{"A":"Ransomware.","B":"Editor de texto.","C":"Navegador.","D":"Gerenciador de arquivos.","E":"Programa de backup legítimo."}'::jsonb,
   'A', 'Ransomware bloqueia/criptografa dados e exige pagamento (resgate).'),

  -- Mini-simulado (Q17-28)
  ((select id from b_simulado), 1, 'Português',
   'Assinale a frase que segue a regência tradicional do verbo "aspirar", no sentido de desejar.',
   '{"A":"O candidato aspira o cargo público.","B":"O candidato aspira ao cargo público.","C":"O candidato aspira pelo cargo público.","D":"O candidato aspira com o cargo público.","E":"O candidato aspira no cargo público."}'::jsonb,
   'B', '"Aspirar" no sentido de desejar exige a preposição "a": "aspira ao cargo".'),

  ((select id from b_simulado), 2, 'Português',
   'Assinale a alternativa correta quanto à regência.',
   '{"A":"O servidor obedeceu as instruções.","B":"O candidato assistiu à palestra.","C":"Prefiro mais estudar do que trabalhar.","D":"A medida é favorável com a proposta.","E":"O funcionário chegou no local, conforme a regência tradicional exigida em prova."}'::jsonb,
   'B', '"Assistiu à palestra" segue a regência tradicional de "assistir" (ver). As demais erram obedecer, preferir, favorável e chegar.'),

  ((select id from b_simulado), 3, 'Português',
   'Na frase "A funcionária entregou o documento ao diretor", o verbo "entregar" apresenta:',
   '{"A":"Apenas um complemento direto.","B":"Apenas um complemento indireto.","C":"Dois complementos: um direto e outro indireto.","D":"Nenhum complemento.","E":"Um complemento nominal."}'::jsonb,
   'C', '"Entregou o documento" (direto) "ao diretor" (indireto) — verbo transitivo direto e indireto.'),

  ((select id from b_simulado), 4, 'Matemática/RLM',
   'Resolva o sistema: x + y = 18 e x − y = 6.',
   '{"A":"x=10, y=8","B":"x=11, y=7","C":"x=12, y=6","D":"x=13, y=5","E":"x=14, y=4"}'::jsonb,
   'C', 'Somando: 2x = 24 → x = 12. Substituindo: y = 6.'),

  ((select id from b_simulado), 5, 'Matemática/RLM',
   'Em uma papelaria, 2 cadernos e 1 caneta custam R$ 19,00. Um caderno e uma caneta custam R$ 12,00. Qual é o preço de um caderno?',
   '{"A":"R$ 5,00.","B":"R$ 6,00.","C":"R$ 7,00.","D":"R$ 8,00.","E":"R$ 9,00."}'::jsonb,
   'C', 'Subtraindo as equações: caderno = 19 − 12 = 7.'),

  ((select id from b_simulado), 6, 'Matemática/RLM',
   'A soma de dois números é 35, e o maior é 5 unidades maior que o menor. Quais são os números?',
   '{"A":"10 e 25.","B":"12 e 23.","C":"15 e 20.","D":"16 e 19.","E":"17 e 18."}'::jsonb,
   'C', 'x+y=35 e x=y+5 → 2y+5=35 → y=15, x=20.'),

  ((select id from b_simulado), 7, 'Constitucional',
   'Um servidor utiliza uma campanha institucional para promover pessoalmente uma autoridade pública. Qual princípio constitucional é especialmente relacionado à vedação dessa prática?',
   '{"A":"Eficiência.","B":"Impessoalidade.","C":"Continuidade.","D":"Especialidade.","E":"Autotutela."}'::jsonb,
   'B', 'O art. 37, §1º veda que a publicidade institucional sirva para promoção pessoal — liga-se à impessoalidade.'),

  ((select id from b_simulado), 8, 'Constitucional',
   'Sobre o concurso público, conforme o artigo 37 da Constituição Federal, assinale a alternativa correta.',
   '{"A":"O prazo de validade é sempre de quatro anos.","B":"O concurso nunca pode ser prorrogado.","C":"O prazo de validade é de até dois anos, prorrogável uma vez por igual período.","D":"A validade é indeterminada.","E":"A prorrogação é ilimitada."}'::jsonb,
   'C', 'É a regra literal do art. 37, III.'),

  ((select id from b_simulado), 9, 'Constitucional',
   'A Administração Pública busca prestar um serviço com qualidade, evitar desperdícios e melhorar os resultados, respeitando a lei. Qual princípio está mais diretamente relacionado a essa busca por resultados?',
   '{"A":"Nacionalidade.","B":"Publicidade exclusivamente.","C":"Eficiência.","D":"Direito de voto.","E":"Naturalização."}'::jsonb,
   'C', 'Eficiência: busca por resultados, qualidade e uso adequado dos recursos.'),

  ((select id from b_simulado), 10, 'Informática',
   'Qual dos três pilares da segurança da informação está relacionado à garantia de que sistemas e dados estejam acessíveis quando necessário?',
   '{"A":"Confidencialidade.","B":"Integridade.","C":"Disponibilidade.","D":"Autenticação.","E":"Engenharia social."}'::jsonb,
   'C', 'Disponibilidade: informação e sistemas acessíveis quando necessários.'),

  ((select id from b_simulado), 11, 'Informática',
   'Um funcionário consegue entrar em um sistema, mas não tem permissão para alterar os pagamentos. Essa situação demonstra a diferença entre:',
   '{"A":"Download e upload.","B":"Autenticação e autorização.","C":"Cache e cookies.","D":"Vírus e backup.","E":"Navegador e mecanismo de busca."}'::jsonb,
   'B', 'Ele foi autenticado (identidade confirmada), mas não tem autorização para alterar pagamentos.'),

  ((select id from b_simulado), 12, 'Informática',
   'Qual alternativa descreve uma prática adequada de segurança digital?',
   '{"A":"Reutilizar a mesma senha em todos os serviços.","B":"Informar códigos de autenticação a qualquer pessoa que se identifique como funcionário do banco.","C":"Desativar todas as atualizações de segurança.","D":"Manter backups e testar periodicamente a restauração dos dados.","E":"Acreditar que o modo anônimo impede todos os rastreamentos."}'::jsonb,
   'D', 'Manter backups e testar a restauração é prática recomendada — as demais são justamente o que se deve evitar.')
) as t(block_id, order_index, subject, statement, options, correct_option, explanation);
