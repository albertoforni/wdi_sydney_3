require "sinatra"
require "sinatra/reloader" if development?
require 'Haml'
require 'active_support/all'
require 'httparty'
require 'uri'

before do
  @visited_movies_file = 'visited_movies.json'
  @movies_history = load_movies
end

helpers do
  # get a single movie
  def get_movie(movie_id)
    
    if @movies_history[movie_id] == nil
      # insert the movie in the history
      movie =  JSON.parse(HTTParty.get("http://www.omdbapi.com/?i=#{movie_id}"))
      save_movie(movie)
    else
      # take the movie out of the list
      movie = @movies_history[movie_id]
    end

    movie
  end

  # save movie history
  def save_movie(movie)
    @movies_history[movie["imdbID"]] = movie
    File.open(@visited_movies_file, 'w') do |f|
      f.write(JSON.generate(@movies_history))
    end
  end

  # load movie history
  def load_movies
    json = File.read(@visited_movies_file)

    if json.empty?
      {}
    else
      JSON.parse(json)
    end
  end

end

# display list of movie or single movie or history
get "/" do
  @movies = []
  
  # form subscription
  if params[:title].present?
    movie_name = URI.escape(params[:title])
    @movies = JSON.parse(HTTParty.get("http://www.omdbapi.com/?s=#{movie_name}"))["Search"] || []

    # if there is just 1 movie or the users checked the "I'm feel lucky option" show the movie
    if @movies.size == 1 || params[:lucky] == "t"
      @movie = get_movie(@movies[0]["imdbID"])

      return haml :movie
    end

    return haml :list
  end

  haml :history
end

# dispaly a movie
get "/movie/:movie_id" do
  redirect '/' unless params[:movie_id].present?

  movie_id = params[:movie_id]

  @movie = get_movie(movie_id)

  haml :movie
end

# show history
get "/history" do

  haml :history
end
