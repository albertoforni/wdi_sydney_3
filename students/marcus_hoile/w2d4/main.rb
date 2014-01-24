require 'sinatra'
require 'sinatra/reloader' if development?
require 'httparty'
require 'csv'

get '/' do
	if !params[:search].nil? && !params[:search].empty?
	# if params[:search].present?
		search = params[:search]
		@search_query = search
		if search.include?(" ")
			search.gsub!(" ","+")
		end
		omdb_search = HTTParty.get("http://www.omdbapi.com/?s=" + search)
		@no_result = omdb_search.downcase.include?("movie not found") == true

			
		if params[:lucky]
		elsif @no_result == false 
			movie_results = JSON[omdb_search]
			search_results = movie_results["Search"]
			if search_results.size == 1
				single_movie = search_results.first
				single_id = single_movie["imdbID"]
				redirect to '/movie/' + single_id

			else
			@titles_arr = []
			search_results.each do |movie|
			@titles_arr << [movie["Title"], movie["Year"], movie["imdbID"] ]
			end
		end

	end



		# i want the link to be http://www.omdbapi.com/?t=movie[title]&y=movie[year]

	end
	erb :search
end

get '/movie/:id'do
	# get the id from params and then use call omdb api
	imdb_id = params[:id]
	movie_details = HTTParty.get("http://www.omdbapi.com/?i=" + imdb_id)
	# convert from json format to a hash
	movie = JSON[movie_details]
	# retrieve the values for each key
	@poster = movie["Poster"]
	@title = movie["Title"]
	@year = movie["Year"]
	@genre = movie["Genre"]
	@plot = movie["Plot"]
	@imdb_rating = movie["imdbRating"]
	@actors = movie["Actors"]
	@imdbID = movie["imdbID"]
	
	# open the txt file and append
	history = File.new("history.txt", "r")
	# add a comma separated string to the txt file
	searched = history.readlines
	check_search = []
	searched.each do |line|
	check_search = line.split(', ')
end
	history.close
	history = File.new("history.txt", "a")


	if check_search.include?(movie["Title"]) == false
	history.puts "#{movie["Title"]}, #{movie["Year"]}, #{movie["imdbID"]}, #{movie["Poster"]}, #{movie["Genre"]}, #{movie["Plot"]}, #{movie["imdbRating"]}, #{movie["Actors"]}"
	end
	history.close


  erb :movie
end

get'/history' do
	history = File.new("history.txt", "r")
	@searched = history.readlines
	history.close
	# on the erb file for each row convert each value to its own string and put in array
	# then lookup each index



	

erb :history

end






