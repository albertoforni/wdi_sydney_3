# Define Person as a class
class Person

  # Set up accessors and mutators for the attributes of an Animal
  # attr_accessor sets up both for you
  attr_accessor :name, :age, :pets, :gender,:no_child

  # Used when creating a new animal.
  #   Example:
  #       Person.new('Beth', 30, 'female', 3)
  def initialize(name, age, gender, no_child)
    @name = name
    @age = age
    @gender = gender
    @no_child = no_child
    @pets |= []
  end

  def self.create_person
    print "Enter person name: "
    name = gets.chomp.downcase
    print "Enter person age: "
    age = gets.chomp.downcase
    print "Enter person gender: "
    gender = gets.chomp.downcase
    print "Enter number of children : "
    children = gets.chomp.downcase

    person = Person.new(name,age,gender,children)
  end


  def self.add_pet(pet)
    @pets << pet
  end

  def display_pets
    @pets.each do |pet|
      puts pet.upcase
    end
  end

  # When we display the animal using puts or print, the
  #   to_s method is called to pretty print an Animal
  def to_s
      "#{name} is a #{age} year old #{gender} with #{no_child} kids and #{@pets.size} pets"
  end
end