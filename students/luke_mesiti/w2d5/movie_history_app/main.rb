require 'sinatra'
require 'sinatra/reloader' if development?
require 'httparty'
# require 'active_support/all'

helpers do
    def return_movie(title)
        JSON[HTTParty.get("http://www.omdbapi.com/?t="+title.gsub(/ /, '+'))]
    end

    def movie_history
        @movie_history = {}

    end


end

get '/' do
    if !params[:movie].nil? && !params[:movie].empty?
        @result = JSON[HTTParty.get("http://www.omdbapi.com/?s="+params[:movie].gsub(/ /, '+'))]
    else
        @result = {}
    end
    erb :movie_list
end

get '/movie/:id' do
        @single_movie = JSON[HTTParty.get("http://www.omdbapi.com/?t="+params[:id].gsub(/ /, '+'))]

        File.open("history.csv", "a") do |file|
            file.puts "#{@single_movie['Title']}, #{@single_movie['Poster']}"
        end

    erb :movie
end

get '/history' do

    erb :history
end
