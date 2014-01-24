create table courses
(
	id serial8 primary key,
	title varchar(255)
);


create table courses
(
	id serial8 primary key,
	title varchar(255),
	description text,
	body text,
	author varchar(255),
	created_at timestamp
);

create table comments
	(
		id serial primary key,
		comment varchar(255),
		post_id integer references blog.id
		);