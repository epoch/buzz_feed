CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email TEXT,
  password_digest TEXT
);

CREATE TABLE buzzwords (
  id SERIAL PRIMARY KEY,
  word VARCHAR(200),
  description TEXT,
  user_id Integer
);

alter table buzzwords add column user_id Integer;

insert into users (email) values ('dt@ga.co');


insert into buzzwords (word, description, user_id) values ('recursion', 'inception', 1);
insert into buzzwords (word, description, user_id) values ('serverless', 'oh no',1);
insert into buzzwords (word, description, user_id) values ('bad idea', 'hipsters',2);

