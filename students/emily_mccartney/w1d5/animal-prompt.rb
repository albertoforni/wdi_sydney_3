# Define Animal as a class
class Animal

  attr_accessor :name, :a_age, :petsname, :gender, :toys

  def initialize(name=nil, a_age=nil, petsname=nil, gender=nil, toys =[])
  end
  def to_s
    "The animal is a #{@name} their name is #{petsname}. The age is #{@a_age}. The gender is #{@gender}. The toys are #{@toys}."
  end
end

class Client

  attr_accessor :name, :children, :age, :numpets, :pets

  def initialize(name=nil, children=nil, age=nil, numpets=nil, pets=[])
  end 
  def to_s
    "The Clients name is #{@name}. You have #{@children} children. You are #{@age} years old. You have #{numpets} pets and their name(s) are #{@pets}."
  end 
end 

class Shelter 
   attr_accessor :shelter_name, :animals, :shelter_description

   def initialize(shelter_name)
    @shelter_name = shelter_name
    @animals =[]
    @shelter_description = shelter_description
  end
  def add_animal(animal)
    animals << animal
    puts "I now have #{animals.count} animals"
  end
  def add_client(client)
    clients << client
    puts "There are  #{clients.count} clients"
  end

end 

animal1 = Animal.new
animal1.name = "monkey"
animal1.petsname = "chimps"
animal1.a_age = 2
animal1.gender = "male"
animal1.toys = ["ball", "bark","stick"]

animal2 = Animal.new
animal2.name = "turtle"
animal2.petsname = "jack"
animal2.a_age = 2
animal2.gender = "male"
animal2.toys = ["bark","stick"]

client1 = Client.new
client1.name = "emily"
client1.children = 4
client1.age = 22
client1.numpets = 2
client1.pets = ["monkey", "bella"]


newshelter= Shelter.new("HapiTails")
#prints out the shelter name and the animals in there
# newshelter.add_animal(animal1)

animals =[animal1, animal2]
clients = [client1]
pets = []
adopted_pets = []
  

puts "Welcome to #{newshelter.shelter_name} Animal Shelter"
loop do 
#shelter will display the count of anaimals and the count of clients 
puts "Here at #{newshelter.shelter_name} we have #{animals.count} animals and have #{clients.count} clients."
puts "-----------------"
puts "Choose what you want to do?"
puts "Create a client type --- cc /// Add an animal type --- ca" 
puts "Look at clients type --- clients /// Look at the animals in the shelter type --- animals" 
puts "Adopt an animal type --- adopt"
puts "----------------"
puts "To exit type --- q"
client_command = gets.chomp.downcase

break if client_command == "q"

#ask do you want to add a client? If they want to add a client it asks them to put in their details all these details will be stored in the clients array. This will add them to the clients list

if client_command == "cc"
  puts "what is your name?"
  c_name = gets.chomp.downcase

  puts "how many children do you have?"
  c_children = gets.chomp.to_i

  puts "How old are you?"
  c_age = gets.chomp.to_i
  
  puts "How many pets do you have?"
  c_num_pets = gets.chomp.to_i

  puts "what are your pets names?"
  c_pets = gets.chomp.downcase

  client_create = Client.new
  client_create.name = c_name
  client_create.children = c_children
  client_create.age = c_age
  client_create.numpets = c_num_pets
  client_create.pets = c_pets

  clients.push(client_create)

#do you want to add animals to the shelter? if they want to add an animal to the shelter it asks for the details of the animal and then it adds the animal to the animal array.

elsif client_command == "ca"
  puts "what animal do you want to add?"
  a_name = gets.chomp.downcase

  puts "what is your pets name?"
  pets_name = gets.chomp.downcase

  puts "How old is #{pets_name}?"
  a_age = gets.chomp.to_i

  puts "Is you pet male or female?"
  a_gender = gets.chomp.downcase

  puts "What toys does your #{pets_name} have?"
  a_toys = gets.chomp.downcase

  animal_create = Animal.new
  animal_create.name = a_name
  animal_create.petsname = pets_name
  animal_create.a_age = a_age
  animal_create.gender = a_gender
  animal_create.toys = a_toys

  animals.push(animal_create)

elsif client_command == "clients"
  puts clients.map{|client| client.name}

  puts "what client do you want to see?"
  clients_information = gets.chomp.downcase

  client_listing = clients.find{|client| client.name == clients_information }

  puts client_listing

 elsif client_command == "animals"
  puts animals.map{|animal| animal.name}

  puts "What animal do you want to see?"
  animal_information = gets.chomp.downcase

  animal_listing = animals.find{|animal| animal.name == animal_information }

  puts animal_listing

#do you want to adopt pets? if so it will display the animals and then the client can select it and it will go into their client pets array. 

elsif client_command == "adopt"
  puts "What animal would you like to adopt?"
  animal_names = animals.map{|animal| animal.name}
  puts animal_names

  user_adopt = gets.chomp.downcase

  user_adopt = animals.pop
  adopted_pets.push(user_adopt)

else client_command != "adopt" || "cc" || "ca" || "clients" || "animals"
  puts "*************"
  puts "Please enter in a valid option"
  puts "*************"


# def adopt_pet(user_adopt)
#   animals.reject!{|animal| animal.name == user_adopt}
# end


# i = animal_names.any? {|animal| user_adopt.include?(animal) }
#       puts i
#   if i == true   
#     animals.reject!{animal_names.any? {|animal| user_adopt.include?(animal) }}
#   else 
#     puts "that animal isnt there"
#   end



  # idont = animals.include?(user_adopt)
  # puts idont
  # if idont == true
  # delete!

  # elsif animal_names.include?(user_adopt)
  # animal_names.reject!{|animal| user_adopt == animal_names}

  # elsif 
  #   puts "there isnt that animal listed"
  # end
    

end

end

