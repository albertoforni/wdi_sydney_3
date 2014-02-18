######################
# DATABASE 
######################

cd w4d4_ai_hunch/ai_app
rails new ai_app --database=postgresql
cd ai_app/
subl .
<!-- delete user/pass from database.yml -->

cd ..
rake db:create
<!-- creates empty database file for you using database.yml -->

psql -l
<!-- lists all databases created with the database.yml file -->


<!-- now create tables in the db, migration name in /db/migrate, for all 'resources' required -->

######################
# MIGRATION AND MODELS
######################

rails generate scaffold Robot name:string description:text image:string
rails generate scaffold Sense name:string description:text image:string
rails generate scaffold Idea name:string description:text
rails generate scaffold Hunch name:string description:text
rails generate scaffold User name:string type_of:string image:string
rails g migration CreateJoinTableIdeaHunch idea hunch

rake db:migrate
<!-- ├── db
│   ├── migrate
│   │   ├── 20140131222748_create_robots.rb
│   │   ├── 20140131222800_create_senses.rb
│   │   ├── 20140131222811_create_ideas.rb
│   │   ├── 20140131222820_create_hunches.rb
│   │   └── 20140131222829_create_join_table_idea_hunch.rb -->

######################
# SETUP ASSOCIATIONS
######################

<!-- │   ├── models
	│   │   ├── concerns
	│   │   ├── hunch.rb
	│   │   ├── idea.rb
	│   │   ├── robot.rb
	│   │   └── sense.rb -->


class Robot < ActiveRecord::Base
	validates :name, presence: true 
	
	has_many :senses
	has_many :ideas
end

class Sense < ActiveRecord::Base
	validates :name, presence: true 
	
	has_many :ideas
	belongs_to :robot
end

class Idea < ActiveRecord::Base
	validates :name, presence: true 
	
	belongs_to :robot
	belongs_to :sense
	has_and_belongs_to_many :hunches
end

class Hunch < ActiveRecord::Base
	validates :name, presence: true 
	
	has_and_belongs_to_many :ideas
end


######################
# MIGRATE ASSOCIATIONS
######################

rake db:migrate

psql -d ai_app_development
\d robots
\d senses
\d ideas
\d hunches

<!-- 	# now modify the tables in /db/migrate to include references -->

rake db:drop

<!-- # class CreateSenses < ActiveRecord::Migration -->

      t.references :robots, index: true

<!-- # class CreateIdeas < ActiveRecord::Migration -->
 
      t.references :robots, index: true
      t.references :senses, index: true

<!-- # class CreateHunches < ActiveRecord::Migration -->
 
      t.references :ideas, index: true

rake db:create
rake db:migrate

<!-- 	# check that correct tables and databases created -->

psql -d ai_app_development
\d
\l

ai_app_development=# select * from robots;
ai_app_development=# select * from senses;
ai_app_development=# select * from ideas;
ai_app_development=# select * from hunches;

######################
# ROUTES
######################

<!-- # we need to add some routes!! -->

cd config/routes.rb
subl routes.rb

<!-- AiApp::Application.routes.draw do

# change to short routes:

get "about" => "pages#about"
get "contribute" => "pages#contribute"

  resources :robots do
  		resources :senses, shallow:true 
  		resources :ideas do, shallow:true 
  			resources :hunches, shallow:true
		end
  end
  
  root :to => 'robots#index' 
  
  # resources :senses
  # resources :ideas
  # resources :hunches

end -->

rake routes

<!-- routes automatically generated in CRUD -->
         Prefix Verb   URI Pattern                            Controller#Action
          about GET    /about(.:format)                       pages#about
     contribute GET    /contribute(.:format)                  pages#contribute
   robot_senses GET    /robots/:robot_id/senses(.:format)     senses#index
                POST   /robots/:robot_id/senses(.:format)     senses#create
