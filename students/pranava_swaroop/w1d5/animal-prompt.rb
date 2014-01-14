# Define Animal as a class
class Animal

  # Set up accessors and mutators for the attributes of an Animal
  # attr_accessor sets up both for you
  attr_accessor :name, :age, :gender, :species, :toys

  # Used when creating a new animal.
  #   Example:
  #       Animal.new('Timmy', 4, 'male', 'toad')
  def initialize(name, age, gender, species)
    @name = name
    @age = age
    @gender = gender
    @species = species
    @toys = []
  end


  def add_toy(toy)
    @toys << toy
  end

  def toys
    @toys
  end

  # When we display the animal using puts or print, the
  #   to_s method is called to pretty print an Animal
  def to_s
      "Tiny is a 3 year old male cat that loves mice, string"
      "#{name} is a #{age} year old #{gender} #{species} that loves #{toys.join(', ')}"
  end

  def self.create_animal
    print "Enter animal name: "
    name = gets.chomp.downcase
    print "Enter animal age: "
    age = gets.chomp.downcase
    print "Enter animal gender: "
    gender = gets.chomp.downcase
    print "Enter animal species: "
    species = gets.chomp.downcase
    print "Does it have a toy: "
    yorn = gets.chomp.downcase
    if yorn == 'y'
      print "Enter a toy name"
      toy = gets.chomp.downcase
      add_toy(toy)
    end

    animal = Animal.new(name,age,gender,species)
  end

end