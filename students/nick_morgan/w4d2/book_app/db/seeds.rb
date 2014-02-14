# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author = Author.create( name: 'Neal Stephenson' , bio: 'Sci-fi author', image: 'http://www.bu.edu/bostonia/fall08/stephenson/stephenson.jpg')
author.books.create(title: 'Snow Crash', image: 'http://majorspoilers.com/wp-content/uploads/2012/06/Snow-Crash.jpg')