require './animal-prompt'
require './person-prompt'
require './shelter-prompt'

def main_menu(shelter)
	puts "Select an Option to procede."
	puts "1 - create an animal "
    puts "2 - create an client "
	puts "3 - display all animals "
    puts "4 - display all clients "
    puts "5 - facilitate client adopts an animal "
    puts "6 - facilitate client puts an animal up for adoption "
    puts "7 - clear the console "
    puts "8 - exit or break "

    option = gets.strip
    case option
    when "1"
    	animal = Animal.create_animal
    	shelter.add_animal(animal)
    	main_menu(shelter)
    when "2"
    	person = Person.create_person
    	shelter.add_person(person)
    	main_menu(shelter)
    when "3"
      	shelter.display_animals
      	main_menu(shelter)
    when "4"
     	shelter.display_people
     	main_menu(shelter)
    when "5"
    	puts "Enter animal name: "
    	name = gets.chomp.downcase
    	shelter.adopt_animal(name)
    	main_menu(shelter)
    when "6"
	when "7"
		puts "\e[H\e[2J"
		main_menu(shelter)
	when "8"
		
    else
      puts "Choose valid options in {1,2,3,4,5,6,7}."
      main_menu
    end
  
end





# a1 = Animal.new('Timmy', 4, 'male', 'dog')
# a2 = Animal.new('Tommy', 4, 'male', 'dog')

# a1.add_toy('airplane')
# a1.add_toy('train')
# a1.add_toy('legobubble')



# p1 =  Person.new('Beth', 30, 'female', 3)
# p2 =  Person.new('Loath', 30, 'male', 3)


# s1.add_animal(a1)
# s1.add_animal(a2)

# s1.add_person(p1)
# s1.add_person(p2)
s = Shelter.new('HappiTails', '10 East 21st Street')
main_menu(s)

 