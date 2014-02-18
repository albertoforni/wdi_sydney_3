/*
psql -> CREATE DATABASE crud_blog; 				---> creates a new database
(terminal -> createdb crud_blog 				---> creates a new database
psql -> \l 										---> lists the databases
(terminal -> psql -l           					---> lists the databases 
GO INTO THE VIEWS DIRECTORY AND TYPE:
(terminal) -> psql crud_blog -f blog_post.sql    		---> passes sql file
(terminal) -> psql crud_blog
psql -> \d										---> lists the databases
psql -> \c crud_blog	 						---> opens the db crud_blog
(terminal -> psql crud_blog 					---> opens the db crud_blog)
psql -> DROP TABLE blog_posts; 					---> deletes the table called courses
psql -> \q 										---> exists PQSL
psql -> SELECT * FROM blog_posts; 				---> displays all entries in db 'courses' in psql
 id | title | abstract | body_text | author | created_at 
----+-------+----------+-----------+--------+------------
(0 rows)
psql -> INSERT INTO blog_posts (title, abstract, body_text, author) values ('Test_Title', 'Test_Abstract', 'Test_Body_Text', 'Test_Author'); 
psql -> INSERT INTO blog_posts (created_at) values ('2013-08-13 16:32:48');  
												----> insert test entry into table so can read and start app
psql -> SELECT * FROM blog_posts; 				---> displays all entries in db 'courses' in psql
 id |   title    |   abstract    |   body_text    |   author    | created_at 
----+------------+---------------+----------------+-------------+------------
  1 | Test_Title | Test_Abstract | Test_Body_Text | Test_Author | 
(1 row)
*/

/* 
specification of blog post
1. title
2. short description/abstract
3. body text (possibly very long)
4. author (just a single string for the name)
5. date+time created (call it created_at)
*/ 

CREATE TABLE blog_posts
(
	id serial8 PRIMARY KEY,
	title VARCHAR(255),
	abstract VARCHAR(255),
	body_text TEXT,
	author VARCHAR(255),
	created_at TIMESTAMP(2)
);