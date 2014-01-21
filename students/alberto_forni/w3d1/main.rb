require 'sinatra'
require 'sinatra/reloader'
require 'active_support/all'
require 'pg'
require 'CGI'

set :method_override, true

before do
  @conn = PG.connect(:dbname => 'wdi_blog')
end

def exec_sql(sql)
  res = @conn.exec(sql)
  res
end

# home => show list
get '/' do
  redirect to '/posts'
end

# show list
get '/posts' do
  order_by = params[:sort] || 'created_at'

  #TODO check if sort parm is a column name

  sql = "SELECT * FROM posts ORDER BY #{order_by} DESC"
  @posts = exec_sql(sql)

  erb :list
end

# new form
get '/new' do

  erb :form
end

# new submit
post '/create' do
  title = CGI.escapeHTML(params[:title])
  abstract = CGI.escapeHTML(params[:abstract])
  body = CGI.escapeHTML(params[:body])
  author = CGI.escapeHTML(params[:author])
  created_at = Time.now
  sql = "INSERT INTO posts (title, abstract, body, author, created_at) VALUES ('#{title}', '#{abstract}', '#{body}', '#{author}', '#{created_at}')"
  exec_sql(sql)

  redirect to '/'
end

# display single post
get '/posts/:id' do
  id = CGI.escapeHTML(params[:id])

  sql = "SELECT * FROM posts WHERE id = #{id}"
  posts = exec_sql(sql)

  redirect to '/' if posts.ntuples == 0

  @post = posts[0]

  @post[:comments] = get_comments(id)

  erb :post
end

# edit post form
get '/posts/:id/edit' do
  id = CGI.escapeHTML(params[:id])
  sql = "SELECT * FROM posts WHERE id = #{id}"
  posts = exec_sql(sql)

  @post = posts[0]

  erb :form
end

# edit post submit
put '/posts/:id' do
  id = CGI.escapeHTML(params[:id])
  title = CGI.escapeHTML(params[:title])
  abstract = CGI.escapeHTML(params[:abstract])
  body = CGI.escape(params[:body])
  author = CGI.escapeHTML(params[:author])
  updated_at = Time.now
  sql = "UPDATE posts SET title = '#{title}', abstract = '#{abstract}', body = '#{body}', author = '#{author}', updated_at = '#{updated_at}' WHERE id = #{id}"
  exec_sql(sql)

  redirect to '/'
end

# delete post
delete '/posts/:id' do
  id = CGI.escapeHTML(params[:id])

  sql = "DELETE FROM posts WHERE id = #{id}"
  exec_sql(sql)

  redirect to '/'
end

# comments

# submit
post '/posts/:id/comments/create' do
  post_id = CGI.escapeHTML(params[:id])
  author = CGI.escapeHTML(params[:author])
  created_at = Time.now
  text = CGI.escapeHTML(params[:text])
  sql = "INSERT INTO comments (author, created_at, text, post_id) VALUES ('#{author}', '#{created_at}', '#{text}' , #{post_id})"
  exec_sql(sql)

  redirect to "/posts/#{post_id}"
end

def get_comments(post_id)
  sql = "SELECT * FROM comments WHERE post_id = #{post_id} ORDER BY id"
  exec_sql(sql)
end