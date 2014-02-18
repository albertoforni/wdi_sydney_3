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

end

class Comment < ActiveRecord::Base

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
	Post.create(:title => params[:title], :abstract => params[:abstract], :body_text => params[:body_text], :author => params[:author], :created_at => Time.now)

	redirect to '/'
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

	Comment.create(:comment => params[:comment], :author => params[:author], :created_at => Time.now, :post_id => params[:id])

	redirect to '/'
end

################ DELETE POST ##################
delete '/posts/:id' do

	@comm = Comment.where("post_id = #{params[:id]}")
	Comment.delete(@comm)
	Post.delete(params[:id])

	redirect to '/'
end