#Subway information

subway_hash = {"N" =>['TimeSquare','34th','28th','23rd','UnionSquare','8th'],
			   "L" =>['8th','6th','UnionSquare','3rd','1st'],
			   "6L"=>['GrandCentral','33rd','28th','23rd','UnionSquare','Astorplace'] }


def print_path(line_source,line_dest,index_source,index_dest,stop_source_array)
	if(index_source < index_dest)
		for i in index_source..index_dest
			print line_source +'-'+ stop_source_array[i] + " =~~=> " 
		end
		puts " "
		puts "<<<<<<<<<Number of stops : #{index_dest-index_source} >>>>>>>>>>"
	else
		index_source.downto(index_dest) {|i| print line_source +'-'+ stop_source_array[i] + " =~~=> "}
		puts " "
		puts "<<<<<<<<<Number of stops : #{index_source-index_dest} >>>>>>>>>>"
	end
end

def calculate_route(line_source,stop_source,line_dest,stop_dest,subway_hash)

	if line_source == line_dest

		# Source ,destinations from the hash provided
		index_source = subway_hash[line_source].index(stop_source)
		index_dest = subway_hash[line_dest].index(stop_dest)
		stop_source_array = subway_hash[line_source]

		print_path(line_source,line_dest,index_source,index_dest,stop_source_array)
	else
		# Have to get the code for other condition
		index_source = subway_hash[line_source].index(stop_source)

		# intermediate Source and Destinations
		middle_dest = subway_hash[line_source].index('UnionSquare')
		intermediate_middle_source = subway_hash[line_dest].index('UnionSquare')

		index_dest = subway_hash[line_dest].index(stop_dest)
		stop_source_array = subway_hash[line_source]
		stop_dest_array = subway_hash[line_dest]

		print_path(line_source,line_dest,index_source,middle_dest,stop_source_array)
		print_path(line_dest,line_dest,intermediate_middle_source,index_dest,stop_dest_array)
	end

end


# Enter the correct source Line
print "Enter the train line: [N,L,6L] "
line_source = gets.chomp.upcase
while(!subway_hash.keys.include?(line_source))
	print "Enter the train line: [N,L,6L] "
	line_source = gets.chomp.upcase
end

# Enter the correct Stop under the given Line
print "Enter the stop to get on the train from #{line_source} line: "
stop_source = gets.chomp
while(!subway_hash[line_source].include?(stop_source))
	print "Enter the stop to get on the train from #{line_source} line: "
	stop_source = gets.chomp
end


# Enter the correct destination Line
print "Enter the train line: [N,L,6L] "
line_dest = gets.chomp.upcase
while(!subway_hash.keys.include?(line_dest))
	print "Enter the train line: [N,L,6L] "
	line_dest = gets.chomp.upcase
end


# Enter the correct Stop under the given Line
print "Enter the stop to get down the train from #{line_dest} line: "
stop_dest = gets.chomp
while(!subway_hash[line_dest].include?(stop_dest))
	print "Enter the stop to get down the train from #{line_dest} line: "
	stop_dest = gets.chomp
end

calculate_route(line_source,stop_source,line_dest,stop_dest,subway_hash)