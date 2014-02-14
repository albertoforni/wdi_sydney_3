require "sinatra"
require "sinatra/reloader" if development?
require "httparty"
require "active_support/all"
require "uri"


get '/' do

  @list = []

  if params[:title].present?
    # imdb_id = URI.escape(params[:id])
  

    movie_name = URI.escape(params[:title])

    # @movie = JSON.parse(HTTParty.get("http://www.omdbapi.com/?t=#{movie_name}&i="))

    

    list = JSON.parse(HTTParty.get("http://www.omdbapi.com/?s=#{movie_name}&i="))

    @list = list["Search"] #.each { |title| title = "Title" }


  end

  erb :index

end

get '/movies/:title' do

    movie_name = URI.escape(params[:title])

    # @movie = JSON.parse(HTTParty.get("http://www.omdbapi.com/?t=#{movie_name}&i="))

    

    @movie = JSON.parse(HTTParty.get("http://www.omdbapi.com/?t=#{movie_name}&i="))

  erb :index
end
