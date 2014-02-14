# require 'rubygems' if RUBY_VERSION < '1.9'

require 'sinatra'
require_relative 'how_many_stops'
#if you have the sinatra-reloader gem use this to prevent having to reload the server each time
#require 'sinatra/reloader' if development?


#hash for the N-line - key is the literal name (which is matched by user input) and its' value is the stop distance from the intersection (union square)
	N = { "times" => 4, "34th" => 3, "28th" => 2, "23rd" => 1, "union" => 0, "8th" => -1 }

	#hash for L line
	L = { "8th" => 2, "6th" => 1, "union" => 0, "3rd" => -1, "1st" => -2 }

	#hash for Six line!
	S = {"grand" => 4, "33rd" => 3, "28th" => 2, "23rd" => 1, "union" => 0, "aston" => -1 }
	
	

get '/calc_form' do 
	@first = params[:first].to_i
	@second = params[:second].to_i
	@operation = params[:operation]
	
	@result = case @operation
	when 'sum' then @first + @second
	when 'subtraction' then @first - @second
	when 'product' then @first * @second
	when 'division' then @first / @second
	end

	#@result = how_many_stops("N","34th", "S", "grand" )

	erb :calc_form
end

get '/enter_stations' do
	@lineStart 		= params[:LineStart].to_s
    @lineFinish 	= params[:LineFinish].to_s
    @stationStart 	= params[:StationStart].to_s
	@stationFinish  = params[:StationFinish].to_s

	@result = how_many_stops(@lineStart,@stationStart,@lineFinish,@stationFinish )
    erb :enter_stations
end

	
