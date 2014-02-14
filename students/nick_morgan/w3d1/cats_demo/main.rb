require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'

before do

end

get '/'  do 
  sql = "SELECT * FROM CATS"
  @rows = run_sql(sql)
  erb :home
end

get '/new' do
 
  # new.erb

  erb :new
end

get '/cats/:id/edit' do
  sql = "SELECT * FROM cats WHERE id=#{params[:id]}"
  @records = run_sql(sql)
  @cat = @records[0]
  
  
  erb :edit
end

post '/cats/:id' do
  #update the record
  #first you need the sql
  sql = "UPDATE cats set name='#{params[:name]}', photo='#{params[:photo]}', breed='#{params[:breed]}' WHERE id = #{params[:id]}"
  run_sql(sql)
  redirect to '/'
end

post '/cats/:id/delete' do
  sql = "DELETE FROM cats WHERE id=#{params[:id]}"
  run_sql(sql)
  redirect to '/'
end

post '/create' do
  name = params[:name]
  photo = params[:photo]
  breed = params[:breed]
  sql = "INSERT INTO cats (name, photo, breed) VALUES ('#{name}', '#{photo}', '#{breed}');"
  run_sql(sql)
  redirect to '/'
end

def run_sql(sql)
  conn = PG.connect(:dbname => 'cats')
  #connect to the cats db

  res = conn.exec(sql)
  #exec the sql in the argument
  
  conn.close
  #close the db connection
  #return the result of the sql
  res
end