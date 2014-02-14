require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do 
    erb :home 
end

get '/students/alberto' do 
    erb :"/students/alberto"
end

get '/students/pranava' do 
    erb :"/students/pranava"
end

get '/students/emily' do 
    erb :"/students/emily"
end

get '/students/luke' do 
    erb :"/students/luke"
end

get '/contact' do
    erb :"contact"
end

get '/about' do
    erb :"about"
end

not_found do

    erb :"404"
end