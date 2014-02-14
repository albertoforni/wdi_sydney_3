CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  body_text TEXT,
  author VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

# Add comments to blog
  # Add a comments table to blog database, it should include at least:
    # the id of the post that the comment is for (post_id)
    # the text of the comment
    # the author of the comment
    # the date the comment was created (call it created_at)

CREATE TABLE comments
(
  id SERIAL PRIMARY KEY,
  comment TEXT,
  author VARCHAR(255),
  created_at TIMESTAMP
);

alter table comments add post_id integer references posts(id);

# For any post, list existing comments at the bottom of the page
  # (along with authors and date posted)
  # ordered by the date it was created

# Check this works by manually putting data into comments to start
insert into comments (comment, post_id, author)
  values ('comment text here', 16, 'user1');
