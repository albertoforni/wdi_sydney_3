class Client
	attr_accessor :name, :number_of_children, :age, :number_of_pets

	def initialize(name, number_of_children, age, number_of_pets)
		@name = name
		@number_of_children = number_of_children
		@age = age
		@number_of_pets = number_of_pets
	end

	def to_s
		print "Name: #{name}, "
		print "Children: #{number_of_children}, "
		print "Age: #{age}, "
		puts "Pets at home: #{number_of_pets}"
	end

end






