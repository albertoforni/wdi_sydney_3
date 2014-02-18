require 'sinatra'
require 'sinatra/reloader' if development? # allows you to reload web page immediately after changing main.rb without having to CTRL-C and start again in terminal


get '/' do 

    erb :index
end

get '/index' do 
    #raise "Error happened!"
	erb :index
end

get '/lukeschoen' do 

	erb :lukeschoen
end

get '/marcushoile' do 

	erb :marcushoile
end

get '/federicotagliabue' do 

	erb :federicotagliabue
end

get '/about' do 

	erb :about
end

get '/contact' do 
    #@recipient = params[:recipient]
    #@email = email[:recipient] 

	erb :contact
end

