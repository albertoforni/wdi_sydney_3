require './person'

if File.exist? ("people.csv")
  f = File.new("people.csv", "r")
  f.readlines
end


loop do
  puts "Welcome to the Person Generator :)"
  puts "You can make new people here."
  puts "Start by giving your new person a name."

  name = gets.chomp

  puts "How old is #{name}?"

  age = gets.chomp

  puts "What is #{name}'s gender?"

  gender = gets.chomp

  new_person = Person.new("#{name}", "#{age}", "#{gender}")


  if File.exist? ("people.csv")
    f = File.new("people.csv", "a+")
    f.puts new_person
    
    f.close

  else

    f = File.new("people.csv", "w")

    f.puts new_person

    f.close
  end

  puts "If you are finished people-making, type 'q'. Otherwise, hit any key to continue!"

break if gets.chomp == "q"

end