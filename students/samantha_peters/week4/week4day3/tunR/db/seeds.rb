Song.create(
	:name => 'Shaddap You Face',
	:length => 195,
	:youtube => 'http://www.youtube.com/watch?v=sFacWGBJ_cs',
	:album_id => 0,
	:artist_id => 1,
	:image => 'http://upload.wikimedia.org/wikipedia/en/b/b1/Joe_Dolce_-_SYF.jpg'
    )

Song.create(
	:name => 'Older',
	:length => 300,
	:youtube => 'http://youtu.be/04-9Gv0FMLg',
	:album_id => 1,
	:artist_id => 2,
	:image => ''
    )

Song.create(
	:name => 'Star People',
	:length => '480',
	:youtube => 'http://www.youtube.com/watch?v=Y2GZo0PzqY4',
	:album_id => 1,
	:artist_id => 2,
	:image => ''
    )

Song.create(
	:name => 'Charlie Brown',
	:length => '525',
	:youtube => 'http://youtu.be/zTFBJgnNgU4',
	:album_id => 2,
	:artist_id => 3,
	:image => ''
    )

Song.create(
	:name => 'The Hardest Part',
	:length => '265',
	:youtube => 'http://youtu.be/WAGbq3A9HfA',
	:album_id => 3,
	:artist_id => 3,
	:image => 'http://upload.wikimedia.org/wikipedia/en/1/18/ColdplayTheHardestPart.jpg'
    )

Album.create(

	:name => 'Older',
	:year =>1996,
	:genre => 'Pop, R&B, Soul, Jazz',
	:album_art => 'http://upload.wikimedia.org/wikipedia/en/0/00/Older_%28George_Michael_album_-_cover_art%29.jpg',
	:artist_id => 2

	)

Album.create(

	:name => 'Mylo Xyloto',
	:year => 2011,
	:genre => 'Alternative Rock',
	:album_art => 'http://upload.wikimedia.org/wikipedia/en/7/77/Myloxyloto.jpg',
	:artist_id => 3

	)

Album.create(

	:name => 'X & Y',
	:year => 2005,
	:genre => 'Alternative Rock',
	:album_art => 'http://upload.wikimedia.org/wikipedia/en/2/28/Coldplay_X%26Y.svg',
	:artist_id => 3

	)


Artist.create(
	:name => 'Joe Dolce',
	:members => 'Joe Dolce, singer and muscician',
	:formed => 1978,
	:image => 'http://upload.wikimedia.org/wikipedia/commons/9/9f/Joedolcesteps.jpg',
	:website => 'http://www.joedolce.net/'

	)

Artist.create(
	:name => 'George Michael',
	:members => 'George Micahel, singer',
	:formed => 1982,
	:image => 'https://pbs.twimg.com/profile_images/1288148169/_CET3505-Edit-2-Edit-Edit-1.jpeg',
	:website => 'http://www.georgemichael.com/'

	)

Artist.create(
	:name => 'Coldplay',
	:members => 'Chris Martin, Jonny Buckland, Guy Berryman, Will Champion',
	:formed => 1996,
	:image => 'http://www.sonic1029.com/files/coldplay1.jpg',
	:website => 'http://www.coldplay.com/'

	)

