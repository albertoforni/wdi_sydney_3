# Create a Person class. A person will have a stomach and allergies
# Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.

class AllergyError < RuntimeError
	
end

class Person
	attr_accessor :stomach, :allergies
	def initialize
		@stomach = []
	end

	begin

		def eat(food)
		# can you show the variable name in the string? eg pizza?
		
			puts "About to eat..."

			if food.include?(allergies)
			#	raise AllergyError, "You can't eat that! You'll have to throw it up!"
			raise AllergyError, "You can't eat that! You'll have to throw it up!"
		
			else
				stomach.concat(food)
				puts "Nom, Nom, Nom"
				puts "My stomach now contains: \n#{stomach}"
				puts
			end
		end
	end
	

end

# Create a Person named Chris. Chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods

pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError
beth = Person.new
beth.allergies = ("scallops")

chris = Person.new
chris.allergies = ("gluten")


chris.eat(water)
chris.eat(pan_seared_scallops)
chris.eat(pizza)

# beth.eat(water)
# beth.eat(pan_seared_scallops)
# beth.eat(pizza)




# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exceptoin