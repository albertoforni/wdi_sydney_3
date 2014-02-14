class Shelter
	attr_accessor :name, :address, :clients, :animals

	def initialize(name, address, clients, animals)
		@name = name
		@address = address
		@clients = clients
		@animals = animals
	end

	def to_s
		"#{name} shelter at #{address}. Client List = #{clients}, Animal List= #{animals}"
	end

	def add_client(client)
		clients << client
		puts "Adding #{client} to list of clients"
	end

	def add_animal(animal)
		animals << animal

		puts "Adding #{animal.name} to list of animals"
	end

end

happi_tails = Shelter.new("Happi Tails", "16 East 96th Street", [], [])

# puts HappiTails

# HappiTails.clients << "Beth"

# HappiTails.clients << "Joe"

# puts HappiTails

# HappiTails.add_client("Jack")

# puts HappiTails

# HappiTails.add_animal("Murphy")

# puts HappiTails
