CREATE TABLE theatres
(
  id SERIAL PRIMARY KEY,
  max_capacity INTEGER

);

CREATE TABLE movies
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
  
);

CREATE TABLE screenings
(
  id SERIAL PRIMARY KEY,
  date_time TIMESTAMP,
  theatre_id INTEGER,
  movie_id INTEGER
 
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  price MONEY,
  screening_id INTEGER
  
);