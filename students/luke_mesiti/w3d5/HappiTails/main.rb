require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'happitails'
)

after do
    ActiveRecord::Base.connection.close
end

require './models/shelter'
require './models/pet'

# require 'pry'
# require 'pry-debugger'

get '/' do
     redirect to '/shelters'
end

get '/shelters' do
    @shelters = Shelter.all
    erb :list
end

get '/shelters/:id' do
    @shelter = Shelter.find(params[:id])
    @sortvar = params[:sort] || "donated_at"

    if params[:filter] # FILTER ON SPECIES OR BREED
        @pets = Pet.where("#{params[:type]} = ? AND shelter_id = ?", params[:filter], params[:id]).order(@sortvar => :asc).all
    elsif params[:min_age] # FILTER ON AGE
        @pets = Pet.where("shelter_id = ?", params[:id]).order(@sortvar => :asc).where(age: params[:min_age]..params[:max_age]).all
    else 
        @pets = Pet.where("shelter_id = ?", params[:id]).order(@sortvar => :asc).all
    end

    # determine filter options
    @filter_on_species = Pet.where("shelter_id = ?", params[:id]).select(:species).distinct
    @filter_on_breed = Pet.where("shelter_id = ?", params[:id]).select(:breed).distinct

    erb :shelter
end

post '/shelters/:id/pets' do
    @shelter = Shelter.find(params[:id])
    @pets = Pet.where("shelter_id = ?", params[:id]).all



    # check that there is capacity
    capacity = @shelter.maximum_capacity
    number_of_donated_pets = @pets.count
    if number_of_donated_pets+1 > capacity
        @message = "Capacity for this shelter has been reached."
        @shelters_with_capacity = Shelter.where("maximum_capacity > ?", Shelter.count).all
        return erb :shelter
    end

    @pet = Pet.create(params[:pet])
    erb :shelter
end

put '/shelters/:id/adopt' do
    @pet = Pet.find(params[:pet_id])
    @pet.update_attributes(:adopted => 'TRUE', :shelter_id => nil)

    @shelter = Shelter.find(params[:id])
    @pets = Pet.where("shelter_id = ?", params[:id]).all

    erb :shelter
end


