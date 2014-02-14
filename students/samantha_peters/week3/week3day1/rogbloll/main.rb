require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_record'
require 'pg'

#connect to the database via AtiveRecord
ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :username => "Sammyjo",
  :database => "rogbloll"

  )


class Post < ActiveRecord::Base
    #validates :name, :presence => true, 

 has_many :comments

before_update :refresh_updated_at
before_create :set_created_at

  def refresh_updated_date
    self.updated_at = Time.now
  end

  def set_created_at
    self.created_at = Time.now
  end


end

class Comment < ActiveRecord::Base
 belongs_to :post
end

#display the homepage


get '/' do 
  @bestposts = Post.limit(3)

  erb :home  

end


get '/posts' do
  #set the value of sort to whatever is clicked (see layout.erb links) OR the default (created time)
  @sort = Post.order(:sort)
  @post = Post.all

  #==== NOT REMOVING AS SORT NOT WORKING YET ==#
  # @sort = params[:sort] || "created_at"
  # #get SQL to display the info from the posts table in the database, sorting by the variable @sort
  # sql = "SELECT * FROM posts ORDER BY #{@sort} ASC"
  # #whatever result comes from running the SQL, make it into the @post variable
  # @post = run_sql(sql)
  # #allow us to replace @id with the id that comes from the SQL...
  # @id = params[:id] 

  erb :listallposts
end

#get the 'create a post' page!

get '/posts/new' do
  erb :creatpost
end


#the action for creating a post
post '/posts' do
  Post.create(params[:post])
  redirect to '/'
end


#show me the SQL info Kthx
get '/posts/:id' do

  Post.joins(:comments)
  @post = Post.find_by_id(params[:id])
  @comments = @post.comments

erb :viewpost
end




#the action for creating a comment
post '/posts/:id/comments' do
  Comment.create(params[:comment])
  redirect to '/'
end

#modify the SQL data to delete tis post!
delete '/posts/:id' do
  todelete = Post.find(params[:id])
  todelete.delete
  redirect to '/'

end

#show me the form to edit an existing entry...
get '/posts/:id/edit' do
  @post = Post.find(params[:id])

  erb :editpost
end

#modify the information to edit the post
put '/posts/:id' do
  @post = Post.find(params[:id])
  @id = @post.id
  @post.update_attributes(params[:post])

  redirect to '/'
end

# This is the method to run our SQL Calls to our database "blog"
def run_sql(sql)
  #connect to the|db|
  conn = PG.connect(:dbname => 'rogbloll')


  #execute the db in the argument
  res = conn.exec(sql)

  #now close the db
  conn.close

  #now return the result of the query...
  res


    
  end