new_robot_sense GET    /robots/:robot_id/senses/new(.:format) senses#new
     edit_sense GET    /senses/:id/edit(.:format)             senses#edit
          sense GET    /senses/:id(.:format)                  senses#show
                PATCH  /senses/:id(.:format)                  senses#update
                PUT    /senses/:id(.:format)                  senses#update
                DELETE /senses/:id(.:format)                  senses#destroy
   idea_hunches GET    /ideas/:idea_id/hunches(.:format)      hunches#index
                POST   /ideas/:idea_id/hunches(.:format)      hunches#create
 new_idea_hunch GET    /ideas/:idea_id/hunches/new(.:format)  hunches#new
     edit_hunch GET    /hunches/:id/edit(.:format)            hunches#edit
          hunch GET    /hunches/:id(.:format)                 hunches#show
                PATCH  /hunches/:id(.:format)                 hunches#update
                PUT    /hunches/:id(.:format)                 hunches#update
                DELETE /hunches/:id(.:format)                 hunches#destroy
    robot_ideas GET    /robots/:robot_id/ideas(.:format)      ideas#index
                POST   /robots/:robot_id/ideas(.:format)      ideas#create
 new_robot_idea GET    /robots/:robot_id/ideas/new(.:format)  ideas#new
      edit_idea GET    /ideas/:id/edit(.:format)              ideas#edit
           idea GET    /ideas/:id(.:format)                   ideas#show
                PATCH  /ideas/:id(.:format)                   ideas#update
                PUT    /ideas/:id(.:format)                   ideas#update
                DELETE /ideas/:id(.:format)                   ideas#destroy
         robots GET    /robots(.:format)                      robots#index
                POST   /robots(.:format)                      robots#create
      new_robot GET    /robots/new(.:format)                  robots#new
     edit_robot GET    /robots/:id/edit(.:format)             robots#edit
          robot GET    /robots/:id(.:format)                  robots#show
                PATCH  /robots/:id(.:format)                  robots#update
                PUT    /robots/:id(.:format)                  robots#update
                DELETE /robots/:id(.:format)                  robots#destroy
           root GET    /                                      robots#index



rails console
Robot.count
Sense.count
Idea.count
Hunch.count

######################
# SEEDS
######################

<!-- go to /migrate/seeds.rb -->


	cd .. (back to ai_app main directory)
	rake db:seed

######################
# TEST SERVER
######################

	rails server

	localhost:3000


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


#######
# HASH 
#######


<!-- class CreateSenses < ActiveRecord::Migration -->

      t.text :robotimages

<!-- use text instead of string type in migration file so Rails will properly convert it into YAML for you (and perform proper serialization -->

<!-- class Sense < ActiveRecord::Base -->
 serialize :robotimages, Hash

##########
#PAGEINATE

# in senses index file
<%# require 'will_paginate' %>
<%# require 'will_paginate/data_mapper' %>

    <%= will_paginate @senses %>

# in GEMFILE

gem 'will_paginate', '~> 3.0.0', require: %w[
  will_paginate
  will_paginate/data_mapper
]

DOES NOT WORK!!!!!!

HASH IN COLUMN!!!

ai_app_development=# select * from senses;
 id | name  | description | image |              robotimages               | robot_id |         created_at         |         updated_at         
----+-------+-------------+-------+----------------------------------------+----------+----------------------------+----------------------------
  2 | bb    | bb          |       | --- {}                                +|        1 | 2014-02-01 12:48:40.084391 | 2014-02-01 12:48:40.084391
    |       |             |       |                                        |          |                            | 
  1 | aa    | aa          |       | --- {}                                +|        2 | 2014-02-01 12:48:22.984094 | 2014-02-01 12:48:49.197554
    |       |             |       |                                        |          |                            | 
  3 | test1 |             |       | {"1"=>"http://robohash.org/XNZ387388"} |        1 | 2014-02-01 13:28:59.117286 | 2014-02-01 13:28:59.117286
  4 | cc    | a           |       | {"1"=>"http://robohash.org/XNZ387388"} |        1 | 2014-02-01 13:30:04.141144 | 2014-02-01 13:30:04.141144
  5 | ddd   | dd          |       | {"1"=>"http://robohash.org/XNZ387388"} |        1 | 2014-02-01 13:30:12.807943 | 2014-02-01 13:30:12.807943
  6 | ffff  | f           |       | {"4"=>"http://robohash.org/QBO543898"} |        4 | 2014-02-01 13:30:46.316914 | 2014-02-01 13:30:46.316914
  7 | test1 |             |       | {"1"=>"http://robohash.org/XNZ387388"} |        1 | 2014-02-01 13:36:34.365637 | 2014-02-01 13:36:34.365637

gem install bundler
cd /w4d4_ai_hunch/ai_app
bundle install


# updated GEMFILE
# https://github.com/twbs/bootstrap-sass
# http://bundler.io/
gem 'bootstrap-sass', '~> 3.1.0'

# created directory /app/stylesheets/application.css.scss
created @import "bootstrap";


######
# ARRAYS IN TABLES
######

http://blog.relatabase.com/rails-postgres-arrays




#####
# GOOGLE API
#####

http://stackoverflow.com/questions/7805711/javascript-json-google-trends-api
https://github.com/suryasev/unofficial-google-trends-api

####
# RAILS CONSOLE TO TEST CODE AND CALL FUNCTIONS ETC
####

xxxx.to_json ---> for debugging and displaying values in browser

removed turbolinks performance enhancement!