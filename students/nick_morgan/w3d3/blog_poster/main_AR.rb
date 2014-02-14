require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'
require 'CGI'
require 'pry'
require 'pry-debugger'

require 'active_record'
require 'active_record/validations'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :username => "nicholasmorgan",
  :database => "blog"
  )

class Blog < ActiveRecord::Base
  validates :title, :author, :presence => true,
    :uniqueness => true,
    :length => {:in => 2..255} #, :message => "%value is a crappy name, try again
    

  validates :body, :author, presence: true

end

class Comment <ActiveRecord::Base
  validates :body, :author, :presence => true,
    :length => { minimum: 2 }

end

get '/' do 
  
  redirect to '/posts'

end

get '/posts' do

  sort = params[:sort] || "updated_at"

  @sortdir = params[:sortdir] || :desc

  @blogs = Blog.order(sort => @sortdir.to_sym).all

  @sortdir = (@sortdir == "desc") ? "asc" : "desc"

  erb :home
end

get '/posts/new' do ######
  
  # new.erb
  @blog = Blog.new

  erb :new
end

post '/posts/new' do
  Blog.create(params[:blog])
  redirect to '/'
end

get '/posts/:id' do #####
  # sql = "SELECT * FROM blogs WHERE id=#{params[:id]}"
  # @records = run_sql(sql)
  # @blogs = @records[0]
  
  @blog = Blog.find(params[:id])
  #the params[] command makes a hash


  @comments = Comment.where(:blog_id => params[:id])

  @comment = Comment.new
  
  erb :show
end

# post '/blog/:id' do
#   #update the record
#   #first you need the sql
#   sql = "UPDATE blog set title='#{params[:title]}', description='#{params[:description]}', body='#{params[:body]}', author='#{params[:author]}' WHERE id = #{params[:id]}"
#   run_sql(sql)
#   redirect to '/'
# end

delete '/posts/:id' do ####
  # sql = "DELETE FROM blogs WHERE id=#{params[:id]}"
  # run_sql(sql)
  blog = Blog.find(params[:id])
  blog.delete
  redirect to '/'
end

# post '/posts' do
  
#   title = CGI.escapeHTML(params[:title])
#   description = CGI.escapeHTML(params[:description])
#   body = CGI.escapeHTML(params[:body])
#   author = CGI.escapeHTML(params[:author])
#   created_at = Time.now
#   sql = "INSERT INTO blogs (title, description, body, author, created_at, updated_at) VALUES ('#{title}', '#{description}', '#{body}', '#{author}', '#{created_at}', '#{created_at}');"
#   run_sql(sql)
#   redirect to '/'
# end

get '/posts/:id/edit' do
  # sql = "SELECT * FROM blogs WHERE id=#{params[:id]}"



  # # sql = "UPDATE blogs SET updated_at=NOW()"
  # @records = run_sql(sql)
  # @blog = @records[0]

  @blog = Blog.find(params[:id])



  erb :edit
end

put '/posts/:id' do ####
  # id = CGI.escapeHTML(params[:id])
  # title = CGI.escapeHTML(params[:title])
  # description = CGI.escapeHTML(params[:description])
  # body = CGI.escapeHTML(params[:body])
  # author = CGI.escapeHTML(params[:author])
  # updated_at = Time.now
  # sql = "UPDATE blogs SET title = '#{title}', description = '#{description}',body = '#{body}', author = '#{author}', updated_at = '#{updated_at}' WHERE id =#{id};"
  # run_sql(sql)
  @blog = Blog.find(params[:id])



  if @blog.update_attributes(params[:blog])
    redirect to '/'
  else
    erb :edit
  end



end


post '/posts/:id/comments' do
  # id = CGI.escapeHTML(params[:id])
  # comments = CGI.escapeHTML(params[:comments])
  # sql = "UPDATE blogs SET comments = '#{comments}' WHERE id = #{id};"
  # run_sql(sql)
  @comment = Comment.create(params[:comment])
  redirect to "/posts/#{params[:id]}"
end

delete '/posts/:post_id/comments/:comment_id' do
  @comment = Comment.find(params[:comment_id])
  @comment.delete
  redirect to "/posts/#{params[:post_id]}"
end

def run_sql(sql)
  conn = PG.connect(:dbname => 'blog')
  #connect to the cats db

  res = conn.exec(sql)
  #exec the sql in the argument
  
  conn.close
  #close the db connection
  #return the result of the sql
  res
end