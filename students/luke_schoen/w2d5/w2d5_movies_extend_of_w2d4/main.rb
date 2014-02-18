require 'sinatra'
require 'sinatra/reloader' if development?
require 'yahoofinance'
require 'active_support/all'
require 'httparty'
require 'uri'
require "./movie_file.rb"
#require "./history.erb"

get '/' do 

    erb :display_movie_list
end

post '/display_movie' do 

    movie_name_mod = params[:movie_name] #string
    @movie_name = movie_name_mod.gsub(/[' ']/, '+').capitalize
    
    if params[:movie_name].present? # irb requires 'active_support/all' to run this 
        url_mod = "http://www.omdbapi.com/?i=&t=" + @movie_name
        url_buffer = HTTParty.get(url_mod)
        #@test = response[0]
        # url_hash.class ---> shows that it is of type HTTParty::Response and must be converted to hash
        url_hash = JSON.parse(url_buffer) # uses Ruby to convert to hash
        @movie_year = JSON.parse(url_buffer)["Year"] # access value of year directly
        @display_movie = url_buffer
    end

    erb :display_movie
end

get '/display_movie_list' do 
    ############################
    #  
    #   TO RUN TYPE IN BROWSER (DUE TO 'GET'):
    #   http://localhost:4567/display_movie_list?movie_name=matrix
    #
    ############################
    movie_name_mod = params[:movie_name] #string
    @movie_name = movie_name_mod.gsub(/[' ']/, '+').capitalize
    
    if params[:movie_name].present? 
        url_mod = "http://www.omdbapi.com/?s=" + @movie_name + "&tomatoes=true" 
        url_buffer = HTTParty.get(URI.escape(url_mod))
        url_hash = JSON.parse(url_buffer)
        @movie_poster = JSON.parse(url_buffer)["Poster"] # access image of movie directly
        #temp = DisplayMovieList.new(url_hash)
        @display_movie_list = url_hash["Search"] 
        update_history = MovieFile.new(@display_movie_list) 
        update_history.create_movie(@display_movie_list)
        #temp.display_movie_list(url_hash)
        #@display_movie = url_buffer
        #@display_movie_list = DisplayMovieList.new(url_hash)
    end

    erb :display_movie_list
end

post '/history' do 

	erb :history
end


=begin
class DisplayMovieList
    attr_accessor :url_hash

    def initialize (url_hash)
        @url_hash = url_hash

    end

    def display_movie_list(url_hash)
        @url_hash = url_hash
        return @url_hash
    end
end
=end



















