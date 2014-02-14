
class Client

	attr_accessor :name, :number_of_children, :age, :number_of_pets, :gender, :animal

	def initialize(name, number_of_children, age, number_of_pets, gender)
		@name = name
		@number_of_children = number_of_children
		@age = age
		@number_of_pets = number_of_pets
		@gender = gender
		@animal = []
	end

	def to_s
		"#{name} is a #{age} year old #{gender} with #{number_of_children} kids and #{number_of_pets} pet(s)"
	end

	def add_animal(add_animal)
		# puts "animal.class #{animal.class}"
		animal.push(add_animal)
	end

	def delete_animal(delete_animal)
		animal.delete(delete_animal)
	end

	def display_pets
		animal
	end


end