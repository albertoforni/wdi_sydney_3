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

class Cat < ActiveRecord::Base
  validates :name, :presence => true, 
    :uniqueness => true, 
    :length => { :in => 2..255 } #, :message => "%value is a crappy name, try again"

  # validates :password, :on => :create, :presence => true

  # validates :age, :numericality => { 
  #   :only_integer => true, 
  #   :greater_than_or_equal_to => 18, :allow_blank => true, }

  # validates :gender, 
  #   :inclusion => { :in => ['m','f'] }, 
  #   :message => " %{value} is not a valid gender, pls enter m/f"

  # validate_presence_of :name
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
  erb :show
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
