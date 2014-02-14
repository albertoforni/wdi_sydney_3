require 'sinatra'
require 'sinatra/reloader' if development?
require 'httparty'
# require 'active_support/all'


get '/' do
    if !params[:movie].nil? && !params[:movie].empty?
        @result = JSON[HTTParty.get("http://www.omdbapi.com/?t="+params[:movie].gsub(/ /, '+'))]
    else
        @result = {}
    end
    erb :movie
end
