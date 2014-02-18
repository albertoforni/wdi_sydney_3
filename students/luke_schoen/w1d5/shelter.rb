class Shelter
	attr_accessor :shelter_name, :relationships

	def initialize(shelter_name, relationships)
		@shelter_name = shelter_name
		@relationships = {}
	end

end 

