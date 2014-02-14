require_relative 'animal-prompt'
require_relative 'client-prompt'
require_relative 'shelter-prompt'




##declaring default data




# Default client is Sammyjo, Leslie and Harry Potter!
@client_list = {}

sammyjo = Client.new("Sammyjo", 0, 24, 120)
@client_list[sammyjo.name] =  sammyjo

leslie = Client.new("Leslie", 2, 50, 3)
@client_list[leslie.name] =  leslie

harrypotter = Client.new("Harry Potter", 0, 36, 1)
@client_list[harrypotter.name] =  harrypotter

# default animals is Sally the dog, Ellie the parrot and Lily the cat...
@animal_list = {}


sally = Animal.new("Sally", 9, "Female", "Dog", ["A rubber phone", "A chewed up duck", "A little stuffed monster"])
@animal_list[sally.name] = sally

ellie = Animal.new("Ellie", 1, "Female", "Parrot", ["Shiny Bell", "Mushed up Pomegranate", "Wooden ladder"])
@animal_list[ellie.name] = ellie

lily = Animal.new("Lily", 1, "Female", "Cat", ["Broken toy mouse", "Rubber ball", "Shabby scratching post"])
@animal_list[lily.name] = lily

#Happy_tails is the shelter we're at, that can list animals and clients.
happy_tails = Shelter.new(@animal_list, @client_list)

#declaring methods here

def add_a_client

	add_client_again = true
	while add_client_again == true

	puts "enter a client name"
	new_client_name = gets.chomp

	puts "enter a client's number of kids (integer please)"
	new_client_kids = gets.chomp

	puts "enter a client's age (integer please)"
	new_client_age = gets.chomp

	puts "how many animals? (integer please)"
	new_client_currentAnimals = gets.chomp


	new_client = Client.new(new_client_name, new_client_kids, new_client_age, new_client_currentAnimals)

	@client_list[new_client.name.to_sym] = new_client

	puts "Client #{new_client_name} added successfully."

	puts "\n Add another client? (Y)es or (N)o - return to main menu"
	add_client_again_input = gets.chomp.upcase
		add_client_again = false if add_client_again_input != "Y"

	end


end






#### ADDING ANIMALS AND DISPLAYING ANIMALS

def add_new_animal
		add_new_animal_again = true
		while add_new_animal_again == true

			puts "What's the animal's name?"
			animal_name = gets.chomp

			puts "How old are they?"
			animal_age = gets.chomp.to_i

			puts "Are they male or female?"
			animal_gender = gets.chomp.to_s.downcase!

			puts "What species are they? Dog? Cat/etc?"
			animal_species = gets.chomp.to_s

			puts "Do they have any toys? What are they?"
			animal_toys = gets.chomp.split(",")

			new_animal = Animal.new(animal_name, animal_age, animal_gender, animal_species, animal_toys)

			@animal_list[new_animal.name.to_sym] = new_animal

			puts "Animal #{new_animal.name} has been added successfully."
				puts"\n Add another animal? (Y)es (N)o - return to main menu"
				animal_try_again_input = gets.chomp.upcase
				add_new_animal_again = false if animal_try_again_input != "Y"
		end
end


# method for listing all clients

def list_all_clients
	puts "\n Listing all clients:"
		@client_list.map {|key,client| client.to_s}
end



#method for listing all clients

def list_all_animals
	puts "\n Listing all animals:"
		@animal_list.map {|key,pet| pet.to_s}
end


#method for adopting an animal

def adopt_an_animal
	adopt_another_animal = true
	while adopt_another_animal == true
	puts "If you're already in the list of clients, enter your name."
	puts "If you're new to Happy Tails, enter 'new'."
	puts "otherwise, enter (back) to go back to the main menu..."
	adopt_menu_input = gets.chomp
	puts "DEBUG: You wrote #{adopt_menu_input}"



		#not working, revisit
		if @client_list.to_s.include? adopt_menu_input
			puts "Pick an animal for adoption:"
			@animal_list.each do |key, value|
			puts "\n#{key.to_s}"
			end
			adopt_animal_choice = gets.chomp.to_s
			puts "DEBUG: You picked #{adopt_animal_choice}"

			if @animal_list.to_s.include? adopt_animal_choice
				@client_list[adopt_menu_input].currentAnimals += 1
				puts "#{adopt_animal_choice} adopted. Congratulations!"
				@animal_list[adopt_animal_choice].delete
			end

			puts "Adopt another animal? (Y)es or (N)o - go back to main menu"
			adopt_another_animal_input = gets.chomp.upcase
	 		adopt_another_animal = false unless adopt_another_animal_input == "Y"



		elsif adopt_menu_input == "new"
			puts "Add your client details, then select (adopt) again from your main menu."
			add_a_client

		elsif adopt_menu_input == "back"
			main_menu_again = true
		else
			puts "I don't understand what you put."
			adopt_another_animal = true
		end

	end

end


#method for surrendering an animal
def surrender_an_animal
	surrender_animal_again = true
	while surrender_animal_again == true

	puts "Sorry to hear you're surrendering."
	puts "please enter the details of your animal, and come back here by entering (surrender) from the menu."
	add_new_animal

	puts "If you're already in the system, please enter your name:"
	surrendering_client_name = gets.chomp.downcase
		if surrendering_client_name == client_list[surrendering_client_name].include?
			client_list[surrendering_client_name].currentAnimals =- 1
			puts "Animal surrendered. We'll find them a good home!"

		else
			"You're not in our system. Enter your info below:"
			add_a_client
		end

	puts "Surrender another animal? (Y)es or (N)o (return to main menu)"
	surrender_animal_again_input = gets.chomp.upcase
	surrender_animal_again = false unless surrender_animal_again_input == "Y"

	end
end



### EXECUTING CODE
main_menu_again = true
while main_menu_again == true

	puts "\n ~~~ ANIMAL SHELTER-O-MATIC 3000 ~~~~"
	puts "\n What would you like to do today?"
	puts "(Status) to see all data for HappyTails"
	puts "(Adopt) to Adopt an animal"
	puts "(Surrender) to Surrender an animal"
	puts "(Addclient) to add a client to the database"
	puts "(Addanimal) to add a new animal to the database"
	puts "(Clients) to see the list of current clients"
	puts "(Animals) to see the animals currently at the shelter"
	puts "(Q) to exit."
	main_menu_choice = gets.chomp.downcase


	case main_menu_choice

		#begin watching for errors
		#begin

		#when "status" is picked from the main meny
		when "status"
			happy_tails.to_s

		
		#when "adopt" is picked from the main menu
		when "adopt"
			adopt_an_animal
			


		#when "surrender" is picked from the main menu
		when "surrender"
			surrender_an_animal
			


		#when "add client" is picked from the main menu
		when "addclient"
			add_a_client



		#when "add an animal" is picked from the main menu
		when "addanimal"
			add_new_animal



		#when "clients" is selected from the main menu
		when "clients"
			list_all_clients



		#when "animals" is selected from the main menu
		when "animals"
			list_all_animals


		#option to exit the program with Q
		when "q"
			Kernel.exit


		else "You didn't enter a valid menu option. Try typing the words in the brackets!"
			main_menu_again = true


	end

end


### TESTS

# def adopt (animal)
# animals = animals.delete(animal_name.to_sym)

# client = clients[client_name.to_sym]

# client.pets << animal


