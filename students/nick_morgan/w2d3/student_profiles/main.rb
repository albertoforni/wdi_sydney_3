require "sinatra"
require "sinatra/reloader" if development?

get '/index' do
  erb :index
end

get '/about' do
  erb :about
end

get '/nick' do
  erb :nick
end

get '/lauren' do
  erb :lauren
end

get '/ed' do
  erb :ed
end

get '/sam' do
  erb :sam
end

get '/contact' do
  erb :contact
end