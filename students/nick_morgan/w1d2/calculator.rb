# A user should be given a menu of operations
# A user should be able to choose from the menu
def menu ()
  puts "Would you like to perform (basic) calculations or (advanced) calculations?"

  selection = gets.chomp
	while selection != "q"
	  if selection.downcase == "basic"
	  	basic_calc
	  elsif selection.downcase == "advanced"
	  	advanced_calc
	  
	  else
	  	menu
	  end
	end
end


# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
def basic_calc
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "

  input = gets.chomp


	  if input == "a"
	  	puts "What is the first value you would like to add?"
		a1 = gets.chomp.to_i
		puts "What is the second value you would like to add?"

	  	a2 = gets.chomp.to_i

	  	puts "sum = " + (a1 + a2).to_s

	  	menu

	  elsif input == "s"
	  	puts "What is the first value you would like to subtract?"

	  	s1 = gets.chomp.to_i

	  	puts "What is the second value you would like to subtract?"

	  	s2 = gets.chomp.to_i

	  	puts "difference = " + (s1 - s2).to_s

	  	menu


	  elsif input == "m"
	  	puts "what is the first value you would like to multiply?"

	  	m1 = gets.chomp.to_i

	  	puts "What is the second value you would like to multiply?"

	  	m2 = gets.chomp.to_i

	  	puts "result = " + (m1 * m2).to_s

	  	menu

	  elsif input == "d"
	  	puts "what is the first value you would like to divide?"

	  	d1 = gets.chomp.to_i

	  	puts "What is the second value you would like to divide by?"

	  	d2 = gets.chomp.to_i

	  	puts "result = " + (d1 / d2).to_s

	  	menu

	  else
	  	puts "Please select one of the four calculations: (a)dd, (s)ubtract, (m)ultiply, (d)ivide"

	end

end

def advanced_calc
  print "(p)ower, (s)qrt: "

  input = gets.chomp

	  if input == "p"
	  	puts "What number would you like the power of?"
		p1 = gets.chomp.to_i
		puts "And what power would you like it to?"

	  	p2 = gets.chomp.to_i

	  	puts "#{p1} to the power of #{p2} = " + (p1**p2).to_s

	  	menu

	  elsif input == "s"
	  	puts "What number would you like the square root of?"
	  	sq = gets.chomp.to_i
	  	puts "The square root of #{sq} is " + (sq**0.5).to_s

	  	menu

	  else
	  	puts "Please select one of the two calculations: (p)ower, (s)qrt"

	end


end




response = menu

# This process should continue until the user selects a quit option from the menu
while response != 'q'

  response = menu
end