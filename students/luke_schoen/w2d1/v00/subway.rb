require "./line.rb"

arr_lines = []


create(arr_lines)
arr_lines << create()


def create(arr_lines)
	until arr_lines.count == 3
		puts "create lines: press l, n, or s..."
		create_line = gets.chomp.to_s

		case create_line
		when 'l'
				if check_exists(arr_lines, create_line)
					l_line = Line.new(create_line, ["l_8th", "l_6th", "l_Union Square", "l_3rd", "l_1st"], 2)
					return l_line
				end
		when 'n'
				if check_exists(arr_lines, create_line) # only continues if returns true indicating not already created 
					n_line = Line.new(create_line, ["n_Time Square", "n_34th", "n_28th", "n_23rd", "n_Union Square", "n_8th"], 5)
					return n_line
				end
		when 's'
				if check_exists(arr_lines, create_line)
					s_line = Line.new(create_line, ["s_Grand Central", "s_33rd", "s_28th", "s_23rd", "s_Union Square", "s_Astor Place"], 4)
					return s_line
				end
		else
			puts "incorrect input! try again please..."
			create(arr_lines)
		end
	end
	puts "all lines created!"
	puts "-------------------"
	puts "#{arr_lines}"
	puts "-------------------"
	total_stops1 = []
	total_stops2 = []
	total_stops1 << route1(arr_lines) until total_stops.count == 1
	total_stops2 << route2(arr_lines) until total_stops.count == 2 
	total_stops = total_stops1.to_i + total_stops2.to_i
	puts total_stops
	return total_stops
end

def check_exists?(arr_lines, create_line)
	if !(exist_check = arr_lines.select {|x| x == create_line})
		return true
	else
		puts "already previously created #{create_line}, try another"
		return false
	end
end

def route1(arr_lines)
		arr_lines = arr_lines.sort_by { |x| x >= "l"}
		l_arr_lines = arr_lines[0]
		n_arr_lines = arr_lines[1]
		s_arr_lines = arr_lines[2]

		l_intercept = l_arr_lines.index { |x| x == "l_Union Square"}
		n_intercept = n_arr_lines.index { |x| x == "n_Union Square"}
		s_intercept = s_arr_lines.index { |x| x == "s_Union Square"}

		puts "enter route starting line: press l, n, or s..."
		route1_line = gets.chomp.to_s
		puts "enter route starting stop: press #{l_arr_lines}, #{n_arr_lines}, or #{s_arr_lines}"
		route1_stop = gets.chomp.to_s

		puts "enter route finishing line: press l, n, or s..."
		route2_line = gets.chomp.to_s
		puts "enter route finishing stop: press #{l_arr_lines}, #{n_arr_lines}, or #{s_arr_lines}"
		route2_stop = gets.chomp.to_s

		if !(route1.line == route2.line)
			case route1_line
			when 'l'
				route1_location = l_arr_lines.index { |x| x == "route1_stop"}
				if route1_location < l_intercept
					total_stops += (l_intercept - route1_location)
					return total_stops, arr_lines
				elsif route1_location > l_intercept
					total_stops += (route1_location - l_intercept)
					return total_stops, arr_lines
				elsif route1_location == l_intercept
					total_stops += 0
					return total_stops, arr_lines
				end
			when 'n'
				route1_location = n_arr_lines.index { |x| x == "route1_stop"}
				if route1_location < n_intercept
					total_stops += (n_intercept - route1_location)
					return total_stops, arr_lines
				elsif route1_location > n_intercept
					total_stops += (route1_location - n_intercept)
					return total_stops, arr_lines
				elsif route1_location == n_intercept
					total_stops += 0
					return total_stops, arr_lines
				end
			when 's'
				route1_location = s_arr_lines.index { |x| x == "route1_stop"}
				if route1_location < s_intercept
					total_stops += (s_intercept - route1_location)
					return total_stops, arr_lines
				elsif route1_location > s_intercept
					total_stops += (route1_location - s_intercept)
					return total_stops, arr_lines
				elsif route1_location == s_intercept
					total_stops += 0
					return total_stops, arr_lines
				end
			else
				puts "incorrect input! try again please..."
				create(arr_lines)
			end

		elsif route1.line == route2.line
			case route1_line # both the same value so only one case
			when 'l'
				route1_location = l_arr_lines.index { |x| x == "route1_stop"}
				route2_location = l_arr_lines.index { |x| x == "route2_stop"}
				if route1_location < route2_location
					total_stops += (route2_location - route1_location)
					return total_stops, arr_lines
				elsif route1_location > route2_location
					total_stops += (route1_location - route2_location)
					return total_stops, arr_lines
				elsif route1_location == route2_location
					total_stops += 0
					return total_stops, arr_lines
				end
			when 'n'
				route1_location = n_arr_lines.index { |x| x == "route1_stop"}
				route2_location = l_arr_lines.index { |x| x == "route2_stop"}
				if route1_location < route2_location
					total_stops += (route2_location - route1_location)
					return total_stops, arr_lines
				elsif route1_location > route2_location
					total_stops += (route1_location - route2_location)
					return total_stops, arr_lines
				elsif route1_location == route2_location
					total_stops += 0
					return total_stops, arr_lines
				end
			when 's'
				route1_location = s_arr_lines.index { |x| x == "route1_stop"}
				route2_location = l_arr_lines.index { |x| x == "route2_stop"}
				if route1_location < route2_location
					total_stops += (route2_location - route1_location)
					return total_stops, arr_lines
				elsif route1_location > route2_location
					total_stops += (route1_location - route2_location)
					return total_stops, arr_lines
				elsif route1_location == route2_location
					total_stops += 0
					return total_stops, arr_lines
				end
			else
				puts "incorrect input! try again please..."
				create(arr_lines)
			end
		end
end

def route2(arr_lines)
		arr_lines = arr_lines.sort_by { |x| x >= "l"}
		l_arr_lines = arr_lines[0]
		n_arr_lines = arr_lines[1]
		s_arr_lines = arr_lines[2]

		l_intercept = l_arr_lines.index { |x| x == "l_Union Square"}
		n_intercept = n_arr_lines.index { |x| x == "n_Union Square"}
		s_intercept = s_arr_lines.index { |x| x == "s_Union Square"}

		case route2_line
		when 'l'
			route2_location = l_arr_lines.index { |x| x == "route2_stop"}
			if route2_location < l_intercept
				total_stops += (l_intercept - route2_location)
				return total_stops, arr_lines
			elsif route2_location > l_intercept
				total_stops += (route2_location - l_intercept)
				return total_stops, arr_lines
			elsif route2_location == l_intercept
				total_stops += 0
				return total_stops, arr_lines
			end
		when 'n'
			route2_location = n_arr_lines.index { |x| x == "route2_stop"}
			if route2_location < n_intercept
				total_stops += (n_intercept - route2_location)
				return total_stops, arr_lines
			elsif route2_location > n_intercept
				total_stops += (route2_location - n_intercept)
				return total_stops, arr_lines
			elsif route2_location == n_intercept
				total_stops += 0
				return total_stops, arr_lines
			end
		when 's'
			route2_location = s_arr_lines.index { |x| x == "route2_stop"}
			if route2_location < s_intercept
				total_stops += (s_intercept - route2_location)
				return total_stops, arr_lines
			elsif route2_location > s_intercept
				total_stops += (route2_location - s_intercept)
				return total_stops, arr_lines
			elsif route2_location == s_intercept
				total_stops += 0
				return total_stops, arr_lines
			end
		else
			puts "incorrect input! try again please..."
			create(arr_lines)
		end
end