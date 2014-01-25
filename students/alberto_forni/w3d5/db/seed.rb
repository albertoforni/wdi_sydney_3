require 'faker'
require 'active_record'

dev_db_settings = {
  :adapter => 'postgresql',
  :database => 'shelters',
  :encoding => 'utf8'
}

ActiveRecord::Base.establish_connection(dev_db_settings)

require '../models/shelter'
require '../models/animal'

3.times do
  shelter = Shelter.create(:name => Faker::Company.name)
  5.times do
    breed = ["dog", "cat", "fish"]
    shelter.animals.create(name: Faker::Name.first_name, breed: breed[rand(3)], age: rand(5))
  end
end