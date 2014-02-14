CREATE TABLE shelters
(
    id serial PRIMARY KEY,
    name VARCHAR(255),
    address TEXT,
    maximum_capacity INTEGER
);

CREATE TABLE pets
(
    id serial PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    species VARCHAR(255),
    breed VARCHAR(255),
    adopted BOOLEAN,
    donated_at TIMESTAMP,
    shelter_id INTEGER REFERENCES shelters(id)
);