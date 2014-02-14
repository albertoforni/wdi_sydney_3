CREATE TABLE posts 
(

id SERIAL8 PRIMARY KEY,
title VARCHAR(255),
tagline VARCHAR(255),
postbody TEXT,
author VARCHAR(50),
created TIMESTAMP,
updated TIMESTAMP,

);

-- INSERT INTO posts (title, tagline, postbody, author, created) VALUES ('Hello Bloggers!', 'This is the nicest blog post youve ever seen', 'Hello everybody, welcome to this amazing blog Ive made. This is the first post! Woooo hooooo!', 'Sammyjo', '2014-01-20 21:36:55.00000');

-- INSERT INTO posts (title, tagline, postbody, author, created) VALUES ('Post Number 2', 'This post is full of bogan ipsum...', 'Hes got a massive fruit loop no worries mad as a joey. Shell be right bogan when he hasnt got a strewth. You little ripper struth mate as dry as a stonkered. joey how mad as a greenie. Shell be right dag piece of piss as cunning as a blue. As cross as a bities with mad as a deadset. Shell be right grog bloody as cross as a uluru. Mad as a joey to grab us a shag on a rock. Shell be right roo with as cunning as a gobful. As cross as a chunder no worries trent from punchy brisvegas. Itll be dag shazza got us some ford. Flat out like a bloke no dramas as cross as a freo. Mad as a brekkie mate itll be sanger. battler piece of piss as stands out like skite. You little ripper reckon how as busy as a bities. As dry as a op shop where come a bradman. He hasnt got a vb mate shazza got us some fisho. Lets throw a cubby house mate lets throw a middy. crack a fat mate as busy as a vee dub. Get a dog up ya avos with gutful of brumby. Lets get some aussie salute how as dry as a waggin school.', 'Sammyjo', '2014-01-20 21:36:55.00000');


-- INSERT INTO posts (title, tagline, postbody, author, created) VALUES ('The third Post', 'This post is full of bacon ipsum! Struth!', 'Bacon ipsum dolor sit amet et dolore porchetta andouille, landjaeger beef short ribs dolor ball tip jerky shoulder ribeye ea. Ea irure pancetta turkey kielbasa frankfurter pastrami rump nisi filet mignon hamburger elit. Ullamco andouille boudin chicken culpa pig ad id spare ribs prosciutto porchetta. Sint in tri-tip, velit mollit cupidatat in minim. Salami andouille sint occaecat fatback ribeye incididunt pig ullamco bacon mollit pork belly ham hock. Andouille meatloaf brisket cillum minim. Do boudin tail prosciutto. Pork chop meatball aute leberkas ribeye chicken reprehenderit velit in kevin nulla laboris. Swine jowl doner fatback. Bacon laboris ball tip, pork belly filet mignon tenderloin short ribs culpa chicken. Leberkas nisi labore, enim pork shoulder incididunt minim in. Cow eu occaecat capicola fatback beef ribs doner andouille rump venison corned beef leberkas dolore. Sed tail beef sint velit proident pig landjaeger pastrami in fugiat tempor et frankfurter est. Ribeye biltong boudin chicken hamburger.', 'Sammyjo', '2014-01-20 21:36:55.00000');


CREATE TABLE comments

(
id SERIAL8 PRIMARY KEY,
author VARCHAR(255),
commentbody TEXT,
created_at TIMESTAMP,
post_id INTEGER
);

-- INSERT INTO comments (author, commentbody, created_at, post_id) VALUES ('Harry Potter', 'This is a great post, thanks!', '2014-01-21 20:00:55.00000', 1);
-- INSERT INTO comments (author, commentbody, created_at, post_id) VALUES ('Rubeus Hagrid', 'I shouldnt have said that, i should NOT have said that! Post me yo...', '2014-01-15 23:00:55.00000', 2);
-- INSERT INTO comments (author, commentbody, created_at, post_id) VALUES ('Kamakaze Watermelon', 'fhfjkhfjsk ASDF', '2014-01-19 23:00:55.00000', 2);