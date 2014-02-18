require 'sinatra'
require 'sinatra/reloader' if development? # allows you to reload web page immediately after changing main.rb without having to CTRL-C and start again in terminal
require 'pry'
require 'pry-debugger'
require "./line.rb"

get '/mta_form' do 

	@first_line = params[:first].to_s
	@second_start_line = params[:second].to_s
	@third_start_stop = params[:second].to_s
	@fourth_finish_line = params[:second].to_s
	@fifth_finish_stop = params[:second].to_s
	#@operation = params[:operation] # used @first_line for operation instead


	arr_lines = []
	arr_lines << create(first_line, second_start_line, third_start_stop, fourth_finish_line, fifth_finish_stop, arr_lines)
	puts "#{arr_lines}" # returns the total stops
	@result = arr_lines

binding.pry

	erb :mta_form
end


def create(first_line, second_start_line, third_start_stop, fourth_finish_line, fifth_finish_stop, arr_lines)
	until arr_lines.count == 3
		# puts "create lines: press l, n, or s..."
		# create_line = gets.chomp.to_s

		# case create_line
		#case first_line
		#when 'l'
		#		if check_exists(arr_lines, first_line)
		#			l_line = Line.new(first_line, ["l_8th", "l_6th", "l_Union Square", "l_3rd", "l_1st"], 2)
		#			return l_line
		#		end
		#when 'n'
		#		if check_exists(arr_lines, first_line) # only continues if returns true indicating not already created 
		#			n_line = Line.new(first_line, ["n_Time Square", "n_34th", "n_28th", "n_23rd", "n_Union Square", "n_8th"], 5)
		#			return n_line
		#		end
		#when 's'
		#		if check_exists(arr_lines, first_line)
		#			s_line = Line.new(first_line, ["s_Grand Central", "s_33rd", "s_28th", "s_23rd", "s_Union Square", "s_Astor Place"], 4)
		#			return s_line
		#		end
		#else
		#	puts "incorrect input! try again please..."
		#	create(arr_lines)
		#end
		if check_exists(arr_lines, first_line)
			l_line = Line.new(first_line, ["l_8th", "l_6th", "l_Union Square", "l_3rd", "l_1st"], 2)
			return l_line
		end

		if check_exists(arr_lines, first_line) # only continues if returns true indicating not already created 
			n_line = Line.new(first_line, ["n_Time Square", "n_34th", "n_28th", "n_23rd", "n_Union Square", "n_8th"], 5)
			return n_line
		end

		if check_exists(arr_lines, first_line)
			s_line = Line.new(first_line, ["s_Grand Central", "s_33rd", "s_28th", "s_23rd", "s_Union Square", "s_Astor Place"], 4)
			return s_line
		end

	end
	puts "all lines created!"
	puts "-------------------"
	puts "#{arr_lines}"
	puts "-------------------"
	total_stops1 = []
	total_stops2 = []
	total_stops1 << route1(first_line, second_start_line, third_start_stop, fourth_finish_line, fifth_finish_stop, arr_lines) until total_stops.count == 1
	total_stops2 << route2(first_line, second_start_line, third_start_stop, fourth_finish_line, fifth_finish_stop, arr_lines) until total_stops.count == 2 
	total_stops = total_stops1.to_i + total_stops2.to_i
	return total_stops
end

def check_exists?(arr_lines, first_line)
	if !(exist_check = arr_lines.select {|x| x == first_line})
		return true
	else
		puts "already previously created #{first_line}, try another"
		return false
	end
end

def route1(first_line, second_start_line, third_start_stop, fourth_finish_line, fifth_finish_stop, arr_lines)
		arr_lines = arr_lines.sort_by { |x| x >= "l"}
		l_arr_lines = arr_lines[0]
		n_arr_lines = arr_lines[1]
		s_arr_lines = arr_lines[2]

		l_intercept = l_arr_lines.index { |x| x == "l_Union Square"}
		n_intercept = n_arr_lines.index { |x| x == "n_Union Square"}
		s_intercept = s_arr_lines.index { |x| x == "s_Union Square"}

		route1_line = second_start_line
		route1_stop = third_start_stop
		route2_line = fourth_finish_line
		route2_stop = fifth_finish_stop

		#puts "enter route starting line: press l, n, or s..."
		#route1_line = gets.chomp.to_s
		#puts "enter route starting stop: press #{l_arr_lines}, #{n_arr_lines}, or #{s_arr_lines}"
		#route1_stop = gets.chomp.to_s

		#puts "enter route finishing line: press l, n, or s..."
		#route2_line = gets.chomp.to_s
		#puts "enter route finishing stop: press #{l_arr_lines}, #{n_arr_lines}, or #{s_arr_lines}"
		#route2_stop = gets.chomp.to_s

		if !(route1_line == route2_line)
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
				create(first_line, second_start_line, third_start_stop, fourth_finish_line, fifth_finish_stop, arr_lines)
			end

		elsif route1_line == route2_line
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
				create(first_line, route1_line, route1_stop, route2_line, route2_stop, arr_lines)
			end
		end
end

def route2(first_line, second_start_line, third_start_stop, fourth_finish_line, fifth_finish_stop, arr_lines)
		arr_lines = arr_lines.sort_by { |x| x >= "l"}
		l_arr_lines = arr_lines[0]
		n_arr_lines = arr_lines[1]
		s_arr_lines = arr_lines[2]

		l_intercept = l_arr_lines.index { |x| x == "l_Union Square"}
		n_intercept = n_arr_lines.index { |x| x == "n_Union Square"}
		s_intercept = s_arr_lines.index { |x| x == "s_Union Square"}

		route1_line = second_start_line
		route1_stop = third_start_stop
		route2_line = fourth_finish_line
		route2_stop = fifth_finish_stop

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
			create(first_line, route1_line, route1_stop, route2_line, route2_stop, arr_lines)
		end
end
