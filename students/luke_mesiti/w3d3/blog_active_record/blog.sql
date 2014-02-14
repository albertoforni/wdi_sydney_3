DROP TABLE blog;

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    body TEXT,
    author VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- psql blog -f blog.sql



-- ALTER TABLE blog ADD COLUMN updated_at TIMESTAMP;

-- ALTER TABLE blog RENAME TO posts;

CREATE TABLE comments
(
    id SERIAL PRIMARY KEY,
    content TEXT,
    author VARCHAR(255),
    created_at TIMESTAMP,
    post_id INTEGER REFERENCES posts(id)
);


-- INSERT INTO comments (content,author,created_at,post_id) VALUES ('comment 1', 'author1', '2014-01-21 09:17:28', 2);
-- INSERT INTO comments (content,author,created_at,post_id) VALUES ('comment 2', 'author2', '2014-01-21 10:17:28', 4);
-- INSERT INTO comments (content,author,created_at,post_id) VALUES ('comment 3', 'author3', '2014-01-21 11:17:28', 7);
-- INSERT INTO comments (content,author,created_at,post_id) VALUES ('comment 4', 'author4', '2014-01-21 06:17:28', 2);
-- INSERT INTO comments (content,author,created_at,post_id) VALUES ('comment 5', 'author5', '2014-01-21 02:17:28', 2);




SELECT comments.author, comments.created_at, comments.content
FROM comments
JOIN posts ON (comments.post_id = posts.id)
WHERE posts.id = 2
ORDER BY comments.created_at ASC;










