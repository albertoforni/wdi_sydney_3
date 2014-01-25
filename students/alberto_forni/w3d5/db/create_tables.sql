CREATE TABLE shelters
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
  shelter_id integer REFERENCES shelters(id)
);