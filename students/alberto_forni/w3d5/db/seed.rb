require 'faker'
require 'active_record'

dev_db_settings = {
  :adapter => 'postgresql',
  :username => 'albertoforni',
  :database => 'shelters',
  :encoding => 'utf8'
}

ActiveRecord::Base.establish_connection(dev_db_settings)

require '../models/shelter'
require '../models/animal'

3.times do
  shelter = Shelter.create(:name => Faker::Company.name, :max_capacity => rand(10..20))
  5.times do
    breed = ["dog", "cat", "bird"]
    shelter.animals.create(name: Faker::Name.first_name, breed: breed[rand(3)], age: rand(5), donated_at: (Time.now - 60*60*24))
  end
end

Shelter.all.each do |shelter|
  3.times do
    breeds = ["dog", "cat", "bird"]
    breeds.each { |breed| shelter.cages.create(breed: breed, num: 3) }
  end
end