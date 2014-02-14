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
  :database => "cinema"
)

class Theatre < ActiveRecord::Base
  has_many :screenings
end

class Movie < ActiveRecord::Base
  has_many :screenings
end

class Screening < ActiveRecord::Base
  belongs_to :theatre
  belongs_to :movie
  has_many :tickets
end

class Ticket < ActiveRecord::Base
  belongs_to :screening
end


get '/' do
  @movies = Movie.all
  erb :index
end

get '/movies/:id' do
  @movie = Movie.find(params[:id])
  @screenings = @movie.screenings.all
  erb :screenings
end

post '/movies/:movie_id/screenings/:screening_id/tickets' do
  @movie = Movie.find(params[:movie_id])
  @screening = @movie.screenings.find(params[:screening_id])
  if @screening.date_time < Time.now.utc
    erb :old_ticket
  else
    if @screening.tickets.count < @screening.theatre.max_capacity
      @ticket = @screening.tickets.create(params[:ticket])
      erb :ticket
    else
      erb :ticket_error
    end
  end
end