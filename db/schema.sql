-- CONTEÚDO (o plano de estudos em si)
create table if not exists days (
  id serial primary key,
  week int not null,
  day_number int not null,
  title text not null,
  unique (week, day_number)
);

create table if not exists blocks (
  id serial primary key,
  day_id int not null references days(id) on delete cascade,
  order_index int not null,
  subject text not null,
  kind text not null check (kind in ('teoria','exercicios','revisao')),
  title text not null,
  minutes int not null,
  content text
);

create table if not exists questions (
  id serial primary key,
  block_id int not null references blocks(id) on delete cascade,
  order_index int not null,
  subject text not null,
  statement text not null,
  options jsonb not null,
  correct_option text not null,
  explanation text
);

-- PROGRESSO ligado ao conteúdo (gerado ao estudar pelo app)
create table if not exists block_completions (
  id serial primary key,
  block_id int not null references blocks(id) on delete cascade,
  day date not null default current_date,
  minutes int not null,
  unique (block_id, day)
);

create table if not exists answers (
  id serial primary key,
  question_id int not null references questions(id) on delete cascade,
  day date not null default current_date,
  chosen text not null,
  confidence int not null default 100 check (confidence between 0 and 100),
  correct boolean not null,
  created_at timestamptz not null default now()
);

-- REGISTRO MANUAL (estudo fora do app: vídeo, leitura avulsa, lei seca etc.)
create table if not exists sessions (
  id serial primary key, day date not null default current_date,
  subject text not null, kind text not null check (kind in ('teoria','questoes','revisao')),
  minutes int not null check (minutes > 0)
);
create table if not exists question_logs (
  id serial primary key, day date not null default current_date,
  subject text not null, total int not null check (total > 0),
  correct int not null check (correct >= 0 and correct <= total)
);
create table if not exists errors (
  id serial primary key, created date not null default current_date,
  subject text not null, note text not null, reviewed int not null default 0,
  question_id int references questions(id)
);
