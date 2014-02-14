counter = 0
dirname = 'receipts'

loop do

  puts "Receipt machine!"

  puts "What was the name of the company?"

  co_name = gets.chomp.to_s

  puts "What was the service/goods provided?"

  service = gets.chomp.to_s

  puts "How much did it cost?"

  cost = gets.chomp.to_s

  counter += 1 while File.exist?("#{dirname}/receipt#{counter}.txt")

  f = File.new("receipt#{counter}.txt", "w")

  f.puts "Company Name: #{co_name}"
  f.puts "Goods/Service Provided: #{service}"
  f.puts "Cost: $#{cost}"
  f.puts "Thank you for your patronage"

  f.flush

  f.close

  puts "Would you like to quit? (Type q to quit. Otherwise, type any key to continue.)"


  break if gets.chomp == "q"

end