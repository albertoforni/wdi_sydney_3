# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author1 = Author.create(
    :name => 'Joe Bookwriter',
    :bio => 'Spanish language stuff',
	:image => 'http://lorempixel.com/g/400/200/'
)

Book.create(
    :title => 'Rails to make Ruby easier',
    :description => 'Super easy Rails for you',
    :genre => 'Advanced only',
    :image => 'http://lorempixel.com/g/400/200/',
	:isbn => 12318305,
	:author => author1
)

author2 = Author.create(
    :name => 'Julie Bookworm',
    :bio => 'Taiwanese comic books',
	:image => 'http://lorempixel.com/g/400/200/'
)

Book.create(
    :title => 'Ruby Code Super difficult',
    :description => 'Guru programming for 21st century',
    :genre => 'Advanced only',
    :image => 'http://lorempixel.com/g/400/200/',
	:isbn => 12318304,
	:author => author2
)

author3 = Author.create(
    :name => 'WDI guru guy',
    :bio => 'English programming',
	:image => 'http://lorempixel.com/g/400/200/'
)

Book.create(
    :title => 'Perl for 20th century',
    :description => 'Old school programming for 20th century',
    :genre => 'All ages',
	:image => 'http://lorempixel.com/g/400/200/',
	:isbn => 12318303,
	:author => author3
)


Book.create(
    :title => 'CCCCC',
    :description => 'Super easy Rails for you',
    :genre => 'Advanced only',
    :image => 'http://lorempixel.com/g/400/200/',
	:isbn => 12318305,
	:author => author1
)

Book.create(
    :title => 'BBBBB',
    :description => 'Guru programming for 21st century',
    :genre => 'Advanced only',
    :image => 'http://lorempixel.com/g/400/200/',
	:isbn => 12318304,
	:author => author2
)

Book.create(
    :title => 'AAAAA',
    :description => 'Old school programming for 20th century',
    :genre => 'All ages',
	:image => 'http://lorempixel.com/g/400/200/',
	:isbn => 12318303,
	:author => author3
)
