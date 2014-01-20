require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'


get '/' do
  sql = "SELECT * FROM CATS"
  @rows = run_sql(sql)
  erb :home
end

get '/new' do
  # new.erb
  erb :new
end

post '/create' do
  sql = "INSERT INTO CATS (name, photo, breed), values ('#{params[:name]}', '#{params[:photo]}', '#{params[:breed]}');"
  run_sql(sql)
    
end

def run_sql(sql)
  # connect to the cats db
  conn = PG.connect(:dbname => 'cats')
  # exec the sql in the argument
  res = conn.exec(sql)
  # close the db connection
  conn.close
  # return the result of the sql
  res
end


