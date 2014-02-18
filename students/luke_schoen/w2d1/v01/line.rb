class Line
	attr_accessor :line_name, :line_stops, :line_intersects

	def initialize (line_name, line_stops, line_intersects)
		@line_name = line_name
 		@line_stops = []
 		@line_intersects = line_intersects
	end
end