require "sinatra"
require "sinatra/reloader" if development?
require 'Haml'
require 'active_support/all'
require 'httparty'
require 'uri'

helpers do
  def get_movie(movie_titile)
    movie_name = URI.escape(movie_titile)
    JSON.parse(HTTParty.get("http://www.omdbapi.com/?t=#{movie_name}"))
  end
end

get "/" do
  @movies = []
  
  if params[:title].present?
    movie_name = URI.escape(params[:title])
    @movies = JSON.parse(HTTParty.get("http://www.omdbapi.com/?s=#{movie_name}"))["Search"]
  end

  if @movies.size == 1 || params[:lucky] == "t"
    @movie = get_movie(@movies[0]["Title"])
    @movies = nil
  end

  haml :index
end

get "/movie/:movie_title" do
  @movie = get_movie(params[:movie_title]) if params[:movie_title].present?

  haml :index
end
