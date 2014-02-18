######################
# DATABASE 
######################

<!-- 	# http://guides.rubyonrails.org/getting_started.html -->

cd w4d3_tunr/tunr_app
rails new tunr_app --database=postgresql
cd tunr_app/
cd config/
cat database.yml
subl .

<!-- 	# subl . opens sublime tree structure!
	# delete user/pass from development and test sections
	# note that we are using the 'development' part, which is database 'tunr_app_development'
	# ruby on rails API in SDoc
	# http://weblog.rubyonrails.org/2011/8/29/the-rails-api-switches-to-sdoc/
	# http://edgeapi.rubyonrails.org/ -->

cd ..
rake db:create

<!-- 	# creates empty database file for you using database.yml -->

psql -l

<!-- 	# lists all databases including new empty ones created with the database.yml file
	# now close terminal windows where previous rails server called from before next step otherwise error -->

rails server

<!-- 	# now create tables in the db automatically with Rails, and migration name in /db/migrate
	# this should be done for all 'resources' required -->

######################
# MODELS
######################

<!-- 	# IF ONLY WANT TO GENERATE MIGRATION FILE, BUT NOT MODEL
	#rails generate migration create_authors 
	#rails generate migration create_books

	# IF WANT TO GENERATE MIGRATION FILE AND MODEL
	#rails generate model author name:string bio:string image:text
	#rails generate model book title:string description:text genre:string image:text isbn:integer author:references  -->

	# IF WANT GENERATE SCAFFOLD 
