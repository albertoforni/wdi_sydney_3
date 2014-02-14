require 'sinatra'
require 'sinatra/reloader' if development?
require 'HTTParty'
require 'active_support/all'
require 'json'





get '/' do 
  if params[:movie].present?
    
    ##WORKING CODE FOR EXACT MATCH SEARCH
    # @movie = params[:movie].downcase
    # @movie.to_s.gsub!(/[[:space:]]/, "+") 
    # puts "The movie result is #{@movie.to_s}"
    # @searchresult = JSON(HTTParty.get("http://www.omdbapi.com/?t=" + "#{@movie.to_s}")) 



    @movie = params[:movie].downcase
    @movie.to_s.gsub!(/[[:space:]]/, "+") 
    @searchlist = JSON(HTTParty.get("http://www.omdbapi.com/?s=" + "#{@movie.to_s}"))






  end

  erb :index
end

get '/results' do
    
  if params[:movie].present?
    
    ##WORKING CODE FOR EXACT MATCH SEARCH
    # @movie = params[:movie].downcase
    # @movie.to_s.gsub!(/[[:space:]]/, "+") 
    # puts "The movie result is #{@movie.to_s}"
    # @searchresult = JSON(HTTParty.get("http://www.omdbapi.com/?t=" + "#{@movie.to_s}")) 


    @movie = params[:movie].downcase
    @movie.to_s.gsub!(/[[:space:]]/, "+") 
    @searchlist = JSON(HTTParty.get("http://www.omdbapi.com/?s=" + "#{@movie.to_s}"))


    if @searchlist["Search"].size.to_i == 1
      puts "Number of results for this term is #{@searchlist["Search"].size}"
      @movieid = @searchlist["Search"][0]["imdbID"]
      redirect to "/id/#{@movieid}"
    else
      erb :results
    end
  else
    erb :results
  end


end

get '/id/:movieid' do

    @movieid = params[:movieid]
    @searchlist = JSON(HTTParty.get("http://www.omdbapi.com/?i=" + "#{@movieid.to_s}"))

  erb :id
end
