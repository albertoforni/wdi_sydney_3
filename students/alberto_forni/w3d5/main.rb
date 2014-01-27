require 'sinatra'
require 'active_support/all'
require 'active_record'

if development?
  require 'sinatra/reloader'
  require 'pry'
  require 'pry-debugger'
end

ActiveRecord::Base.establish_connection(
  :adapter  => 'postgresql',
  :username => 'albertoforni',
  :database => 'shelters'
)

require './models/shelter'
require './models/animal'
require './models/cage'

# home => show list
get '/' do
  redirect to '/shelters'
end

# #
# shelter
# #

# show list
get '/shelters' do
  @shelters = Shelter.all

  erb :"shelters/index"
end

# display single shelter
get '/shelters/:id' do
  @shelter = get_shelter(params[:id])

  # ++++ order by
  @order_by = {
    donated_at: 'Donated At',
    name: 'Name',
    breed: 'Breed',
    age: 'Age'
  }

  @current_order = params[:sort] && @order_by[params[:sort].to_sym] ? params[:sort].to_sym : :donated_at
  @direction = params[:dir] == 'desc' ? :desc : :asc
  # ---- order by

  # get breeds
  @breeds = @shelter.animals.all.map { |animal| animal.breed }.uniq

  # display animals
  animals = @shelter.not_adopted_animals.order(@current_order => @direction)
  @animals = 
    if params[:breed].present? && params[:age].present?
      @filters = {
        breed: params[:breed],
        age: params[:age]
      }
      animals.where(breed: params[:breed]).where("age <= ?", params[:age])
    elsif params[:breed].present?
      @filters = {
        breed: params[:breed],
      }
      animals.where(breed: params[:breed])
    elsif params[:age].present?
      animals.where("age <= ?", params[:age])
      @filters = {
        age: params[:age]
      }
    else
      @filters = {}
      animals
    end

  erb :"shelters/show"
end

def get_shelter(id)
  redirect to '/' unless Shelter.find_by_id(id)
  Shelter.find(id)
end

# #
# animal
# #

# show adopted animals
get '/shelters/:id/animals' do
  @shelter = get_shelter(params[:id])
  @animals = @shelter.adopted_animals

  erb :"animals/adopted"
end

# donate new animal form
get '/shelters/:id/animals/new' do
  @shelter = get_shelter(params[:id])
  @animal = @shelter.animals.new()

  erb :"animals/new"
end

# donate animal submit
post '/shelters/:id/animals' do
  @shelter = get_shelter(params[:id])
  breed = params[:animal][:breed]

  unless @shelter.free_spot?(breed)
    @message = "The shelter if full"
    @free_shelters = Shelter.free_spots(breed)
    @shelters = Shelter.all

    return erb :"shelters/index"
  end

  @animal = @shelter.animals.new(params[:animal])
   
  if @animal.save
    redirect to "/shelters/#{ @shelter.id }"
  else
    @errors = @animal.errors.messages
    erb :"animals/new"
  end
end

# adopt animal
delete '/shelters/:shelter_id/animals/:animal_id' do
  @shelter = get_shelter(params[:shelter_id])

  @shelter.animals.find(params[:animal_id]).update_attributes(adopted: true)

  redirect to "/shelters/#{params[:shelter_id]}"
end