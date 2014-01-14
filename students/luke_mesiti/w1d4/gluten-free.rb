# Create a Person class. A person will have a stomach and allergies
# Create a method that allows the person to eat and add arrays of food to their stomachs
# If a food array contains a known allergy reject the food.

class Person
	attr_accessor :stomach, :allergies

	def initialize()
		@stomach = {}
		@allergies = []
	end

	def eat(food, ingredients)
		begin
			s = allergies & ingredients
			# empty = "empty: #{p.empty?}"
			# p empty
			# puts "p = #{p}"
			e = s.empty?
			if !e
				raise AllergyError, "You can't eat this silly!"
			end
		rescue Exception => e
			puts e.message
		else
		 	stomach[food] = ingredients
		end
	end

	def known_allergy(allergy)
		@allergies << allergy
	end

end

class AllergyError < StandardError
end

# Create a Person named Chris. Chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods

pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError


# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exceptoin


chris = Person.new
chris.known_allergy("gluten")
# chris.known_allergy("scallops")
chris.eat("Pizza", pizza)
chris.eat("pan_seared_scallops", pan_seared_scallops)

puts "stomach contains: #{chris.stomach}"
puts "your allergies are : #{chris.allergies}"

# def lets_eat
# 	puts "What's your name: "
# 	n = gets.chomp

# 	n = Person.new
# 	p n

# 	puts "What are your allergies: "
# 	a = gets.chomp
# 	n.known_allergy(a)
# 	p n.allergies

# 	puts "What do you want to eat: "
# 	f = gets.chomp
# 	n.eat(f,f)
# 	p n.stomach
# end

# lets_eat
