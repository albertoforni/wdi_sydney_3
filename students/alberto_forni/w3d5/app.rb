require 'rubygems'
require 'sinatra'
require 'active_record'

if development?
  require 'sinatra/reloader'
  require 'pry'
  require 'pry-debugger'
end

dev_db_settings = {
  :adapter => 'postgresql',
  :database => 'shelters',
  :encoding => 'utf8'
}
 
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || dev_db_settings)

require './models/shelters'

get '/' do
  
end

get '/shelters' do
  @shelters = Shelder.all
end