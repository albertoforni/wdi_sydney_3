require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
require 'pry-debugger'

get '/' do 

	@line_start = params[:line_start]
	@start = params[:start]
	@line_finish = params[:line_finish]
	@finish = params[:finish]

	n = ["nts", "n34", "n28", "n23", "unsq", "n8"]

	l = ["l8", "l6", "unsq", "l3", "l1"]

	six = ["gc", "6_33", "6_28", "6_23", "unsq", "ap"]

	unless @start.nil? 

		case @line_start
		when "N"
			@stops = n
		when "L"
			@stops = l
		when "6"
			@stops = six
		end

		binding.pry
		@start_index = @stops.index(@start)



		case @line_finish
		when "N"
			@stops2 = n
		when "L"
			@stops2 = l
		when "6"
			@stops2 = six
		end



	if @line_finish == @line_start

		@end_index = @stops.index(@finish)

			@diff = (@end_index.to_i - @start_index.to_i).abs

			if @end_index.to_i > @start_index.to_i 
				@full_trip = @stops[@start_index..@end_index]
			elsif @end_index.to_i < @start_index.to_i 
				@full_trip = (@stops[@end_index..@start_index]).reverse!
			end



	elsif @line_finish != @line_start

		@end_index = @stops2.index(@finish)
			#^This is the index of the final stop

			@unsq1_index = @stops.index("unsq")
			#^This variable is the index of union square("unsq") on the first subway line

			@line1 = (@unsq1_index.to_i - @start_index.to_i).abs
			#^This finds the number of stops on the first line of the trip

			# first_half = stops[start_index..unsq1_index]

			if @unsq1_index.to_i > @start_index.to_i
				@first_half = @stops[@start_index..@unsq1_index]
			elsif @unsq1_index.to_i < @start_index.to_i
				@first_half = (@stops[@unsq1_index..@start_index]).reverse!	
			end
			#^This gets the array of stops on the first line of the trip
			#Ultimately will be the first half of the final array

			@unsq2_index = @stops2.index("unsq")
			#^This variable finds the index of union square("unsq") on the second subway line

			@line2 = (@end_index.to_i - @unsq2_index.to_i).abs
			#^This finds the number of stops on the second line of the trip

			# second_half = stops2[unsq2_index.to_i..end_index.to_i]

			if @end_index.to_i > @unsq2_index.to_i 
				@second_half = @stops2[@unsq2_index..@end_index]
			elsif @end_index.to_i < @unsq2_index.to_i 
				@second_half = (@stops2[@end_index..@unsq2_index]).reverse!	
			end
			#^This gets the array of stops on the second line of the trip
			#Will be the second half of the final array

			# puts "This is the second half: #{second_half.to_a}"

			@num_of_stops = (@line1.to_i + @line2.to_i)
			#^Should equal the number of total stops on the trip

			@full_trip = (@first_half + @second_half.to_a).uniq
			#^Should be the final array


	end

	end




	erb :index
end