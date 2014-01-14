# Create a Person class. A person will have a stomach and allergies
# Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.

class Person
	attr_accessor :name, :stomach, :allergy

	def initialize(allergen)
		@name = name
		@stomach = []
		@allergy = allergen 

	end

end


# Create a Person named Chris. Chris is allergic to gluten.
class Chris < Person
	def initialize(allergy="gluten")
		#@name = "chris"
		super
	end

end

# Create a Person named Beth. Beth is allergic to scallops.
class Beth < Person
	def initialize(allergy="scallops")
		#@name = "beth"
		super
	end

end

#define the allergy error...
class AllergyError < StandardError
 #this extends the attributes of a StandardError with a new name.
end

def scoff_food (person_picked, meal)


	#make the selected person's stomach equal the array of the food eaten
	person_picked.stomach = meal
	puts "Their stomach currently contains #{person_picked.stomach}"
	begin
		# When a person attempts to eat a food they are allergic to, raise a custom exception
		# For example:  AllergyError
		if person_picked.stomach.include?("#{person_picked.allergy}")
		person_picked.stomach = []
		raise AllergyError, "You can't eat that, silly!"
		end		
	rescue
		puts "Uh oh... #{meal} is all over the floor... maybe eat something else?"
		return false
	else
		puts "Mmmmm.... delicious!!"
		return true
	end

end

# Feed them the following foods
pizza = ["cheese", "gluten", "tomatoes"]
scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]


chris = Chris.new
beth = Beth.new


## START EXECUTING CODE FROM HERE

keep_eating = true
while keep_eating == true

puts "Who do you want to feed? chris or beth?"
hungryperson = gets.chomp.downcase

puts "Whaddya wanna feed them? Pizza, Scallops or just Water?"
dinner = gets.chomp.downcase



#based on what food is picked - substitute the string with the array. (This allows us to pass it in scoff_food method)
case dinner
	when "pizza"
		dinner = pizza.clone
	when "scallops"
		dinner = scallops.clone
	when  "water"
		dinner = water.clone
	else 
		puts "Sorry, we don't cook #{meal}. We aren't great chefs"
end


#based on who is picked as the person, run the method passing their name...
if hungryperson == "chris"
	if scoff_food(chris, dinner) == true
		puts "Eat something else? (Y)es or (N)o"
		try_again = gets.chomp.upcase
		if try_again == "Y"
			keep_eating = true
		else
			keep_eating = false
		end
	end

elsif hungryperson == "beth"
	if scoff_food(beth, dinner) == true
		puts "Eat something else? (Y)es or (N)o"
		try_again = gets.chomp.upcase
		if try_again == "Y"
			keep_eating = true
		else
			keep_eating = false
		end
	end

else
	"Sorry, we're only feeding Chris and Beth tonight."
	keep_eating = false
end

end






# Bonus: When a person attempts to eat a food they are allergic to,
# remove ALL the food from the person's stomach before raising the exceptoin