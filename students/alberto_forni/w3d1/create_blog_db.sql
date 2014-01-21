CREATE TABLE posts
(
  id serial8 primary key,
  title varchar(255),
  abstract varchar(255),
  body text,
  author varchar(255),
  created_at timestamp
);


ALTER TABLE posts
ADD COLUMN updated_at timestamp;

CREATE TABLE comments
(
  id serial8 primary key,
  text text,
  author varchar(255),
  created_at timestamp,
  post_id integer REFERENCES posts(id)
);