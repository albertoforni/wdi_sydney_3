require 'pry'
require 'pry-debugger'


subway = {}

subway['n'] = ["times square", "34th", "28th", "23rd", "union square", "8th"]
subway['l'] = ["8th", "6th", "union square", "3rd", "1st"]
subway['s'] = ["grand central", "33rd", "28th", "23rd", "union square", "Astor Place"]


puts "Which train are you getting on? n, l s?"
	trainon = gets.chomp

puts "Which stop are you getting on?"
	stopon = gets.chomp    

puts "Which train are you getting off? n, l, s?"
	trainoff = gets.chomp

puts "Which stop are you getting off?"
	stopoff = gets.chomp

index_on = (subway[trainon].index(stopon))
index_off = (subway[trainoff].index(stopoff))

unionin = subway[trainon].index("union square")
unionout = subway[trainoff].index("union square")

if trainon != trainoff # if the person is changing lines
	numstops = (unionin - index_on).abs + (unionout - index_off).abs  
	
	stops1 = subway[trainon]
	stops2 = subway[trainoff] # the hash it should search through
	
	stops_covered = []

	if index_on < unionin
		index_on.upto(unionin) { |stop| stops_covered.push(stops1[stop]) }
	elsif  index_on > unionin
		index_on.downto(unionin) { |stop| stops_covered.push(stops1[stop]) }
	end

	if index_off > unionout
		unionout.upto(index_off) { |stop| stops_covered.push(stops2[stop]) }
	elsif  index_off < unionout
		unionout.downto(index_off) { |stop| stops_covered.push(stops2[stop]) }
	end


	 # The ranges of the first hash up to union square + the second hash from union square
	# this doesnt work because array[1..3] works but array[3..1] returns an empty array ONLY WORKS FOR ASTOR PLACE
	# tried using reverse but then i have the opposite problem, grand central works, astor doesnt

else
	numstops = index_off - index_on
	stops = subway[trainon]
	stops_covered = stops[index_on..index_off]
end

puts "It will take #{numstops} stops"

p stops_covered

# n.each {|stop| counter += 1 				# how to puts the index of the stop as it counts through it?
# break if stop == "union square"
# }



					# use .uniq to not count union 

					# use .index to get the index position of stopon

