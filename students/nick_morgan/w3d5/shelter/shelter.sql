CREATE TABLE shelters
(
  id SERIAL PRIMARY KEY,
  name varchar(25),
  number_of_pets INTEGER,
  max_capacity INTEGER
);


CREATE TABLE pets
(
  id SERIAL PRIMARY KEY,
  name varchar(25),
  age INTEGER,
  gender varchar(25),
  species varchar(25),
  adopted_at TIMESTAMP,
  shelter_id INTEGER

);