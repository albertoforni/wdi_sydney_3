require './shelter'

# def initialize(name, address)
shelter = Shelter.new("HappiTails", "East 21st Street")


# def initialize(name, number_of_children, age, number_of_pets, gender)
# client = Client.new("suzie", 2, 23, 2, "female")
shelter.add_client(Client.new("suzie", 2, 22, 2, "female"))
shelter.add_client(Client.new("joanne", 4, 44, 4, "female"))
shelter.add_client(Client.new("gloria", 3, 33, 3, "female"))
shelter.add_client(Client.new("tina", 4, 44, 4, "female"))

# def initialize(name, age, gender, species, toys)
# animal = Animal.new("bill", 2, "male", "cat", "string")
shelter.add_animal(Animal.new("bill", 2, "male", "cat", "string"))
shelter.add_animal(Animal.new("sam", 4, "male", "dog", "ball"))
shelter.add_animal(Animal.new("ant", 8, "male", "mouse", "wheel"))
shelter.add_animal(Animal.new("carmine", 1, "male", "fish", "treasure_chest"))

def menu(shelter_name)
	# clean screen. work out where it should go. 
	# puts "\e[H\e[2J"
	puts "\n#{shelter_name} shelter"
	puts "Make a selection from the menu below to proceed."
	puts 'Type "quit" to exit'
	puts "1. Display all animals"
	puts "2. Display all clients"
	puts "3. Create an animal"
	puts "4. Create a client"
	puts "5. Facilitate animal adoption"
	puts "6. Receive animal for adoption"
	selection = gets.chomp
end

initial_menu = menu(shelter.name)

# put while statement at end of loop and don't need to do initial_menu call
while initial_menu != "quit"
	# selection = menu

	# use a case statement instead
	if initial_menu == "1"
		puts shelter.shelter_animals
	elsif initial_menu == "2"
		puts shelter.shelter_clients
	elsif initial_menu == "3"
		shelter.user_input_animal
	elsif initial_menu == "4"
		shelter.user_input_client
	elsif initial_menu == "5"
		# select client by name (from user user input)
		puts "Choose client that wants to adopt the animal"
		client_adopt = gets.chomp
		# select animal by name (from user input)
		puts "Choose animal to adopt"
		animal_adopt = gets.chomp

		shelter.adopt(client_adopt, animal_adopt)
	elsif initial_menu == "6"
		puts "Choose the client that wants to give up an animal"
		client_unadopt = gets.chomp

		puts "Choose the animal to unadopt"
		animal_unadopt = gets.chomp

		shelter.unadopt(client_unadopt, animal_unadopt)
	else
		puts "I didn't understand that response. Please choose a number from the menu."
	end

	initial_menu = menu(shelter.name)
end
			

