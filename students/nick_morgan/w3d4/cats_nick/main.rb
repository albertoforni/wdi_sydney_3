require 'sinatra'
require 'pry'
require 'pry-debugger'
require 'sinatra/reloader' if development?

require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :username => "nicholasmorgan",
  :database => "cats"
  )

class Cat < ActiveRecord::Base
end

# binding.pry

get '/' do
  redirect to '/cats'
end

get '/cats'  do
  @cats = Cat.all

  erb :home
end

get '/cats/new' do
  

  erb :new
end


post '/cats' do
  Cat.create(params[:cat].merge(:created_at => Time.new))
  redirect to '/'

end


