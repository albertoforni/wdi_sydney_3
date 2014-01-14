class Shelter
	attr_accessor :name,:address,:animals,:people

	def initialize(name,address)
		@name=name
		@address = address
		@animals = []
		@people = []
		@all_adopt_animals |={}
	end


	def add_animal(animal)
		@animals << animal
	end

	def add_person(person)
		@people << person
	end

	def to_s
		 "#{name} shelter at #{address} has #{animals.size} animals and #{people.size} people"
	end

	def display_animals
		@animals.each do |animal|
			puts "-- #{animal.name}"
		end
	end

	def display_people
		@people.each do |person|
			puts "-- #{person.name}"
		end
	end

	def adopt_animal(animal)
		index = nil
		if (@animals.size > 0 && @people.size > 0)

			@animals.each do |a|
  				if (a.name == animal)
  					index = @animals.find_index(a)
  				end
  			end
  			animal = @animals[index]

		    Person.add_pet(animal)
		    @all_adopt_animals[@name] = animal
		    remove_animal_by_index(index)
		else
			puts "No animals left to adopt"
		end
  	end

  	def remove_animal_by_index(index)
  		@animals.delete_at(index)
  	end

  	def remove_animal(animal)
  		@animals.each do |a|
  			if (a.name == animal.name)
  				index = @animals.find_index(a)
  			end
  		end
  		@animals.delete_at(index)
  	end

end