CREATE TABLE posts
(
  id serial8 primary key,
  title varchar(255),
  abstract varchar(255),
  body text,
  author varchar(255),
  created_at timestamp
)