rake db:drop
rake db:create
rm db/migrate/*
rails generate scaffold Artist name:string description:text image:string
rails generate scaffold Album name:string description:text image:string
rails generate scaffold Song name:string description:text length: integer

rake db:migrate
<!-- 
├── db
│   ├── migrate
│   │   ├── 20140129205106_create_artists.rb
│   │   ├── 20140129205113_create_albums.rb
│   │   └── 20140129205121_create_songs.rb -->

psql -d tunr_app_development
\d authors
\d books

<!-- 	# now CTRL+C in the terminal to stop the 'rails server' -->

rake db:drop

<!-- 	# now we can modify the tables -->

cd db/migrate
subl 20140128192818_create_posts.rb 
subl 20140128192839_create_comments.rb

<!-- 	# update the database migration tables similar to below -->

<!-- # class CreateAlbums < ActiveRecord::Migration -->

      t.references :artists, index: true

<!-- # class CreateSongs < ActiveRecord::Migration -->
 
      t.references :albums, index: true
      t.references :artists, index: true

rake db:create
rake db:migrate

<!-- 	# check that correct tables and databases created -->

psql -d tunr_app_development
\d
\l

tunr_app_development=# select * from songs;
tunr_app_development=# select * from albums;
tunr_app_development=# select * from artists;
<!--  id | name | description | length | integer | created_at | updated_at 
----+------+-------------+--------+---------+------------+------------
(0 rows)


 id | name | description | image | created_at | updated_at 
----+------+-------------+-------+------------+------------
(0 rows)


 id | name | description | image | created_at | updated_at 
----+------+-------------+-------+------------+------------
 -->

rake routes

######################
# ROUTES
######################

<!-- # we need to add some routes!! -->

cd config/routes.rb
subl routes.rb

<!-- 
TunrApp::Application.routes.draw do

  resources :artists do
  	resources :albums
	resources :songs
  end
	
  root :to => 'artists#index' 
  #to controller for artists, and action goes to index

end 
-->

rake routes

<!-- 	# routes automatically generated in CRUD as shown below (equivalent to 7 OFF functions i.e. get, post, put, delete) -->
           Prefix Verb   URI Pattern                                   Controller#Action
    artist_albums GET    /artists/:artist_id/albums(.:format)          albums#index
                  POST   /artists/:artist_id/albums(.:format)          albums#create
 new_artist_album GET    /artists/:artist_id/albums/new(.:format)      albums#new
edit_artist_album GET    /artists/:artist_id/albums/:id/edit(.:format) albums#edit
     artist_album GET    /artists/:artist_id/albums/:id(.:format)      albums#show
                  PATCH  /artists/:artist_id/albums/:id(.:format)      albums#update
                  PUT    /artists/:artist_id/albums/:id(.:format)      albums#update
                  DELETE /artists/:artist_id/albums/:id(.:format)      albums#destroy
     artist_songs GET    /artists/:artist_id/songs(.:format)           songs#index
                  POST   /artists/:artist_id/songs(.:format)           songs#create
  new_artist_song GET    /artists/:artist_id/songs/new(.:format)       songs#new
 edit_artist_song GET    /artists/:artist_id/songs/:id/edit(.:format)  songs#edit
      artist_song GET    /artists/:artist_id/songs/:id(.:format)       songs#show
                  PATCH  /artists/:artist_id/songs/:id(.:format)       songs#update
                  PUT    /artists/:artist_id/songs/:id(.:format)       songs#update
                  DELETE /artists/:artist_id/songs/:id(.:format)       songs#destroy
          artists GET    /artists(.:format)                            artists#index
                  POST   /artists(.:format)                            artists#create
       new_artist GET    /artists/new(.:format)                        artists#new
      edit_artist GET    /artists/:id/edit(.:format)                   artists#edit
           artist GET    /artists/:id(.:format)                        artists#show
                  PATCH  /artists/:id(.:format)                        artists#update
                  PUT    /artists/:id(.:format)                        artists#update
                  DELETE /artists/:id(.:format)                        artists#destroy
             root GET    /                                             artists#index

######################
# CONTROLLERS
######################

<!-- 	# create in app/controller/ folder files for each 'resource'
	# if generated SCAFFOLD this would have been done automatically-->
cd ..
cd app/controllers
rails generate controller albums
rails generate controller artists 
rails generate controller books

<!-- 	# this creates:
	# app/controller/albums_controller.rb
	# app/controller/artists_controller.rb
	# app/controller/songs_controller.rb
	#
	# now edit each file with the following structure:
	def index
	end
	
	def show
	end
	
	def new
	end
	
	def create
	end
	
	def edit
	end 
	
	def update
	end
	
	def destroy
	end -->

######################
# VIEWS
######################

<!-- 	# the controllers will look for an index file inside /views/ folder
	# create view files -->
cd ..
cd /app/views/artists
touch index.html.erb

######################
# MODELS
######################

	# if did not create models earlier, we need to go into /models/ folder
    # create a file album.rb 
    # create a file artist.rb
    # create a file song.rb

cd app/models
touch author.rb
touch book.rb

<!-- # update with associations relationships -->

		class Album < ActiveRecord::Base
			has_many :songs
			belongs_to :artist
		end

		class Artist < ActiveRecord::Base
			has_many :albums
			has_many :songs
		end

		class Song < ActiveRecord::Base
			belongs_to :artist
			belongs_to :album
		end

rails console
Artist.count
Album.count
Song.count

	# go to /migrate/seeds.rb


	cd .. (back to book_app main directory)
	rake db:seed

	rails server

	localhost:3000

	class AuthorsController < ApplicationController
	def index
		@authors = Author.all
	end



http://apidock.com/rails/ActionView/Helpers/FormOptionsHelper/collection_select


######################
# PAGES CONTROLLER
######################

rails g controller PagesController about_us contact_us privacy terms_and_cond

rails destroy controller PagesController about_us contact_us privacy terms_and_cond

rails g controller Pages about_us contact_us privacy terms_and_cond


TunrApp::Application.routes.draw do

# default structure shown below is generated but requires long routes:

  # get "pages/about_us"
  # get "pages/contact_us"
  # get "pages/privacy"
  # get "pages/terms_and_cond"
 

# chagne to short routes achieved as follows:

get "about_us" => "pages#about_us"
get "contact_us" => "pages#contact_us"
get "privacy" => "pages#privacy"
get "terms_and_cond" => "pages#terms_and_cond"



rake routes

<!-- shows short routes, i.e.

          Prefix Verb   URI Pattern                              Controller#Action
        about_us GET    /about_us(.:format)                      pages#about_us
      contact_us GET    /contact_us(.:format)                    pages#contact_us
         privacy GET    /privacy(.:format)                       pages#privacy
  terms_and_cond GET    /terms_and_cond(.:format)                pages#terms_and_cond -->

<!-- update footer file -->

<%= link_to 'home', root_path %> |
<%= link_to 'about us', about_us_path %> |
<%= link_to 'contact us', contact_us_path %> 
<%= link_to 'privacy statement', privacy_path %> 
<%= link_to 'terms and conditions', terms_and_cond_path %> 

##########
PLAYLIST
##########

rails generate scaffold Playlist name:string


http://guides.rubyonrails.org/migrations.html#creating-a-join-table

rails g migration CreateJoinTablePlaylistSong playlist song


class Playlist < ActiveRecord::Base
	has_and_belongs_to_many :songs
end


class Song < ActiveRecord::Base
    validates :name, presence: true 
    # error shown in front end when entering in form if not entered
	
	belongs_to :artist
	belongs_to :album

	has_and_belongs_to_many :playlists
end


rake db:migrate


psql tunr_app_development


tunr_app_development=# select * from playlists;
 id | name | created_at | updated_at 
----+------+------------+------------
(0 rows)

tunr_app_development=# select * from playlists_songs;
 playlist_id | song_id 
-------------+---------
(0 rows)






