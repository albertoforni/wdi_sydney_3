class Client
	attr_accessor :name, :age, :children_qty, :pets_qty, :sheltered

	def initialize (name, age, children_qty, pets_qty=0, sheltered)
		@name = name
		@age = age
		@children_qty = children_qty
		@pets_qty = 0
		@sheltered = sheltered
	end

	def new_sheltered_client(shelter)
    	@sheltered = shelter
    	p "#{@sheltered}"
    	p "#{sheltered}"
    	p "#{name} client is now sheltered at #{sheltered.shelter_name}!"
    end
end