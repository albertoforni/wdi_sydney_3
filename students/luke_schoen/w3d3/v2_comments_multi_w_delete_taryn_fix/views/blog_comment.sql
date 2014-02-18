# psql crud_blog -f blog_comment.sql
# INSERT INTO blog_comments (comment, author, post_id) VALUES ('test comment', 'luke', 26);
# DELETE FROM blog_comments WHERE id = 1;

CREATE TABLE blog_comments
(
	c_id serial8 PRIMARY KEY,
	c_comment VARCHAR(255),
	c_author VARCHAR(255),
	c_created_at TIMESTAMP(2),
	post_id INTEGER REFERENCES blog_posts(id)
);