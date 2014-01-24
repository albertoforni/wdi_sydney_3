# a client can adopt an animal
# put up an animal for adoption
# can be a client of multiple shelters
# can have multiple pets

class Client
	attr_accessor :name, :pets
	def initialize(name)
		@name = name
		@pets = []
	end

	# def to_s
	# 	"#{name}"
	# end

# change the animal owner to client
# add animal to client's pet list
	def adopt_animal(animal)
		animal.owner = self
		self.pets << animal
	end


end