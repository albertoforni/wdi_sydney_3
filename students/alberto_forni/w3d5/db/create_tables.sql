CREATE TABLE shelders
(
  id serial primary key,
  name varchar(255)
);

CREATE TABLE animals
(
  id serial primary key,
  name varchar(255),
  breed varchar(255),
  age smallint,
  shelder_id integer REFERENCES shelders(id)
);