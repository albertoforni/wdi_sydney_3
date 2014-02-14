require 'pry'
require 'sinatra'
require 'pry-debugger'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'
require 'active_record'
require 'date'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "shelters"
)

class Shelter < ActiveRecord::Base
  has_many :pets
end

class Pet < ActiveRecord::Base
  belongs_to :shelter
end

get '/' do
  @shelters = Shelter.all

  erb :index
end

get '/shelters/:id' do
  @shelter = Shelter.find(params[:id])
  @pets = @shelter.pets.all
  erb :show
end

get '/shelters/:shelter_id/donate' do
  @shelter = Shelter.find(params[:shelter_id])
  @pet = Pet.create(params[:pet])

  erb :donate
end

post '/shelters/:shelter_id/donate' do
  @shelter = Shelter.find(params[:shelter_id])
  @pet = Pet.new

  redirect to '/shelters/:id'
end

# post '/shelters/adopt'

#   erb :adopt
# end