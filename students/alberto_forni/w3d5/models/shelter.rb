class Shelter < ActiveRecord::Base
  has_many :animals
  has_many :cages

  def max_capacity(breed = nil)
    breed ? self.cages.where(breed: breed).count : self.cages.count
  end

  def adopted_animals(breed = nil)
    self.animals.where(adopted: true)
  end

  def not_adopted_animals(breed = nil)
    breed ? self.animals.where(breed: breed, adopted: false) : self.animals.where(adopted: false)
  end

  def not_adopted_animals_count(breed = nil)
    breed ? self.animals.where(breed: breed, adopted: false).count : self.animals.where(adopted: false).count
  end

  def free_spot?(breed)
    self.max_capacity(breed) > self.not_adopted_animals_count(breed)
  end

  def self.free_spots(breed)
    shelters = Shelter.all

    free_shelters = []

    shelters.each do |shelter| 
      free_shelters << shelter if shelter.free_spot?(breed)
    end

    free_shelters
  end
end