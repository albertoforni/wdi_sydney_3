create table blog
(
  id serial8 primary key,
  title varchar(255),
  description varchar(255),
  body text,
  author varchar(255),
  created_at timestamp
  updated_at timestamp
  comments text,
);

