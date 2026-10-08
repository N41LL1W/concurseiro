# Concurseiro

Painel de estudos e desempenho (Next.js 15 + TypeScript + Tailwind 4 + Neon Postgres).

## Rodar local
1. `npm install`
2. Crie um projeto em neon.tech e copie a connection string para `.env.local` (modelo em `.env.example`).
3. Rode o conteúdo de `db/schema.sql` no SQL Editor do Neon (cria as tabelas de conteúdo e de registro).
4. Rode `db/dia1_v2.sql` para cadastrar o Dia 1 completo (substitui `db/seed.sql`, que ficou obsoleto).
5. Rode `db/dia2_v2.sql` para cadastrar o Dia 2 completo (substitui `db/seed_dia2.sql`, que ficou obsoleto).
6. Rode `db/dia3_v2.sql` para cadastrar o Dia 3 completo (Português: classes gramaticais + Informática).
7. Rode `db/dia4_v2.sql` para cadastrar o Dia 4 completo (Constitucional: art. 5º + Matemática avançada).
8. Rode `db/dia5_v2.sql` para cadastrar o Dia 5 completo (revisão geral das 5 matérias + mini-simulado de 20 questões).
9. Rode `db/dia6_v2.sql` para cadastrar o Dia 6 completo (concordância, equações, organização administrativa,
   segurança da informação + mini-simulado de 20 questões). Esse é o primeiro dia da Semana 2.
10. Rode `db/dia7_v2.sql` para cadastrar o Dia 7 completo (regência, juros simples/compostos, direitos sociais
    e nacionalidade, Sistema Financeiro Nacional + mini-simulado de 20 questões).
11. Rode `db/dia8_v2.sql` para cadastrar o Dia 8 completo (concordância, razão/proporção/regra de três, LIMPE,
    internet e segurança + mini-simulado de 20 questões, com bloco de nível mais alto no final).
12. Rode `db/dia9_v2.sql` para cadastrar o Dia 9 completo (colocação pronominal, porcentagem, atos
    administrativos, sistemas operacionais/arquivos/atalhos + mini-simulado de 20 questões).
5. `npm run dev` → http://localhost:3000

## Como o estudo funciona
- **/estudar** lista os dias cadastrados com o progresso de blocos concluídos.
- Cada dia tem blocos de teoria (texto + botão "Marcar como concluído", que já lança as horas)
  e blocos de exercícios (pergunta de múltipla escolha + confiança). Responder já registra o
  acerto/erro; toda questão errada vira automaticamente uma entrada no caderno de erros, que
  reaparece no Painel para revisão em 24h, 7 dias e 30 dias.
- **/registrar** continua existindo para o que fica fora do conteúdo do app: vídeos assistidos,
  leitura avulsa, lei seca, simulados externos etc.
- Para adicionar o Dia 2 em diante, copie o padrão de `db/seed.sql` (um bloco `with dias/blocos`
  por dia) ou peça para eu gerar o próximo dia.

## Deploy
`git init && git add . && git commit -m "primeiro commit"`, suba para o GitHub, importe na Vercel e
defina `DATABASE_URL` em Settings → Environment Variables.

## Personalizar
Matérias e metas de horas: `lib/plan.ts`. Meta de acertos: `TARGET_PCT`.
