# ruby mainrb
# localhost:4567

require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/activerecord'
require 'active_record'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'
require 'active_record/validations'

use Rack::MethodOverride # allows use put and delete HTTP instead of just post / get

ActiveRecord::Base.establish_connection(
	:adapter => "postgresql",
	:username => "Luke",
	:database => "crud_blog",
	:host => "localhost"
)

# before do - loads before any route
# class/database names cannot contain underscores
# class names singular, db names plural
class Post < ActiveRecord::Base 

	has_many :comments

    validates :title, :body, :created_at, :on => :create, :presence => true, :message => "Error, fields must not be blank: title, body"

    validates :title, :on => :create, :uniqueness => true, :message => "Error, field not unique: %{value}"

	validates :title, :on => :create, :length { :in => 3..255 }, :message => "Error, field must be between 3 and 255 characters"

	validates :title, :abstract, :author, :on => :create, :length { :maximum => 255 }, :message => "Error, field must be less than 255 characters"
	
	validates :body_text, :on => :create, :length { :maximum => 400 }, :message => "Error, field must be less than 400 characters"

	validates :body_text, :on => :create, :allow_blank => true

	validates :title, :abstract, :on => :create, :allow_blank => false, :message => "Error, field must not be blank: title, abstract"

end

class Comment < ActiveRecord::Base

	belongs_to :posts

	validates :comment, :author, :on => :create, :presence => true, :message => "Error, fields must not be blank: comment, author"

	validates :comment, :on => :create, :length { :maximum => 255 }, :message => "Error, field must be less than 255 characters"
	
	validates :author, :on => :create, :length { :maximum => 100 }, :message => "Error, field must be less than 100 characters"

	validates :comment, :author, :on => :create, :allow_blank => false, :message => "Error, fields must not be blank: comment, author"

end 


get '/' do

	redirect to '/posts'

end

################ VIEW ALL POSTS ##################
get '/posts' do 

	if params[:ordering] == "created_at" 
		
		@sort_type1a = "id"
		@sort_type1b = "ID"
		@sort_type2a = "title"
		@sort_type2b = "Title"
		@sort_type3a = "updated_at"
		@sort_type3b = "Last Updated"
		@sort_type_sw_date4a = "created_at"
		@sort_type_sw_date4b = "Creation Date"
	elsif params[:ordering] == "title" 
		@sort_type1a = "id"
		@sort_type1b = "ID"
		@sort_type2a = "created_at"
		@sort_type2b = "Creation Date"
		@sort_type3a = "updated_at"
		@sort_type3b = "Last Updated"
		@sort_type_sw_date4a = @sort_type2a 
		@sort_type_sw_date4b = @sort_type2b
	elsif params[:ordering] == "updated_at" 
		@sort_type1a = "id"
		@sort_type1b = "ID"
		@sort_type2a = "title"
		@sort_type2b = "Title"
		@sort_type3a = "created_at"
		@sort_type3b = "Creation Date"
		@sort_type_sw_date4a = "updated_at"
		@sort_type_sw_date4b = "Last Updated"
	elsif params[:ordering] == "id" 
		@sort_type1a = "created_at"
		@sort_type1b = "Creation Date"
		@sort_type2a = "title"
		@sort_type2b = "Title"
		@sort_type3a = "updated_at"
		@sort_type3b = "Last Updated"
		@sort_type_sw_date4a = @sort_type1a 
		@sort_type_sw_date4b = @sort_type1b
	elsif !(params[:ordering].present?)
		@sort_type1a = "created_at"
		@sort_type1b = "Creation Date"
		@sort_type2a = "title"
		@sort_type2b = "Title"
		@sort_type3a = "updated_at"
		@sort_type3b = "Last Updated"
		@sort_type_sw_date4a = @sort_type1a 
		@sort_type_sw_date4b = @sort_type1b
	end

	@res = Post.order(params[:ordering]).all

	#@show_count = Comment.count


		erb :display
end

################ VIEW INDIVIDUAL POST/COMMENTS ####
get '/posts/:id' do

	@blog = Post.find(params[:id])
	
	@comments = Comment.where("post_id = #{params[:id]}").order(:created_at => :desc) # in display it will loop through and display all

	erb :post
end

################ CREATE POST ##################
get '/posts/create/new' do

	erb :create
end

post '/posts' do

	new_post = Post.build(:title => params[:title], :abstract => params[:abstract], :body_text => params[:body_text], :author => params[:author], :created_at => Time.now)

	check = new_post.valid?

	if check == false
		@post_errors = new_post.errors
		erb :create
	else
		new_post.save
		redirect to '/'
	end
end

################ EDIT POST ##################
get '/posts/:id/edit' do
	@blog = Post.find(params[:id])

	erb :edit
end

post '/posts/:id' do

	Post.find(params[:id]).update_attributes(:title => params[:title], :abstract => params[:abstract], :body_text => params[:body_text], :author => params[:author], :updated_at => Time.now)

	redirect to '/'
end

################ CREATE COMMENT ##################

post '/posts/:id/comments' do

	new_comment = Comment.build(:comment => params[:comment], :author => params[:author], :created_at => Time.now, :post_id => params[:id])

	check = new_comment.valid?

	if check == false
		@comment_errors = new_comment.errors
		erb :post
	else
		new_comment.save
		redirect to '/'
	end

end

################ DELETE POST ##################
delete '/posts/:id' do

	@comm = Comment.where("post_id = #{params[:id]}")
	Comment.delete(@comm)
	Post.delete(params[:id])

	redirect to '/'
end