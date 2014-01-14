require 'sinatra'
require 'sinatra/reloader' if development?
require './subway_system'


get '/subway_input' do
	erb :subway_input
end

get '/subway_dropdown' do
	erb :subway_dropdown
end

post '/subway_dropdown' do

	# subway hash with Lines as keys and array_of_stops as values
	subway_hash = {"N" =>['TimeSquare','34th','28th','23rd','UnionSquare','8th'],
			   "L" =>['8th','6th','UnionSquare','3rd','1st'],
			   "6L"=>['GrandCentral','33rd','28th','23rd','UnionSquare','Astorplace'] }

	line_source = params[:srcline]
	stop_source = params[:srcstop]
	line_dest = params[:destline]
	stop_dest = params[:deststop]

	intersection = "UnionSquare"
	
	if params != nil 
		subway = Subway.new(line_source,stop_source,line_dest,stop_dest,subway_hash,intersection)
		@result = subway.calculate_route
    end


	erb :subway_dropdown
end

post '/subway_input' do
	# subway hash with Lines as keys and array_of_stops as values
	subway_hash = {"N" =>['TimeSquare','34th','28th','23rd','UnionSquare','8th'],
			   "L" =>['8th','6th','UnionSquare','3rd','1st'],
			   "6L"=>['GrandCentral','33rd','28th','23rd','UnionSquare','Astorplace'] }

	line_source = params[:srcline]
	stop_source = params[:srcstop]
	line_dest = params[:destline]
	stop_dest = params[:deststop]

	intersection = "UnionSquare"
	
	if params != nil 
		subway = Subway.new(line_source,stop_source,line_dest,stop_dest,subway_hash,intersection)
		@result = subway.calculate_route
    end


	erb :subway_input

end