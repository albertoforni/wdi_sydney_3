require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'
require 'CGI'
require 'pry'
require 'pry-debugger'

before do 
  
end

get '/'  do 
  
  redirect to '/posts'

end

get '/posts' do

  sort = params[:sort] || "updated_at"



    if params[:sort] == "updated_at"
      sql = "SELECT * FROM blog ORDER BY #{sort} DESC"
    else params[:sort] == "title"
      sql = "SELECT * FROM blog ORDER BY #{sort} ASC"
    end
    @rows = run_sql(sql)


  erb :home
end

get '/posts/new' do ######
  
  # new.erb

  erb :new
end

get '/posts/:id' do #####
  sql = "SELECT * FROM blog WHERE id=#{params[:id]}"
  @records = run_sql(sql)
  @blog = @records[0]
  
  
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
  sql = "DELETE FROM blog WHERE id=#{params[:id]}"
  run_sql(sql)
  redirect to '/'
end

post '/posts' do
  
  title = CGI.escapeHTML(params[:title])
  description = CGI.escapeHTML(params[:description])
  body = CGI.escapeHTML(params[:body])
  author = CGI.escapeHTML(params[:author])
  created_at = Time.now
  sql = "INSERT INTO blog (title, description, body, author, created_at, updated_at) VALUES ('#{title}', '#{description}', '#{body}', '#{author}', '#{created_at}', '#{created_at}');"
  run_sql(sql)
  redirect to '/'
end

get '/posts/:id/edit' do
  sql = "SELECT * FROM blog WHERE id=#{params[:id]}"



  # sql = "UPDATE blog SET updated_at=NOW()"
  @records = run_sql(sql)
  @blog = @records[0]


  erb :edit
end

put '/posts/:id' do ####
  id = CGI.escapeHTML(params[:id])
  title = CGI.escapeHTML(params[:title])
  description = CGI.escapeHTML(params[:description])
  body = CGI.escapeHTML(params[:body])
  author = CGI.escapeHTML(params[:author])
  updated_at = Time.now
  sql = "UPDATE blog SET title = '#{title}', description = '#{description}',body = '#{body}', author = '#{author}', updated_at = '#{updated_at}' WHERE id =#{id};"
  run_sql(sql)
  redirect to '/'

end


post '/posts/:id/comments' do
  id = CGI.escapeHTML(params[:id])
  comments = CGI.escapeHTML(params[:comments])
  sql = "UPDATE blog SET comments = '#{comments} WHERE id = #{id};"
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