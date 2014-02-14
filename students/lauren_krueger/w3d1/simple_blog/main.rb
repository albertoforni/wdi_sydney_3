require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'



get '/' do
redirect to '/posts'
end

get '/posts' do # lists all of the blog posts
  if params[:sort]
    sql = "SELECT * FROM posts ORDER BY #{params[:sort]} ASC"
  else
    sql = "SELECT * FROM posts ORDER BY created_at DESC"    
  end

  @rows = run_sql(sql)
  erb :home
end

get '/posts/new' do # goes to the form to create a new blog post
  erb :new
end

get '/posts/:id' do 
  sql = "SELECT * FROM posts WHERE id=#{params[:id]}"
  @archive = run_sql(sql)
  @post = @archive[0]

  sql = "select * from comments where post_id=#{params[:id]}"
  @comments = run_sql(sql)
  erb :posts
end


post '/posts' do
  sql = "INSERT INTO posts (title, description, body_text, author, created_at) values ('#{params[:title]}', '#{params[:description]}', '#{params[:body_text]}', '#{params[:author]}', '#{Time.now}');"
  run_sql(sql)
  redirect to '/posts'
end

get '/posts/:id/edit' do
  sql = "SELECT * FROM posts WHERE id=#{params[:id]}"
  @archive = run_sql(sql)
  @post = @archive[0]
  erb :edit
end

post '/posts/:id' do
  sql = "UPDATE posts set title = '#{params[:title]}', description = '#{params[:description]}', body_text = '#{params[:body_text]}', author = '#{params[:author]}', updated_at = '#{Time.now}' WHERE id = #{params[:id]}"

  run_sql(sql)
  redirect to '/posts'
end

post '/posts/:id/delete' do
  sql = "DELETE FROM posts WHERE id = #{params[:id]}"
  run_sql(sql)
  redirect to '/'
end

post '/posts/:id/comments' do
  sql = "INSERT INTO comments (comment, post_id, author, created_at) values ('#{params[:comment]}', '#{params[:post_id]}', '#{params[:author]}', '#{Time.now}');"
  run_sql(sql)
  redirect to "/posts/#{params[:id]}"
end

def run_sql(sql)
  # connect to the lukrublog database
  conn = PG.connect(:dbname => 'lukrublog')
  # execute the sql in the argument
  res = conn.exec(sql)
  # close the database connection
  conn.close
  # return the result of the sql
  res
end