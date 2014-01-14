require 'sinatra'


get '/' do
  # home page
  'hello world'
end

get '/about' do
  erb :about
end

get '/add/:num1/:num2' do
  "#{params[:num1].to_i + params[:num2].to_i}"
end

get '/check_params/:something' do
  "params is a #{params.class}, it has #{params.inspect} - #{params[:something]}"
end



get '/name/:first/:last' do
  erb :name
end

get '/:operation/:num1/:num2' do
end

