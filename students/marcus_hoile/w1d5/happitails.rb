# animal shelter manager. Manage a list of animals and clients and facilitate adoptions
# add methods to relevant classes eg 
# create classes for animals and clients
require_relative 'animal_class'
require_relative 'client_class'
require_relative 'shelter_class'







# add an animal available for adoption
def add_animal(animal, animals)
  animals << animal
end

# add a new client to the the client list
def add_client(client, clients)
	clients << client
end

# view animals that are up for adoption and select one for adoption
def view_animals(clients, shelter)
	# iterates through the array of pets at the shelfter and prints the animal's details
	shelter.pets.each { |pet| puts pet.to_s } # why does the shelter's pets array get displayed?
	
	puts
	puts "Enter the name of the animal you would like to adopt:"
	animal_selected = gets.chomp.capitalize
	# find the animal in the animals array, delete and add as a pet to the client
	animal_to_adopt = shelter.pets.find { |pet| animal_selected == pet.name }
	puts "What is your name?"
	client_name = gets.chomp
	adopt_animal(animal_to_adopt, shelter.pets, clients)
end

# view clients who have adopted animals
def view_clients(animals, clients)
	puts "Clients:"
	# iterates through the array of clients and prints all the pets each client has adopted.
	clients.each do |client|
		puts client.name + " has adopted these animals: "
		for pet in client.pets do
			puts " * #{pet.name} - who is a #{pet.age} year old #{pet.breed}"

		end
		puts
	end
	puts

end

# existing and new clients can put animals up for adoption
def register_animal(animals, clients, shelter)
	# capture all the details of the animal
	puts "What type of animal is it?"
	species = gets.chomp.capitalize
	puts "What breed of " + species + " is it?"
	breed = gets.chomp.capitalize
	puts "What is the sex of the " + species + "?"
	gender = gets.chomp.downcase

	# put a conditional so that the responses are using the right gender
	if gender.include?("f")
	  puts "What is her name?"
	else
		puts "What is his name?"
	end
	name = gets.chomp.capitalize
	puts "How old is " + name + "?"
	age = gets.chomp.to_i
	animal_to_adopt = name.downcase.strip
	# create animal and make shelter the owner
	animal_to_adopt = Animal.new(name, age, gender, species, breed)
	# adds the animal to shelter's 
	shelter.put_up_for_adoption(animal_to_adopt)
	if gender.include?("f")
	  puts "We'll take " + name + " and make sure she finds a great home :)\n"
	else
		puts "We'll take " + name + " and make sure he finds a great home :)\n"
	end
	
	

  
end

# create a method that will assign pets to clients. clients should be able to have multple pets.
def adopt_animal(animal, animals, clients)
  puts "What is your name?"
  name = gets.chomp.capitalize
  client_name = name.downcase.strip
  # check to see if client name already exists, if it does add to their pets array
  existing_client = clients.find { |client| client.name.downcase.strip == client_name }

  # when there is no name it will create a new client
  if existing_client == nil
		client_name = Client.new(name)
		clients << client_name
		animals.delete(animal)
		# as well as adding animal to client, add client(owner) to animal
		client_name.pets << animal
		animal.owner = client_name
	else
	  # add animal to their pets array
      animals.delete(animal)
      existing_client.pets << animal
	end

  puts
  puts "Thank you #{name} for giving #{animal.name} a home :)"
  puts
end

# create happitails
happitails = Shelter.new("HappiTails")

# create arrays to contain animals and clients
clients = []
animals = []

# create some animals
harry = Animal.new("Harry", 3, "Male", "Dog", "Staffordshire Terrier")
milo = Animal.new("Milo", 5, "Female", "Dog", "Schnauser")
bruce = Animal.new("Bruce", 4, "Male", "Cat", "Persian")
charlotte = Animal.new("Charlotte", 2, "Female", "Cat", "Moggy")
mlady = Animal.new("M'Lady", 5, "Female", "Dog", "Douche")

# assign the shelter as the owner
happitails.put_up_for_adoption(harry)
happitails.put_up_for_adoption(milo)
happitails.put_up_for_adoption(bruce)
happitails.put_up_for_adoption(charlotte)
happitails.put_up_for_adoption(mlady)

# create some clients
alison = Client.new("Alison Macartney")
ash = Client.new("Ashraf Eissa")

# add charlotte to a client
alison.pets << charlotte
ash.pets << mlady

# add animals to array
add_animal(harry, animals)
add_animal(milo, animals)
add_animal(bruce, animals)


# add clients to list
add_client(alison, clients)
add_client(ash, clients)

# change this to a loop menu
begin
	puts "Would you like to do? \n(1) Adopt an Animal\n(2) Put Animal up for adoption\n(3) View Clients\n(4) Happitails... (5) Quit"
	answer = gets.chomp.to_i
	case answer 
	when 1
		view_animals(clients, happitails)
	when 2
		register_animal(animals, clients, happitails)
	when 3
		view_clients(animals, clients)
	when 4
		p happitails
	end
end until (answer == 5)

# method for putting up for adoption
# shelter lists all clients
# shelter lists all animals
# method for adopting a pet

