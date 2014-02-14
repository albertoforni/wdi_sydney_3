require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'
require 'CGI'

before do 
  
end

get '/'  do 
  sql = "SELECT * FROM blog"
  @rows = run_sql(sql)
  erb :home
end

get '/new' do
 
  # new.erb

  erb :new
end

get '/blog/:id/show' do
  sql = "SELECT * FROM blog WHERE id=#{params[:id]}"
  @records = run_sql(sql)
  @blog = @records[0]
  
  
  erb :show
end

post '/blog/:id' do
  #update the record
  #first you need the sql
  sql = "UPDATE blog set title='#{params[:title]}', description='#{params[:description]}', body='#{params[:body]}', author='#{params[:author]}' WHERE id = #{params[:id]}"
  run_sql(sql)
  redirect to '/'
end

post '/blog/:id/delete' do
  sql = "DELETE FROM blog WHERE id=#{params[:id]}"
  run_sql(sql)
  redirect to '/'
end

post '/create' do
  title = CGI.escapeHTML(params[:title])
  description = CGI.escapeHTML(params[:description])
  body = CGI.escapeHTML(params[:body])
  author = CGI.escapeHTML(params[:author])
  created_at = Time.now
  sql = "INSERT INTO blog (title, description, body, author) VALUES ('#{title}', '#{description}', '#{body}', '#{author}');"
  run_sql(sql)
  redirect to '/'
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