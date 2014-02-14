require "pg"

conn = PGconn.open(:dbname => 'students')

results = conn.exec('SELECT given_name,surname FROM people')

results.each do |row|
  puts row['given_name']
end

puts 
puts results.getvalue(2,0) # gets the 2nd row and first column