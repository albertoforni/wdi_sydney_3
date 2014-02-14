# Create a Person class. A person will have a stomach and allergies
# Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.

class Person
	attr_accessor :stomach, :allergies, :name

	def initialize(stomach=[] , allergies="", name="") #in the parentheses is the default value that will be assigned if you don't provide one for each "Person" - only if you put an "="
		@stomach = stomach
		@allergies = allergies
		@name = name
	end

	def eat(food)


		if food.include? allergies
			# puts "Uh oh! #{food} contains allergins!"
			raise AllergyError, "Uh oh! #{food} contains allergins!"
		else
			stomach_fed = (stomach + food)
			puts "Now this is in #{self.to_s}'s stomach: #{stomach_fed}"
		end
	end

	def to_s
		return name
		#this returns the name attribute of whatever object is being called ".to_s"
	end


end

class AllergyError < StandardError
end


# Create a Person named Chris. Chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods

Chris = Person.new([], "gluten", "Chris")

Beth = Person.new([], "scallops", "Beth")


pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError

# 

p Chris.eat(pizza)

p Chris.eat(pan_seared_scallops)

p Chris.eat(water)

p Beth.eat(pan_seared_scallops)


# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exceptoin

