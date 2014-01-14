
def station_index(user_line)
	if (user_line == "N") || (user_line == "6")
		us_index = 4
	else
		us_index = 2
	end
	us_index
end

# three subway lines represented as hash
subway = { "N" => [ "TS", "34", "28-N", "23-N", "US", "8-N" ],
		   "L" => [ "8-L", "6", "US", "3", "1" ],
		   "6" => [ "GC", "33", "28-6", "23-6", "US", "AP"]
		}

# ask user for the line and stop they are getting on at
puts "Enter the line you're getting on at: "
user_on_line = gets.chomp

puts "Enter the stop you're getting on at: "
user_on_stop = gets.chomp
start_index = subway[user_on_line].index(user_on_stop)

# ask user for the line and stop they are getting off at
puts "Enter the line you're getting off at: "
user_off_line = gets.chomp

puts "Enter the stop you're getting off at: "
user_off_stop = gets.chomp
stop_index = subway[user_off_line].index(user_off_stop)
#puts stop_index

# compare the lines input from the user. If the lines differ do the following
if user_on_line != user_off_line

	us_on_index = station_index(user_on_line)
	us_off_index = station_index(user_off_line)	

	start_index.upto(us_on_index) {|x| puts "=> #{subway[user_on_line][x]}"}

	if us_off_index > stop_index
		us_off_index.downto(stop_index) {|x| puts "=> #{subway[user_off_line][x]}"}
	else
		us_off_index.upto(stop_index) {|x| puts "=> #{subway[user_off_line][x]}"}
	end
else
	start_index.upto(stop_index) {|x| puts "=> #{subway[user_on_line][x]}"}
end