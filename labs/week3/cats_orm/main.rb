require 'sinatra'
require 'pry'
require 'pry-debugger'
require 'sinatra/reloader' if development?

require 'active_record'
require 'active_record/validations'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :username => "daniel",
  :database => "cats"
)

class Toy < ActiveRecord::Base
  belongs_to :cat

  validates :name, :numericality => true
end

class Cat < ActiveRecord::Base
  has_many :toys    
end

get '/' do
  @cats = Cat.all

  erb :home
end

get '/cats/new' do
  @cat = Cat.new
  erb :new
end

post '/cats' do
  binding.pry
  Cat.create(params[:cat])
  redirect to '/' 
end

get '/cats/:id' do
  @cat = Cat.find(params[:id])
  @toys = @cat.toys
  erb :show
end

post '/cats/:id/toys' do
  @cat = Cat.find(params[:id])
  @toy = @cat.toys.new(params[:toy])

  if @toy.save
    redirect to "/cats/#{@cat.id}"
  else
    @toys = @cat.toys.reload
    erb :show
  end
end

delete '/cats/:id' do
  cat = Cat.find(params[:id])
  cat.delete
  redirect to '/'
end

get '/cats/:id/edit' do
  @cat = Cat.find(params[:id])
  erb :edit
end

put '/cats/:id' do
  @cat = Cat.find(params[:id])
  if @cat.update_attributes(params[:cat])
    redirect to '/'
  else    
    erb :edit
  end
end
