# calculate the number of stops for a train journey

require 'sinatra'
require 'sinatra/reloader' if development?


get '/journey_form' do


	#stops_in_journey = stops_lookup(station_start, line_start, station_end, line_end)
	#@print_stops = stops_in_journey.join(" => ")

	# create a hash with lines as keys and array of stops as values	
	n_line_arr = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
	l_line_arr = ["8th", "6th", "Union Square", "3rd", "1st"]
	six_line_arr = ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]


	# function to lookup what the station name is in the array
	def station_lookup(station)
		# convert user input to value in array
		n_line_arr = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
		l_line_arr = ["8th", "6th", "Union Square", "3rd", "1st"]
		six_line_arr = ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
		  
		if station.include?("times")
			station = ("Times Square")


		elsif station.include?("34")
			station = ("34th")

		elsif station.include?("33")
			station = ("33rd")

		elsif station.include?("28")
			station = ("28th")

		elsif station.include?("23")
			station = ("23rd")

		elsif station.include?("8")
			station = ("8th")

		elsif station.include?("6")
			station = ("6th")

		elsif station.include?("3")
			station = ("3rd")

		elsif station.include?("1")
			station = ("1st")


		elsif station.include?("grand") || station.include?("central")
			station = ("Grand Central")

		elsif station.include?("union")
			station = ("Union Square")


		elsif station.include?("astor") || station.include?("place")
			station = ("Astor Place")

		end

		return station
	end


	# calculate how many stops a station is from union the station is
	def stops_from_union(station, line)

		num_stops = line.index(station) - line.index("Union Square")
		num_stops.abs
	end

	# determine which line it is
	def line_lookup(line)
		n_line_arr = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
		l_line_arr = ["8th", "6th", "Union Square", "3rd", "1st"]
		six_line_arr = ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
		if line == ("n")
			line = n_line_arr

		elsif line == ("l")
			line = l_line_arr

		elsif line == ("6")
			line = six_line_arr
		end
	end

	# calculate the total stops
	def total_stops(line_start, station_start, line_end, station_end)
		# if travelling on the same line the number of stops is the differential in array indexes
	  if line_start == line_end
	  	total_stops = line_start.index(station_start) - line_end.index(station_end)

		# the next 3 are for when union station is a start or end point in the journey	
		# if union is one of the stops then you onlyu need to calculate the number of stops to other station  	
	  elsif
	  	station_start == station_end
	  	total_stops = 0

	  elsif station_start.include?("union")
	  	total_stops = stops_from_union(station_end, line_end)

	  elsif station_end.include?("union")
	  	total_stops = stops_from_union(station_start, line_start)

		# when journey begins and ends on different lines you add the number of stops from union station
	  else
	  	total_stops = stops_from_union(station_start, line_start) + stops_from_union(station_end, line_end)

	  end

		# total stops needs to be an absolute value
		total_stops = total_stops.abs
	end

	# this will output the stops in the journey
	def stops_lookup(station1, line1, station2, line2)
	  journey_array = []
	  index_start = line1.index(station1)
	  index_end = line2.index(station2)
	  index_union_start = line1.index("Union Square")
	  index_union_end = line2.index("Union Square")


		if line1 == line2 && index_start < index_end
			index_start.upto(index_end) { |s| journey_array.push(line1[s]) }

		elsif line1 == line2 && index_start > index_end
			index_start.downto(index_end) { |s| journey_array.push(line1[s]) }

		elsif index_start <= index_union_start && index_union_end <= index_end
			index_start.upto(index_union_start - 1) { |s| journey_array.push(line1[s]) }
			index_union_end.upto(index_end) { |s| journey_array.push(line2[s]) }

		elsif index_start >= index_union_start && index_union_end <= index_end
			index_start.downto(index_union_start + 1) { |s| journey_array.push(line1[s]) }
			index_union_end.upto(index_end) { |s| journey_array.push(line2[s]) }

		elsif index_start >= index_union_start && index_union_end >= index_end
			index_start.downto(index_union_start + 1) { |s| journey_array.push(line1[s]) }
			index_union_end.downto(index_end) { |s| journey_array.push(line2[s]) }

		elsif index_start <= index_union_start && index_union_end >= index_end
			index_start.upto(index_union_start - 1) { |s| journey_array.push(line1[s]) }
			index_union_end.downto(index_end) { |s| journey_array.push(line2[s]) }
		end
	  journey_array
    
	end


	if params[:line_start] != nil
		line_start = params[:line_start]
		station_start = params[:station_start]
		line_end = params[:line_end]
		station_end = params[:station_end]

		# lookup the station and line names
		line_start_lookup = line_lookup(line_start)
		station_start_lookup = station_lookup(station_start)
		line_end_lookup = line_lookup(line_end)
		station_end_lookup = station_lookup(station_end)

		# use the result and pass through the methods
		@num_of_stops = total_stops(line_start_lookup, station_start_lookup, line_end_lookup, station_end_lookup)
		stops_in_journey = stops_lookup(station_start_lookup, line_start_lookup, station_end_lookup, line_end_lookup)
		@print_stops_in_journey = stops_in_journey.join(" => ")
	else
		@num_of_stops = 0
	end

	

	erb :journey_form

 end
 










