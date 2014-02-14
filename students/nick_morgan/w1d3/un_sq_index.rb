n = ["nts", "n34", "n28", "n23", "unsq", "n8"]

l = ["l8", "l6", "unsq", "l3", "l1"]

six = ["gc", "6_33", "6_28", "6_23", "unsq", "ap"]

puts "Starting line? (n) (l) (6)"

line_start = gets.chomp

case line_start
	when "n"
		stops = n
	when "l"
		stops = l
	when "6"
		stops = six
	end

puts "Start point? #{stops}"

start = gets.chomp
	
start_index = stops.index(start)

puts "Finishing line? (n) (l) (6)"

line_finish = gets.chomp.to_s

case line_finish
	when "n"
		stops2 = n
	when "l"
		stops2 = l
	when "6"
		stops2 = six
	end

puts "Finish point? #{stops2}"

finish = gets.chomp
#^This is the destination stop (user input)

if line_finish == line_start
#^This if statement is to determine whether the trip will infact go on two lines.
#The statement after if is for trips that stay on the first or only one line.

		end_index = stops.index(finish)

		diff = (end_index.to_i - start_index.to_i).abs

		if end_index.to_i > start_index.to_i 
			stops_covered = stops[start_index..end_index]
		elsif end_index.to_i < start_index.to_i 
			stops_covered = (stops[end_index..start_index]).reverse!
		end

		puts "The length of your journey is #{diff} stops and the stops that will be covered are #{stops_covered}"

	elsif line_finish != line_start


		end_index = stops2.index(finish)
		#^This is the index of the final stop

		unsq1_index = stops.index("unsq")
		#^This variable is the index of union square("unsq") on the first subway line

		line1 = (unsq1_index.to_i - start_index.to_i).abs
		#^This finds the number of stops on the first line of the trip

		# first_half = stops[start_index..unsq1_index]

		if unsq1_index.to_i > start_index.to_i
			first_half = stops[start_index..unsq1_index]
		elsif unsq1_index.to_i < start_index.to_i
			first_half = (stops[unsq1_index..start_index]).reverse!	
		end
		#^This gets the array of stops on the first line of the trip
		#Ultimately will be the first half of the final array

		unsq2_index = stops2.index("unsq")
		#^This variable finds the index of union square("unsq") on the second subway line

		line2 = (end_index.to_i - unsq2_index.to_i).abs
		#^This finds the number of stops on the second line of the trip

		# second_half = stops2[unsq2_index.to_i..end_index.to_i]

		if end_index.to_i > unsq2_index.to_i 
			second_half = stops2[unsq2_index..end_index]
		elsif end_index.to_i < unsq2_index.to_i 
			second_half = (stops2[end_index..unsq2_index]).reverse!	
		end
		#^This gets the array of stops on the second line of the trip
		#Will be the second half of the final array

		puts "This is the second half: #{second_half.to_a}"

		num_of_stops = (line1.to_i + line2.to_i)
		#^Should equal the number of total stops on the trip

		full_trip = (first_half + second_half.to_a).uniq
		#^Should be the final array

		puts "Length of journey is #{num_of_stops} stops and the stops that will be covered are #{full_trip}"

	end


# As it stands now, the array halves will only join and print correctly if they
# are in order from lower index to higher. If you want to print the arrays in
# either direction you are going to have to call the reverse as well. 
# I'm assuming we can write a conditional which says if the index of endpoint 
# is lower than start point reverse the array or something to that effect.

# if unsq1_index.to_i > start_index.to_i
# 	first_half = stops[start_index..unsq1_index]
# else
# 	first_half = first_half.reverse	
# end

#^Practice of the conditional

# if end_index.to_i < unsq1_index.to_i 
# 	second_half = stops2[unsq2_index.to_i..end_index.to_i]
# else
# 	second_half = second_half.reverse	
# end

#^Practice of the conditional
