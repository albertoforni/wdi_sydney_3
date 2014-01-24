# a shelter can add clients and hold animals for adoption
# a shelter can be an owner of a pet
class Shelter
	attr_accessor :name, :clients, :pets
	def initialize(name)
		@name = name
		@clients = []
		@pets = []
	end

	# def to_s
	# 	"#{name}"
	# end

	def put_up_for_adoption(animal)
		animal.owner = self
		@pets << animal
	end

	# def existing_client(name_chk, clients)
	# 	# check to see if client name already exists, if it does add to their pets array
 #  	if clients.find { |client| client.name == name_chk } == false
 #  		name = name_chk.downsize.strip
 #  		name = Client.new(name_chk)
 #  	else


 #    # when there is no name it will create a new client
 #    if existing_client == nil
	# 	client_name = Client.new(name)

end