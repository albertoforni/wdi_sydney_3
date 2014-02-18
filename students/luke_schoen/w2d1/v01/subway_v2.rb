require 'sinatra'
require 'sinatra/reloader' if development? # allows you to reload web page immediately after changing main.rb without having to CTRL-C and start again in terminal
require 'pry'
require 'pry-debugger'
require "./line.rb"

get '/mta_form' do 

	@line1 = params[:line1]
	@station1 = params[:station1]
	@line2 = params[:line2]
	@station2 = params[:station2]

	subway = {}
	subway['n'] = ["8th", "6th", "Union Square", "3rd", "1st"]
	subway['l'] = ["Time Square", "34th", "28th", "23rd", "Union Square", "8th"]
	subway['s'] = ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]

	@intersection1 = subway[@line1].index("Union Square")
	@intersection2 = subway[@line2].index("Union Square")

	if !(@line1 == @line2) # different line - start/finish stops

		@journey1_arr = []
		subway[@line1].each {|x,y| @journey1_arr << x }
		@journey1_station1_index = @journey1_arr.index(@station1)
		@journey1_count = (@journey1_station1_index - @intersection1).abs

		@journey2_arr = []
		subway[@line2].each {|x,y| @journey2_arr << x }
		@journey2_station2_index = @journey2_arr.index(@station2)
		@journey2_count = (@journey2_station2_index - @intersection2).abs
		@journey_count = @journey1_count + @journey2_count

	elsif @line1 == @line2 # same line - start/finish stop
		station1_index = subway[@line1].index(@station1)
		station2_index = subway[@line2].index(@station2)
		@journey_count = (station1_index - station2_index).abs 

	else
		@journey_count = "Incorrect inputs"

	end


	erb :mta_form
end

