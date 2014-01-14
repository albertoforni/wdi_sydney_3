class Shelter
	attr_accessor :current_animals, :current_clients

	def initialize(current_animals, current_clients)
		@current_animals = current_animals
		@current_clients = current_clients
	end

	def to_s
		puts "====HappyTails Shelter===="
		puts "Current animals: "
		@current_animals.each do |key, value|
			puts value.to_s
		end

		puts "Current clients:"
		@current_clients.each do |key, value|
			puts value.to_s
		end

	end

end




