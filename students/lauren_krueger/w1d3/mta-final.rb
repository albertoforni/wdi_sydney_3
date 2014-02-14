# MTA Homework
# The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip.

require 'pry'
require 'pry-debugger'

# arrays of stations and stops, inside subway hash below

subway = {}

subway['n'] = ["ts", "34th", "28th-n", "23rd-n", "usq", "8th-n"]
subway['l'] = ["8th-l", "6th", "usq", "3rd", "1st"]
subway['s'] = ["gc", "33rd", "28th-s", "23rd-s", "usq", "astor"]


# First prompt user to choose a train line
puts "What train line are you taking today? The (n), (l), or (s)ix?"
start_train = gets.chomp

case start_train
	when "n"
		puts "Choose a station: ts, 34th, 28th-n, 23rd-n, usq, or 8th-n"
	when "l"
		puts "Choose a station: 8th-l, 6th, usq, 3rd, or 1st"
	when "s"
		puts "Choose a station: gc, 33rd, 28th-s, 23rd-s, usq, or astor"
end

start_station = gets.chomp

puts "What train line do you want to get off on? The (n), (l), or (s)ix?"
end_train = gets.chomp

case end_train
	when "n"
		puts "Choose a station: ts, 34th, 28th-n, 23rd-n, usq, or 8th-n"
	when "l"
		puts "Choose a station: 8th-l, 6th, usq, 3rd, or 1st"
	when "s"
		puts "Choose a station: gc, 33rd, 28th-s, 23rd-s, usq, or astor"
end


puts "Where do you want to get off?"
end_station = gets.chomp

if start_train == end_train
	start_index = subway[start_train].index(start_station)
	end_index = subway[end_train].index(end_station)

	number_of_stops = (end_index.to_i - start_index.to_i).abs # abs to absolute value

	list_stations = subway[start_train][start_index..end_index]

	puts "You will be traveling #{number_of_stops} stops and going through #{list_stations} stations."

else
	start_index = subway[start_train].index(start_station)
	end_index = subway[start_train].index("usq")
	second_index = subway[end_train].index("usq")
	second_end_index = subway[end_train].index(end_station)

	total_stops = (end_index.to_i - start_index.to_i).abs
	total_stops += (second_index.to_i - second_end_index.to_i).abs


	 # puts start_index
	 # puts end_index 
	 # puts second_index
	 # puts second_end_index

	list_stations = subway[start_train][start_index..end_index]
	list_stations += subway[end_train][second_index..second_end_index]

	puts "You will be traveling #{total_stops} stops and going through #{list_stations} stations."
end

# The end station will be union Square
# Find the index of starting point to union square, then index from union square to end point (when intersecting lines)
# array of first to union square, then array of stops from union square to end point
# can combine the two arrays