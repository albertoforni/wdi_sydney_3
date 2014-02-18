require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require 'active_record'
require 'active_support/all'
require 'pg'
require 'active_record/validations'
require 'pry' 
require 'pry-debugger'
require 'sinatra/reloader' if development?


use Rack::MethodOverride # allows use put and delete HTTP instead of just post / get

ActiveRecord::Base.establish_connection(
	:adapter => "postgresql",
	:username => "Luke",
	:database => "happitails",
	:host => "localhost"
)

class Shelter < ActiveRecord::Base

	has_many :donates
	has_many :adopts
	has_many :pets, through: :donates # join model

end

class Pet < ActiveRecord::Base

	has_one :donate
	has_one :adopt
	has_one :shelter, through: :donate

end

class Donate < ActiveRecord::Base

	belongs_to :shelter
	belongs_to :pet

end 

#class Adopt < ActiveRecord::Base
#
# 	belongs_to :shelter
# 	belongs_to :pet
#
#end 

get '/' do

	redirect to '/shelters'

end

################ VIEW SHELTERS ##################
get '/shelters' do 

	@shelters = Shelter.all

	erb :shelters 
end

################ VIEW INDIVIDUAL SHELTER DETAILS ####
get '/shelters/:id' do

	@shelter = Shelter.find(params[:id])
	#@donation_id = Donation.name()
	@donates_name = rand(2).to_s + ('A'..'Z').to_a.sample(2).join

	erb :pets
end

###### DONATE A PET TO A SPECIFIC SHELTER ###
get '/shelters/:id/pets' do

	@shelter = Shelter.find(params[:id])
	
	erb :create
end

post '/shelters/:id/pets/create' do

	@shelter = Shelter.find(params[:id])
	@pet = @shelter.pets.create!(:name => params[:name], :type_of => params[:type_of])
	@donate = @shelter.donates.create!(:pet_id => "#{@pet.id}", :shelter_id => params[:id])

	erb :donation
end

#	@pet = Pet.create!(:name => params[:name])#)
#	#@donate = Donate.create!(shelter: @shelter, pet: @pet)
#	@donate = Donate.create!(:name => params[:name], :pet_id => "#{@pet.id}")
#


################ CREATE NEW PET DONATION TO INDIVIDUAL SHELTER ####
# post '/shelters/:id/pets/donations/:donation_name' do

# 	@shelter = Shelter.find(params[:id]) # params taken from URL
# 	@pet = Pet.all #where(:shelter_id = params[:id])

# 	@donation = @shelter.pet.donation.create(:name => params[:donation_name])
# 	binding.pry

	#@pet = @shelter.pets.find(params[:id]).where(donation_id = params[:donation_id]) # params taken from URL
	#@pet = @shelter.donations new(:nameparams[:donation])


	#.new(params[:comment].merge(:created_at => Time.now, :post_id => params[:id]))


	#@donation = @pet.donations.create()
	# if  @pet.donations.count < @pets.shelter.max_capacity
	# 	@donation = @pet.donations.create(params[:donation]) # params taken from name key in form
	
	# 	erb :donation # shows receipt
	# else
	# 	@error = "Sorry, shelter capacity exhausted. Try another shelter!"
	# 	erb :pets
	# end

# 	erb :donation
# end

# ################ DELETE DONATION (ADOPTION) ######
# delete '/shelters/:id/pets/:pet_id/adoption' do
# 	@donation = Donation.where("pet_id = #{params[:pet_id]}")
# 	Donation.delete(@donation)
# 	Pet.delete(params[:pet_id])

# 	redirect to '/'
# end
