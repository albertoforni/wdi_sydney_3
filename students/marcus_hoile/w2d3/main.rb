require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
	
  erb :home
end

get '/about' do

	erb :about
end

post '/contact' do

	# @email_receive = params[:email]
	# @name = params[:name]
	# @recipient = params[:dropmenu]
	# @message = params[:message]

erb :contact
end

post '/form' do

erb :form
end

get '/students/marcus' do

	erb :"students/marcus"
end