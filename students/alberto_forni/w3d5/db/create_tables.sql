CREATE TABLE shelters
(
  id serial primary key,
  name varchar(255),
  max_capacity smallint
);

CREATE TABLE animals
(
  id serial primary key,
  name varchar(255),
  breed varchar(255),
  age smallint,
  donated_at timestamp,
  shelter_id integer REFERENCES shelters(id)
);

CREATE TABLE cages
(
  id serial primary key,
  type varchar(255),
  num smallint,
  shelter_id integer REFERENCES shelters(id)
);