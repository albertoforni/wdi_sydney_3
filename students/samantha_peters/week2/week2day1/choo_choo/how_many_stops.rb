# These are all local variables in this function.
# not to be confused with the globals @lineStart, @stationStart, @lineFinish, @stationFinish referenced in main.rb!!!

def how_many_stops(lineStart, stationSt, lineFinish, stationFin)

# the hashes I declare above use single character names (which ruby doesn't like to swap with variables)
# by using .clone, the variables lineStart or lineFinish will now become a copy of the relevant hash itself. 
# THis makes the hash data available whereever I declare Linestart or linefinish. AMAZEBALLS


# sinatra doesn't like when we re-assign types to a variable it seems....
# create new var names to hold clones of the global hashes: lineFr and lineEnd
	case lineStart
		when "N"
			lineFr = N.clone
		when "L"
			lineFr = L.clone
		else 
			lineFr = S.clone	# default case "S"
	end

	case lineFinish
		when "N"
			lineEnd = N.clone
		when "L"
			lineEnd = L.clone
		else 
			lineEnd = S.clone	#default case "S" 
	end

puts "DEBUG: #{lineFr} and #{lineEnd} and #{stationSt} and #{stationFin}"
# simple sanity checks on the stations.
# not required on the lines, since they are selected from drop-down lists :)
	if !lineFr.has_key?(stationSt) 
		result = "<Start Station doesn't exist!>"
	elsif !lineEnd.has_key?(stationFin)
		result = "<Finish Station doesn't exist!>"

#check to make sure that the start and finish lines are the same.
	elsif lineStart == lineFinish
			#if so, use a particular formula to ensure we get a positive number
			puts "The lines are the same...."
			result = (lineFr[stationSt] - lineEnd[stationFin]).abs
			#puts "DEBUG: Linestart value = (#{lineStart[stationStart]}) minus line finish value (#{lineFinish[stationFinish]}) = #{result}"
	else
			#otherwise, we use the opposite formula to allow us to count AHEAD or BACKWARDS from the intersection.
ß
			result = lineFr[stationSt].abs + lineEnd[stationFin].abs
			#puts "DEBUG: Linestart value = (#{lineStart[stationStart]}) plus line finish value (#{lineFinish[stationFinish]}) = #{result}"
	end
end

