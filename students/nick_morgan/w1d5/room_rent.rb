class Apartment 
	attr_accessor :address, :price, :avail

	def initialize(address="1", price=100, avail=false)
		@price = price
		@avail = avail
		@address = address
	end

	def to_s
		"#{price}#{avail}#{address}"
	end

end

class Person
	attr_accessor :name

	def initialize(name="")
		@name = name
		
	end

	def rent(apartment)
	end

	def to_s
		"#{name}"
	end
		
end

class Owner < Person
	attr_accessor :listing, :property

	def initialize(name="", listing=true, property=nil)
		@listing = listing
		@name = name
		@property = property
	end

	def new_listing (name, price, avail)
		property = Apartment.new(name, price, avail)
	end

	def to_s
		 "#{listing}, #{property}"
	end
end

class Tenant < Person
	attr_accessor :budget, :renting

	def initialize(name="", budget = 50, renting = false)
		@renting = renting
		@budget = budget
		@name = name
	end

	def to_s
		"#{renting}, #{budget}"
	end

	def search_listing(apartment)
		p "Tenant's budget is $#{budget}." 
		p "Apartment's price is $#{apartment.price}." 
		if budget > apartment.price
			return true
		else 
			return false
		end
	end

	# def make_booking(booking, match)
	# 	if match == true
	# 		booking.avail = false
	# 		p "Booked #{booking.name}'s apartment at #{booking.address}"
	# 	else
	# 		p "Not booked"
	# 	end

	end
end

john = Tenant.new("John", 150, false)
jack = Owner.new("Jack", true, "JacksHome")
global_property = jack.new_listing("6", 100, true)
match = john.search_listing(global_property)
# booking = john.make_booking(global_property, match)
puts "match is: #{match}"

puts "\nJack is; #{jack}"
puts "and his property is: #{jack.property}"
puts john.to_s
