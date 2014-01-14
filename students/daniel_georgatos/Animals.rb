class Animal
	attr_accessor :name, :age, :gender, :species
	animal = []

	def initialize(name="", age=0, gender="", species="")
		@name = name
		@age = age
		@gender = gender
		@species = species
	end

	def to_s
		"#{name}, {age}, #{gender}, #{species}"
	end
	def create_animal
	animal = animal.new(name. age, gender, species) > animal
	puts "What is the #{name}, #{gender}, #{species}?"
	end
end


class Client < Animal
	attr_accessor :client_name, :number_of_children, :client_age, :number_of_pets
	client = []

	def initialize(client_name="", number_of_children=0, client_age=0, number_of_pets=0)
		@client_name = client_name
		@number_of_children = number_of_children
		@client_age = client_age
		@number_of_pets = number_of_pets
	end

	def to_s
		"#{client_name}, {number_of_children}, {client_age}, {number_of_pets}"
	end
	def create_client
		client = client.new(client_name, number_of_children, client_age, number_of_pets) > client
		puts "what is #{client_name}, {client_age}, {number_of_pets}?"
	end
end

class Shelter < Client
	attr_accessor :list_of_clients, :list_of_animals

	def initialize(list_of_clients="", list_of_animals="")
		@list_of_clients = list_of_clients
		@list_of_animals = list_of_animals
	end

	def to_s
		"#{list_of_clients}, #{list_of_animals}"
	end 
	def add_to_shelter
		puts "do you want to add animal or client to shelter?(y, n)"

		if y 
			puts"What is the #{name}, #{client_name}?"
		if n
			puts"well that's unfortunate"
		end
	end
end

def menu
	p animal
	p client
	p "create_client"
	p "create_animal"
end



	
