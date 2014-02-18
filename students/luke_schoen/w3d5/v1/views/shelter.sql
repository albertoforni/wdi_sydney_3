DROP TABLE pets;
DROP TABLE donates;
DROP TABLE shelters;

CREATE TABLE shelters
(
	id serial8 PRIMARY KEY,
	name VARCHAR(255),
	max_capacity INTEGER
);

CREATE TABLE pets
(
	id serial8 PRIMARY KEY,
	type_of VARCHAR(255),
	name VARCHAR(255),
);

CREATE TABLE donates
(
	id serial8 PRIMARY KEY,
	pet_id INTEGER REFERENCES pets(id),
	shelter_id INTEGER REFERENCES shelters(id)
);



