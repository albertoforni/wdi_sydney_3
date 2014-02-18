# psql crud_blog -f comment.sql
# INSERT INTO blog_comments (comment, author, post_id) VALUES ('test comment', 'luke', 26);
# DELETE FROM blog_comments WHERE id = 1;

CREATE TABLE comments
(
	id serial8 PRIMARY KEY,
	comment VARCHAR(255),
	author VARCHAR(255),
	created_at TIMESTAMP(2),
	post_id INTEGER REFERENCES posts(id)
);