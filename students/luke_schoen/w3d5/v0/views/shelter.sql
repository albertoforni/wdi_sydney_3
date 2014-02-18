DROP TABLE pets;
DROP TABLE donations;
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
	shelter_id INTEGER REFERENCES shelters(id)
);

CREATE TABLE donations
(
	id serial8 PRIMARY KEY,
	name VARCHAR(255),
	pet_id INTEGER REFERENCES pets(id)
);

