class Animal
	attr_accessor :name, :age, :gender, :species, :toy, :sheltered, :adopted

	def initialize (name, age, gender, species, toy, sheltered, adopted)
 		@name = name
 		@age = age
 		@gender = gender
 		@species = species
 		@toy = toy
 		@sheltered = sheltered
 		@adopted = adopted
	end

    def new_sheltered_animal(shelter)
    	@sheltered = shelter
    	p "#{name} animal is now sheltered at #{sheltered.shelter_name}!"
    	return sheltered
    end
end