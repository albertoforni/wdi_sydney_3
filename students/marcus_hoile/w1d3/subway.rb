# calculate the number of stops for a train journey


def journey
# create a hash with lines as keys and array of stops as values	
  n_line_arr = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
  l_line_arr = ["8th", "6th", "Union Square", "3rd", "1st"]
  six_line_arr = ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]

  subway = {
	  :n_line => n_line_arr,
	  :l_line => l_line_arr,
	  :six_line => six_line_arr
  }
  
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

#p stops_in_journey("8th", n_line_arr)
#p stops_in_journey("Times Square", n_line_arr)
# this is to capture the journey details

  # prompt user for starting line and station
	puts "What train line will you start on, N, L or 6? "
	line_start = gets.chomp.downcase
	puts

	# determine which line it is
	if line_start.include?("n")

		# pull station names from array and ask user for which station
		puts "Which station are you boarding the train? \n#{n_line_arr} "
		station_start = gets.chomp
		line_start = n_line_arr
		puts

	elsif line_start.include?("l")
		puts "Which station are you boarding the train? \n#{l_line_arr} "
		station_start = gets.chomp
		line_start = l_line_arr
		puts

	elsif line_start.include?("6")
		puts "Which station are you boarding the train? \n#{six_line_arr} "
		station_start = gets.chomp
		line_start = six_line_arr
		puts

	end

	# prompt user for ending line and station
	puts"What train line will you end on, N, L or 6? "
	line_end = gets.chomp.downcase
	puts

	if line_end.include?("n")
		puts "Which station are you getting off at? \n#{n_line_arr} "
		station_end = gets.chomp
		line_end = n_line_arr
		puts

	elsif line_end.include?("l")
		puts "Which station are you getting off at? \n#{l_line_arr} "
		station_end = gets.chomp
		line_end = l_line_arr
		puts

	elsif line_end.include?("6")
		puts "Which station are you getting off at? \n#{six_line_arr} "
		station_end = gets.chomp
		line_end = six_line_arr
		puts
	
	end

# look up the stops in the journey and concatenate
# stops_in_journey = stops_lookup(station_lookup(station_start), line_start) + stops_lookup(station_lookup(station_end), line_end)
# p stops_in_journey
# calculate the total stops

# if travelling on the same line the number of stops is the differential in array indexes
	  if line_start == line_end
	  	total_stops = line_start.index(station_lookup(station_start)) - line_end.index(station_lookup(station_end))

# the next 3 are for when union station is a start or end point in the journey	
# if union is one of the stops then you onlyu need to calculate the number of stops to other station  	
	  elsif
	  	station_start == station_end
	  	total_stops = 0

	  elsif station_start.include?("union")
	  	total_stops = stops_from_union(station_lookup(station_end), line_end)

	  elsif station_end.include?("union")
	  	total_stops = stops_from_union(station_lookup(station_start), line_start)

# when journey begins and ends on different lines you add the number of stops from union station
	  else
	  	total_stops = stops_from_union(station_lookup(station_start), line_start) + stops_from_union(station_lookup(station_end), line_end)

	  end

# total stops needs to be an absolute value
	total_stops = total_stops.abs

# list of stops in the journey
    stops_in_journey = stops_lookup(station_lookup(station_start), line_start, station_lookup(station_end), line_end)
    print_stops_in_journey = stops_in_journey.join(" => ")



# print out a different statement when the start and end station is the same
	if total_stops == 0
	  print "Hanging out at the station, ay?"
	  puts
	else
	  puts "-" * 60
	  puts "The total number of stops for your journey is #{total_stops}"
	  puts
	  puts "Your journey is #{print_stops_in_journey}"
	  puts "-" * 60
	  puts
	end

end


# added a loop for user to keep using function
answer = "y"

while answer.include?("y")
  journey
  puts	
  puts "Would you like to calculate the number of stops for another trip, Y or N? "
  answer = gets.chomp.downcase

end
# need to know if begin and end on same train line
# if end on different line, need to know how many stops from start to union + union to end
