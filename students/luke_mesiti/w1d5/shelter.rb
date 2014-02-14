require './client'
require './animal-prompt'

class Shelter

	attr_accessor :name, :address, :shelter_animals, :shelter_clients

	def initialize(name, address)
		@name = name
		@address = address
		@shelter_animals = []
		@shelter_clients = []
	end

	def to_s
		"#{name} shelter at #{address} has " 
	#	#{animal} animals and #{client} clients."
	end

	def add_animal(animal)
		shelter_animals.push(animal)
	end

	def add_client(client)
		shelter_clients.push(client)
	end

	def user_input_animal
		puts "Please enter the animal's name:"
		animal_name = gets.chomp
		puts "Please enter the animal's age:"
		animal_age = gets.chomp
		puts "Please enter the animal's gender:"
		animal_gender = gets.chomp
		puts "Please enter the animal's species:"
		animal_species = gets.chomp
		puts "Please enter the animal's favourite toy(s)"
		animal_toys = gets.chomp
		self.add_animal(Animal.new(animal_name, animal_age, animal_gender, animal_species, animal_toys))
		# not necessary to use self here. A class can access its own methods directly.
	end

	def user_input_client
		puts "Please enter the client's name:"
		client_name = gets.chomp
		puts "How many children does the client have?"
		client_no_children = gets.chomp
		puts "Please enter the client's age:"
		client_age = gets.chomp
		puts "Please enter the number of pets:"
		client_no_pets = gets.chomp
		puts "Please enter the clients gender:"
		client_gender = gets.chomp
		self.add_client(Client.new(client_name, client_no_children, client_age, client_no_pets, client_gender))
	end

	def adopt(client_name, animal_name)


		animal = shelter_animals.find {|a| a.name == animal_name }
		# self.delete_animal(animal)

		client = shelter_clients.find {|c| c.name == client_name }
		client.add_animal(animal)
		# puts "client.class #{client.class}"
		puts client.display_pets


		# # select client by name (from user user input)
		# puts "Choose client that wants to adopt the animal"
		# client_adopt = gets.chomp

		# # select animal by name (from user input)
		# puts "Choose animal to adopt"
		# animal_adopt = gets.chomp

		# search client array to find index of client
		# puts shelter_clients.class
		# shelter_clients.each {|x| 
		# 	# if shelter_clients[x] == client_name
		# 		puts shelter_clients.at(x)
		# 	# 	puts y
		# 	# 	client_index = y
		# 	# end
		# 	}

		# search animal array to find index of animal
		# puts shelter_animals.class
		# shelter_animals.each {|x|
		# 	# if shelter_animals[x][y] == animal_name
		# 	 	puts shelter_animals.at(x)
		# 	# 	puts y
		# 	# 	animal_index = y
		# 	# end
		# 	}

	# copy animal at selected index
	# use add_animal method in client class to add the animal
		# delete animal (using index)
		# .delete_at(x)
	end

	def unadopt(client_name, animal_name)


		client = shelter_clients.find {|c| c.name == client_name }
		client.delete_animal(animal_name)
		
		animal = shelter_animals.find {|a| a.name == animal_name }
		self.add_animal(animal_name)

		# puts "client.class #{client.class}"
		puts shelter_animals
	end


end
