# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#


# 5.times do |index|
# 	Song.create(:name => "name" + index.to_s)
# end
# 	#Song.create(:name => "name #{index}")
# 	#POST.create(:name => Faker::Name.name)


		robot1 = Robot.create(
		    :name => 'Lady Gaga',
		    :description => 'Stefani Joanne Angelina Germanotta (born March 28, 1986), who performs under the stage name Lady Gaga, is a singer, songwriter and musician from New York City, New York, United States. Before Gaga adopted her stage name she was in a band called Stefani Germanotta Band. She released her first EP, “Red and Blue”, in early 2006. The following year, music producer Rob Fusari dubbed her Lady Gaga, inspired by the Queen song “Radio Gaga”. After this she recorded her first two songs as Lady Gaga (Fever and Wonderful) on Def Jam records, but was later let go.',
			:image => 'http://userserve-ak.last.fm/serve/500/62781345/Lady+Gaga+Gaga.png'
		)

		album1 = Album.create(
		    :name => 'The Fame',
		    :description => 'The Fame is the debut album by American pop singer-songwriter Lady GaGa. It was released in August, 2008 by Interscope Records in Canada and some European countries. A revised edition with new tracks and different track-listing was released in Australia on November 15, 2008, in the US on October 28, 2008 and in Ireland and the UK on January 9, 2009 and January 12, 2009.Musically, The Fame is a dance-pop and synthpop album that has influences of pop music from the 1980s. Lyrically, the album visualizes Gaga’s love of fame in general whilst also dealing with subjects such as love, sex, money, drugs and sexual identity.',
		    :image => 'http://userserve-ak.last.fm/serve/500/95368471/The+Fame.png',
			:artist_id => artist1.id
			)

		Song.create(
		    :name => 'Paparazzi',
		    :description => 'This song is the sixth single released from her debut album, The Fame.It is the third single released in the United Kingdom, fourth single in the states and fifth single in Australia. It replaced LoveGame as the next single due to LoveGame’s controversial and explicit lyrics and video. In the U.S., “Paparazzi” peaked at # 6 on the Billboard Hot 100, and went to #1 on the Mainstream Top 40 chart and the Hot Dance Club Play chart in Autumn of 2009.',
		    :length => '3:28',
			:artist_id => artist1.id,
			:album_id => album1.id
			)


		artist2 = Artist.create(
		    :name => 'Metallica',
		    :description => 'Metallica is an American metal band formed in 1981 in Los Angeles, California, United States when drummer Lars Ulrich posted an advertisement in The Recycler. Metallica’s line-up originally consisted of Ulrich, rhythm guitarist and vocalist James Hetfield, and lead guitarist Dave Mustaine. Mustaine was later fired due to problems with alcoholism and drug addiction - he went on to form the band Megadeth. Exodus guitarist Kirk Hammett took his place. Metallica has been through several bassists, including Ron McGovney, Cliff Burton (who died in a bus crash while the band was on tour), and Jason Newsted.',
			:image => 'http://userserve-ak.last.fm/serve/500/7560709/Metallica++03.jpg'
		)

		album2 = Album.create(
		    :name => 'Master of Puppets',
		    :description => 'Master of Puppets is the second song off Metallica’s 1986 album Master of Puppets. The song, following the theme of control with the rest of the album, discusses drugs and their effects. Addiction, the master referenced in the title, narrates the song, testifying to the destruction that comes from being under the control of drugs. James Hetfield explained the song “deals pretty much with drugs. How things get switched around, instead of you controlling what you’re taking and doing, it’s drugs controlling you.” Master of Puppets is also notable for its long instrumental section beginning about three and a half minutes into the song.',
		    :image => 'http://userserve-ak.last.fm/serve/500/71388652/Master+of+Puppets+PNG.png',
			:artist_id => artist2.id
		)

		Song.create(
		    :name => 'Leper Messiah',
		    :description => 'Leper Messiah is the sixth track of Metallica’s 1986 album Master of Puppets.Religion’s control over people is castigated throughout the song by James Hetfield. Hetfield’s relationship with Christianity is well-established and stems from his mother’s death because of her refusal to seek medical treatment for cancer because of her Christian Science beliefs. Religion is frequently discussed in other Metallica songs.',
		    :length => '5:40',
			:artist_id => artist2.id,
			:album_id => album2.id
		)


		artist3 = Artist.create(
		    :name => 'Wolfgang Amadeus Mozart',
		    :description => 'Metallica is an American metal band formed in 1981 in Los Angeles, California, United States when drummer Lars Ulrich posted an advertisement in The Recycler. Metallica’s line-up originally consisted of Ulrich, rhythm guitarist and vocalist James Hetfield, and lead guitarist Dave Mustaine. Mustaine was later fired due to problems with alcoholism and drug addiction - he went on to form the band Megadeth. Exodus guitarist Kirk Hammett took his place. Metallica has been through several bassists, including Ron McGovney, Cliff Burton (who died in a bus crash while the band was on tour), and Jason Newsted.',
			:image => 'http://userserve-ak.last.fm/serve/500/85563769/Wolfgang+Amadeus+Mozart+PNG.png'
		)

# no album for third artist

		Song.create(
		    :name => 'Turkish March',
		    :description => 'This full track title is “Piano Sonata No. 11 in A major, K.331 - Alla turca',
		    :length => '3:00',
			:artist_id => artist3.id
		)


