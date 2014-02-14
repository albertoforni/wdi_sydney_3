#hash for the N-line - key is the literal name (which is matched by user input) and its' value is the stop distance from the intersection (union square)
N = { "times" => 4, "34th" => 3, "28th" => 2, "23rd" => 1, "union" => 0, "8th" => -1 }

#hash for L line
L = { "8th" => 2, "6th" => 1, "union" => 0, "3rd" => -1, "1st" => -2 }

#hash for Six line!
S = {"grand" => 4, "33rd" => 3, "28th" => 2, "23rd" => 1, "union" => 0, "aston" => -1 }




def specialMessage(stops)
		if stops == 1
			puts "Your stop is next, get ready to alight the train!"
		elsif stops == 0
			puts "You aren't going anywhere. Why are you even looking at trains?!"
		elsif stops < 4
			puts "You've got #{stops} stops to go - not long now!"
		elsif stops > 4
			puts "You've got #{stops} stops to go. Perhaps a book will pass the time?"
		else
			"I couldn't figure out that calculation."
		end
end


#error if user enters the wrong line
class LineError < NoMethodError

end

#error if user enters the wrong station
class StationError < NoMethodError

end





def how_many_stops(lineStart, stationStart, lineFinish, stationFinish)

# the hashes I declare above use single character names (which ruby doesn't like to swap with variables)
# by using .clone, the variables lineStart or lineFinish will now become a copy of the relevant hash itself. 
# THis makes the hash data available whereever I declare Linestart or linefinish. AMAZEBALLS



	case lineStart
		when "N"
			lineStart = N.clone
		when "L"
			lineStart = L.clone
		when "S"
			linestart = S.clone
		else
			puts "Whoops! I don't know what line you mean."
	end

	case lineFinish
		when "N"
			lineFinish = N.clone
		when "L"
			lineFinish = L.clone
		when "S"
			lineFinish = S.clone
		else
			puts "Whoops! I don't know what line you mean."
	end


#check to make sure that the start and finish lines are the same.
	if lineStart == lineFinish
			#if so, use a particular formula to ensure we get a positive number
			result = (lineStart[stationStart] - lineFinish[stationFinish]).abs
			puts "DEBUG: Linestart value = (#{lineStart[stationStart]}) minus line finish value (#{lineFinish[stationFinish]}) = #{result}"
			#puts "You've got #{result} stops before you have to get off"
			specialMessage(result)

		else
			#otherwise, we use the opposite formula to allow us to count AHEAD or BACKWARDS from the intersection.
			result = lineStart[stationStart].abs + lineFinish[stationFinish].abs
			puts "DEBUG: Linestart value = (#{lineStart[stationStart]}) plus line finish value (#{lineFinish[stationFinish]}) = #{result}"
			#puts "You've got #{result} stops before you have to get off"
			specialMessage(result)

	end


end



##EXECUTE CODE HERE

continue_trains = true
while continue_trains == true

## Talk to the user, fool!!

	puts " "
	puts "What line is your first station at? (N) Line, (L) Line, (S)ix Line..."
	lineStart = gets.chomp.upcase!
	# if lineStart != ["N", "L", "S"]
	# 	raise LineError, "You didn't enter N, L or S. Try again!"



	puts " "
	puts "And what station is it?(enter the name)"
	stationStart = gets.chomp
	# rescue
	# 	puts "I couldn't figure out your trip. Did you enter the right station?"


	#get the sestination info.

	puts " "
	puts "On what line is your destination? (N) Line, (L) Line, (S)ix Line..."
	lineFinish = gets.chomp.upcase!
	# if lineFinish != ["N", "L", "S"]
	# 	raise LineError, "You didn't enter N, L or S. Try again!"




	puts " "
	puts "And what stop are you hopping off at? enter the name"
	stationFinish = gets.chomp
	# rescue
	# puts "I couldn't figure out your trip. Did you enter the right station?"



#run the method to get it all rolling!
how_many_stops(lineStart, stationStart, lineFinish, stationFinish)

	#once the method is done let the user decide if they wanna do another or quit
	puts "Want to calculate another trip?"
	puts "(Y)es (N)o"
	continue = gets.chomp.upcase


	contnue_trains = true unless continue != "Y"


end




