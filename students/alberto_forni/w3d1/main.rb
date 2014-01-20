require 'sinatra'
require 'sinatra/reloader'
require 'active_support/all'
require 'pg'

def exec_sql(sql)
  conn = PG.connect(:dbname => 'wdi_blog')
  res = conn.exec(sql)
  conn.close
  res
end

get '/' do
  sql = "SELECT * FROM posts"
  @posts = exec_sql(sql)

  erb :list
end

get '/new' do

  erb :form
end

post '/create' do
  title = params[:title]
  abstract = params[:abstract]
  body = params[:body]
  author = params[:author]
  created_at = Time.now
  sql = "INSERT INTO posts (title, abstract, body, author, created_at) VALUES ('#{title}', '#{abstract}', '#{body}', '#{author}', '#{created_at}')"
  exec_sql(sql)

  redirect to '/'
end

get 'posts/:id' do
  id = params[:id]
  sql = "SELECT * FROM posts WHERE id = #{id}"
  posts = exec_sql(sql)

  @post = posts[0]

  erb :post
end

get '/posts/:id/edit' do
  id = params[:id]
  sql = "SELECT * FROM posts WHERE id = #{id}"
  posts = exec_sql(sql)

  @post = posts[0]

  erb :form
end

post '/posts/:id' do
  id = params[:id]
  title = params[:title]
  abstract = params[:abstract]
  body = params[:body]
  author = params[:author]
  created_at = Time.now
  sql = "UPDATE posts SET title = '#{title}', abstract = '#{abstract}', body = '#{body}', author = '#{author}' WHERE id = #{id}"
  exec_sql(sql)

  redirect to '/'
end

post '/posts/:id/delete' do
  id = params[:id]

  sql = "DELETE FROM posts WHERE id = #{id}"
  exec_sql(sql)

  redirect to '/'
end