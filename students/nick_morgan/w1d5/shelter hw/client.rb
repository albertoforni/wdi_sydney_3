Client_list = []

class Client
	attr_accessor :name, :age, :gender, :pets

	def initialize(name, age, gender, pets = [])
		@name = name
		@age = age
		@gender = gender
		@pets = pets
	end

	def to_s
		"Client = #{name}, age = #{age}, #{gender}, no. of pets = #{pets.count}, list of pets = #{pets}"
	end

	def client_list(client)
	    Client_list << animal
	 end
end

# Beth = Client.new("Beth", 30, "female", [])

# puts Beth

# Beth.pets << "Joe"

# puts Beth