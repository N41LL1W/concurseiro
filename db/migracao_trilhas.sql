-- Cria o conceito de "trilha" (área de estudo). Rodar UMA vez no Neon, antes do tjsp_modulo01.sql.
-- É seguro rodar de novo. Os dias já existentes continuam na trilha 'geral'.
alter table days add column if not exists track text not null default 'geral';
alter table days drop constraint if exists days_week_day_number_key;
alter table days drop constraint if exists days_track_week_day_key;
alter table days add constraint days_track_week_day_key unique (track, week, day_number);
create index if not exists days_track_idx on days (track);