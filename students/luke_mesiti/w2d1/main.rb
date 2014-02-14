require 'sinatra'
require 'sinatra/reloader' if development?

get '/mta' do
	@user_on_line = params[:user_on_line]
	@user_on_stop = params[:user_on_stop]
	@user_off_line = params[:user_off_line]
	@user_off_stop = params[:user_off_stop]


	subway = { "N" => [ "TS", "34", "28-N", "23-N", "US", "8-N" ],
		   "L" => [ "8-L", "6", "US", "3", "1" ],
		   "S" => [ "GC", "33", "28-6", "23-6", "US", "AP"]
		}

	def station_index(user_line)
		if (user_line == "N") || (user_line == "S")
			us_index = 4
		else
			us_index = 2
		end
		us_index
	end

	if params[:user_on_line].nil?
	else
		@start_index = subway[@user_on_line].index(@user_on_stop)
		@stop_index = subway[@user_off_line].index(@user_off_stop)

		if @user_on_line != @user_off_line

			@us_on_index = station_index(@user_on_line)
			@us_off_index = station_index(@user_off_line)	

			if @start_index > @us_off_index
				@result = subway[@user_on_line][@us_on_index..@start_index].reverse
			else
				@result2 = subway[@user_on_line][@start_index..@us_on_index]
			end

		 	if @us_off_index > @stop_index
		 		@result3 = subway[@user_off_line][@stop_index..@us_off_index].reverse
			else
				@result4 = subway[@user_off_line][@us_off_index..@stop_index]
			end
		end

		if @user_on_line == @user_off_line
			if @start_index > @stop_index
				@result5 = subway[@user_on_line][@stop_index..@start_index].reverse
			else
				@result6 = subway[@user_on_line][@start_index..@stop_index]
			end
		end
	end

	erb :mta
	
end