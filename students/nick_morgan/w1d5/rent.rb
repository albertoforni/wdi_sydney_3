class Apartment 
	attr_accessor :address, :price, :avail

	def initialize(address="1", price=100, avail=false)
		@price = price
		@avail = avail
		@address = address
	end

	def to_s
		"#{price}, #{avail}, #{address}"
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

	# def new_listing (name, price, avail)
	# 	property = Apartment.new(name, price, avail)
	# end

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

end

John = Tenant.new("John", 150, false)

