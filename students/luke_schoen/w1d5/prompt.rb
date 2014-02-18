require "./client.rb"
require "./animal.rb"
require "./shelter.rb"

def menu(pet_new, client_new, shelter_new)
	puts "\n--------------------------"
	puts "| MAIN MENU"
	puts "---------------------------"
	puts "Type: a - To create a new animal"
	puts "Type: c - To create a new client"
	puts "Type: s - To create a new shelter"
	puts "Type: m - To assign an animal or client to a shelter"

	main_option = gets.chomp
	while main_option != nil
		if main_option == "a"
			puts "|"
			puts "| CREATE NEW ANIMAL"
			puts "|"
			puts "Enter new animal details (name, age, gender, species, toys)"
			a_new_arr = gets.chomp
			a_new_arr = a_new_arr.split(' ') # splits the string obtained from user input to an array
			pet_new = []
			pet_new << Animal.new(a_new_arr[0], a_new_arr[1], a_new_arr[2], a_new_arr[3], a_new_arr[4], nil, nil) # instance of animal
			puts "Created successfully: #{pet_new}"
			return true
		elsif main_option == "c"
			puts "|"
			puts "| CREATE NEW CLIENT"
			puts "|"
			puts "Enter new client details (name, age)"
			c_new_arr = gets.chomp
			c_new_arr = c_new_arr.split(' ')
			client_new = []
			client_new << Client.new(c_new_arr[0], c_new_arr[1], nil, nil, nil) # instance of client
			puts "Created successfully: #{client_new}"
			return true
		elsif main_option == "s"
			puts "|"
			puts "| CREATE NEW SHELTER"
			puts "|"
			puts "Enter new shelter details (name)"
			s_new_arr = gets.chomp
			s_new_arr = s_new_arr.split(' ')
			shelter_new = []
			shelter_new << Shelter.new(s_new_arr[0], nil) # instance of shelter
			puts "Created successfully: #{shelter_new}"
			return true
		elsif main_option == "m" 
			#&& (!((pet_new[0] && client_new[0] && shelter_new[0]) == nil))
			assign_shelter(pet_new, client_new, shelter_new) until false

		elsif main_option == "q"
			return false
		else
			p "Incorrect option entered!"
			return "repeat"
		end 
	end
end

def assign_shelter(pet_new, client_new, shelter_new)
	puts "--------------------------"
	puts "| ASSIGN SHELTER MENU"
	puts "---------------------------"

	puts "Type: ma - To assign an animal to a shelter"
	puts "Type: mc - To assign a client to a shelter"
	puts "Type: d - To display current animals, clients, shelters, assignments, and relationships"
	puts "Type: main - To return to main menu"
	puts "Type: q - To create a new animal"

	shelter_option = gets.chomp
	while shelter_option != nil
		if shelter_option == "ma"
			puts "|"
			puts "| ASSIGN ANIMAL TO A SHELTER"
			puts "|"
			puts "Enter animal name"
			a_new = gets.chomp
			puts "Enter shelter name"
			s_new = gets.chomp
			if (pet_new[0].name == a_new) && (shelter_new[0].name == s_new) # existing pet details created previously to add to shelter?
				pet_sheltered = pet_new[0].new_sheltered_animal(shelter_new[0])
				puts "Assigned successfully: #{a_new} to #{pet_new.sheltered}"
				return true
			else
				puts "Unable to assign animals if they have not already been created!"
				puts "Animals already created include #{pet_new}"
			end
		elsif shelter_option == "mc"
			puts "|"
			puts "| ASSIGN CLIENT TO A SHELTER"
			puts "|"
			puts "Enter client name"
			c_new = gets.chomp
			puts "Enter shelter name"
			s_new = gets.chomp
			if (client_new[0].name == c_new) && (shelter_new[0].name == s_new) # existing client details created previously to add to shelter?
				client_sheltered = client_new[0].new_sheltered_client(shelter_new[0])
				puts "Assigned successfully: #{c_new} to #{client_new.sheltered}"
				return true
			else
				puts "Unable to assign clients if they have not already been created!"
				puts "Clients already created include #{client_new}"
			end
		elsif shelter_option == "d"
			puts "|"
			puts "| DISPLAY ALL"
			puts "|"
			puts "Animals created include: #{pet_new[0..-1]}"
			puts "Clients created include: #{client_new[0..-1]}"
			puts "Shelters created include: #{shelter_new[0..-1]}"
			return true
		elsif shelter_option == "main"
			main(pet_new, client_new, shelter_new)
		break if main_option == "q"
			return false
		break if !((shelter_new[0].relationships) == nil)
			adoption_options(pet_new, client_new, shelter_new) until false

		else
			p "Incorrect option entered!"
			return true
			break 
		end 
	end
end

def adoption_options(pet_new, client_new, shelter_new)
	puts "|"
	puts "| UPDATE ADOPTION OPTIONS\n"
	puts "|"
	p "Currently #{client_new.name} has '#{client_new.pets_qty}' pets.\n"
	p "Currently #{pet_new.name} is adopted by #{pet_new.adopted}.\n"
	p ""
	p "Type: adopt - For #{client_new.name} to adopt #{pet_new.name}.\n"
	p "Type: free  - For #{pet_new.name} to become adoptable. \n"
	p "Type: q  - To quit. \n"
	adopt_option = gets.chomp
	while adopt_option != nil 
		if adopt_option == "adopt" 
			if !(pet_new.adopted == client_new.name)
				pet_new.adopted = client_new.name
				client_new.pets_qty += 1
				puts "Animal #{pet_new.name} has been adopted by #{pet_new.adopted}"
				puts "Client #{pet_new.adopted} now has #{client_new.pets_qty} animals"
				return true
			else
				puts "Animal #{pet_new.name} has already been adopted by #{pet_new.adopted}"
				return true
			end
		elsif (adopt_option == "free") && (pet_new.adopted == client_new.name)
			pet_new.adopted = nil
			client_new.pets_qty -= 1
			puts "Animal #{pet_new.name} is no longer registered as being adopted"
			puts "Client #{client_new.name} now has #{client_new.pets_qty} animals"
			return true
		elsif adopt_option == "free"
			pet_new.adopted = nil
			puts "Animal #{pet_new.name} is no longer registered as being adopted"
			return true
		else
			p "Incorrect option entered!"
			return true
		break if adopt_option == "q"
			return false
		end 
	end
end 

until false
	menu(nil, nil, nil) 
end
