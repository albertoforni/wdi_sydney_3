
# put owner as an atribute of animal class, it will have a client or shelter as an owner.
class Animal
	attr_accessor :name, :age, :gender, :species, :breed, :owner
	def initialize(name, age, gender, species, breed)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@breed = breed
		@owner = owner
	end

	def to_s
		"#{name} - a #{age} year old #{breed} #{species}"
	end

end