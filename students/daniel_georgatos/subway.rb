
global_n = { "n_Time Square" => nil, "n_34th" => nil, "n_28th" => nil, "n_23rd" => nil, "n_Union Square" => "intersect", "n_8th" => nil }
global_l = { "l_8th" => nil, "l_6th" => nil, "l_Union Square" => "intersect", "l_3rd" => nil, "l_1st" => nil }
global_s = { "s_Grand Central" => nil, "s_33rd" => nil, "s_28th" => nil, "s_23rd" => nil, "s_Union Square" => "intersect", "s_Astor Place" => nil }

puts "#{global_n}"

def total_stops (start_line = "n", start_stop = "Time Square", finish_line = "n", finish_stop = "8th")
	total_count = 0
	arr = []
	start_key_var = start_line + "_" + start_stop
	finish_key_var = finish_line + "_" + finish_stop
	intersect_start_key_var = start_line + "_" + "Union Square"
	intersect_finish_key_var = finish_line + "_" + "Union Square"
	hash_line_start = "global_" + start_line
	hash_line_finish = "global_" + finish_line

	puts "#{hash_line_finish}" # TEST 

	if start_line == finish__line
		total_count = ( finish_key_var.index.to_i - start_key_var.index.to_i ).abs
		puts "#{total_count}"
		return total_count
	elsif !(start_line == finish_line )
		case start_line
			when hash_line_start[start_key_var].index < hash_line_start.select(intersect_start_key_var).index
				total_count += ( hash_line_start.select(intersect_start_key_var).index - hash_line_start[start_key_var].index).abs
			when hash_line_start[start_key_var].index > hash_line_start.select(intersect_start_key_var).index
				total_count += ( hash_line_start[start_key_var].index - hash_line_start.select(intersect_start_key_var).index).abs
		end
		case finish_line 
			when hash_line_finish[finish_key_var].index < hash_line_finish.select(intersect_finish_key_var).index
				total_count += ( hash_line_finish.select(intersect_finish_key_var).index - hash_line_finish[finish_key_var].index).abs
			when hash_line_finish[finish_key_var].index > hash_line_finish.select(intersect_finish_key_var).index
				total_count += ( hash_line_finish[finish_key_var].index - hash_line_finish.select(intersect_finish_key_var).index).abs
		end
		puts "#{total_count}"
		return total_count
	end
end


def convert_keys stops_hash
	arr = []
	stops_hash.keys {|x|
		stop_trunc = x[2..-1]
		arr << stop_trunc
	}
	return arr
end


def show_stops line
	case start_line
	when start_line == "n"
		puts "stops on #{n} line are: #{convert_keys(global_n)}"
	when start_line == "l"
		puts "stops on #{l} line are: #{convert_keys(global_l)}"
	when start_line == "s"
		puts "stops on #{s} line are: #{convert_keys(global_s)}"
	else
		puts "error, please enter a valid line"
		user_route(nil)
	end
end

def user_route x
	puts "welcome to choose your route!!"
	# start line and stop
	puts "enter line of starting: n, l, s"
	start_line = gets.chomp.lowercase.to_s
	show_stops(start_line)
	puts "enter stop of starting"
	start_stop = gets.chomp.lowercase.to_s

	#finish line and stop
	puts "enter line of finishing: n, l, s"
	finish_line = gets.chomp.lowercase.to_s
	show_stops(finish_line)
	puts "enter stop of finishing"
	finish_stop = gets.chomp.lowercase.to_s
	total_stops(start_line, start_stop, finish_line, finish_stop)
end

x = gets.chomp
user_route(x)

=begin
while !( gets.chomp.lowercase!.to_s == "q" )
	user_route(x)
end
=end

# except for intersection locations and considering direction