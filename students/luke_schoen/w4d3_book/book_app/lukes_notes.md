######################
# DATABASE 
######################

	# http://guides.rubyonrails.org/getting_started.html

rails new book_app --database=postgresql
cd book_app/
cd config/
cat database.yml
subl .

	# subl . opens sublime tree structure!
	# delete user/pass from development and test sections
	# note that we are using the 'development' part, which is database 'book_app_development'
	# ruby on rails API in SDoc
	# http://weblog.rubyonrails.org/2011/8/29/the-rails-api-switches-to-sdoc/
	# http://edgeapi.rubyonrails.org/

cd ..
rake db:create

	# creates empty database file for you using database.yml

psql -l

	# lists all databases including new empty ones created with the database.yml file
	# now close terminal windows where previous rails server called from before next step otherwise error

rails server

	# now create tables in the db automatically with Rails, and migration name in /db/migrate
	# this should be done for all 'resources' required

######################
# MODELS
######################

	# IF ONLY WANT TO GENERATE MIGRATION FILE, BUT NOT MODEL
	# rails generate migration create_authors 
    # rails generate migration create_books

	# IF WANT TO GENERATE MIGRATION FILE AND MODEL
	# rails generate model author name:string bio:string image:text
	# rails generate model book title:string description:text genre:string image:text isbn:integer author:references 


	# ├── db
	# │   ├── migrate
	# │   │   ├── 20140128192818_create_posts.rb
	# │   │   └── 20140128192839_create_comments.rb

psql -d book_app_development
\d authors
\d books

	# now CTRL+C in the terminal to stop the 'rails server'

rake db:drop

	# now we can modify the tables

cd db/migrate
subl 20140128192818_create_posts.rb 
subl 20140128192839_create_comments.rb

	# update the database migration tables similar to below
	#            t.string :title		
	#            t.string :abstract
	#            t.string :body_text	
	#            t.string :author

      t.references :author, index: true

rake db:create
rake db:migrate

	# check that correct tables and databases created

psql -d book_app_development
\d
\l
rake routes

######################
# ROUTES
######################

# we need to add some routes!!

cd config/routes.rb
subl routes.rb

	# BookApp::Application.routes.draw do
	#
	# # setup routes with sub-resources
	#
	#    resources :authors do
	#            resources :books
	#    end
	#
	#	 root :to => 'authors#index' #to controller for authors, and action goes to index
	#
	# end

rake routes

	# routes automatically generated in CRUD as shown below (equivalent to 7 OFF functions i.e. get, post, put, delete)
          Prefix Verb   URI Pattern                                  Controller#Action
    author_books GET    /authors/:author_id/books(.:format)          books#index
                 POST   /authors/:author_id/books(.:format)          books#create
 new_author_book GET    /authors/:author_id/books/new(.:format)      books#new
edit_author_book GET    /authors/:author_id/books/:id/edit(.:format) books#edit
     author_book GET    /authors/:author_id/books/:id(.:format)      books#show
                 PATCH  /authors/:author_id/books/:id(.:format)      books#update
                 PUT    /authors/:author_id/books/:id(.:format)      books#update
                 DELETE /authors/:author_id/books/:id(.:format)      books#destroy
         authors GET    /authors(.:format)                           authors#index
                 POST   /authors(.:format)                           authors#create
      new_author GET    /authors/new(.:format)                       authors#new
     edit_author GET    /authors/:id/edit(.:format)                  authors#edit
          author GET    /authors/:id(.:format)                       authors#show
                 PATCH  /authors/:id(.:format)                       authors#update
                 PUT    /authors/:id(.:format)                       authors#update
                 DELETE /authors/:id(.:format)                       authors#destroy
            root GET    /                                            authors#index

######################
# CONTROLLERS
######################

	# create in app/controller/ folder files for each 'resource'
cd ..
cd app/controllers
rails generate controller authors
rails generate controller books

	# this creates:
	# app/controller/authors_controller.rb
	# app/controller/books_controller.rb
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
	end

######################
# VIEWS
######################

	# the controllers will look for an index file inside /views/ folder
	# create view files
cd ..
cd /app/views/authors
touch index.html.erb

######################
# MODELS
######################

	# if did not create models earlier, we need to go into /models/ folder
    # create a file author.rb 
    # create a file book.rb

cd app/models
touch author.rb
touch book.rb

	# class Author < ActiveRecord::Base
	# end
	#
	# class Book < ActiveRecord::Base
	# end

rails console
Author.count
Book.count

	# go to /migrate/seeds.rb

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

	cd .. (back to book_app main directory)
	rake db:seed

	rails server

	localhost:3000

	class AuthorsController < ApplicationController
	def index
		@authors = Author.all
	end

rake db:drop
rake db:create
rm db/migrate/*
rails generate scaffold Author name:string bio:text image:string
rails generate scaffold Book name:string description:text image:string
image:string isbn:integer author:references

rake db:seed
rake db:migrate
rake db:seed
rails server

http://apidock.com/rails/ActionView/Helpers/FormOptionsHelper/collection_select




