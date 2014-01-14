
# Create a Person class. A person will have a stomach and allergies

class Person
 attr_accessor :allergies, :stomach
  # Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.

  def initialize(stomach=[], allergies="")
  @stomach = stomach
  @allergies = allergies
  end

  def eat(food)
   begin
   if food.include? allergies

   raise AllergyError  
    
   elsif food != allergies
    inside_stom = (stomach + food)
     stomach = inside_stom
    puts "Yay you can eat this, this is in your stomach #{stomach}"
   

   end
   
   rescue AllergyError 
       puts "Uh oh! your food contains allergins!"
    
   end
  end
end


# Feed them the following foods
pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "oliveoil"]
water = ["h", "h", "o"]

 
# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError

class AllergyError < StandardError
end


#TRIED A LOOP

# if 'pizza' 
#   eat(pizza)
#   if 'pan pan_seared_scallops'
#    eat(pan_)
# chris = Person.new([], "gluten")


# loop do |food|
# puts "What do you want to eat? (pizza, pan_seared_scallops or water)"
# food = gets.chomp.downcase
# # puts "what is your allergy? (cheese, gluten, tomatoes, scallops, lemons, pasts or oliveoil)"
# # allergies = gets.chomp.downcase

# break if food == "q"
# puts food
# chris.eat(food)
# end

# Create a Person named Chris. Chris is allergic to gluten.
Chris = Person.new([], "gluten")


# Create a Person named Beth. Beth is allergic to scallops.
Beth = Person.new([], "scallops")

Chris.eat(pizza)
Chris.eat(pan_seared_scallops)
Chris.eat(water)
puts "-----------------------------------------"
Beth.eat(pizza)
Beth.eat(pan_seared_scallops)
Beth.eat(water)
