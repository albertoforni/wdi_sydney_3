require './person'
require 'pg'

conn = PG.connect( :dbname  => 'people' )




# if File.exist? ("people.csv")
#   f = File.new("people.csv", "r")
#   f.readlines
# end


loop do
  puts "Welcome to the Person Generator :)"
  puts "You can make new people here."
  puts "Start by giving your new person a name."

  name = gets.chomp

  puts "How old is #{name}?"

  age = gets.chomp

  puts "What is #{name}'s gender?"

  gender = gets.chomp

  new_person = conn.exec("INSERT INTO people (given_name, gender, age) VALUES ('#{name}','#{gender}',#{age})")


  # if File.exist? ("people.csv")
  #   f = File.new("people.csv", "a+")
  #   f.puts new_person
    
  #   f.close

  # else

  #   f = File.new("people.csv", "w")

  #   f.puts new_person

  #   f.close
  # end



  puts "If you are finished people-making, type 'q'. Otherwise, hit any key to continue!"


  people = conn.exec("SELECT * FROM people")

  people.each do |person|
    puts person.values.join(",")
  end

break if gets.chomp == "q"

end