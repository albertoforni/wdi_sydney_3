# def basic_calc
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "

  input = gets.chomp


  if input == "a"
  	puts "What is the first value you would like to add?"

  	a1 = gets.chomp.to_i

  	puts "What is the second value you would like to add?"

  	a2 = gets.chomp.to_i

  	puts a1 + a2

  elsif input == "s"
  	puts "What is the first value you would like to subtract?"

  	s1 = gets.chomp.to_i

  	puts "What is the second value you would like to subtract?"

  	s2 = gets.chomp.to_i

  	puts s1 - s2


  elsif input == "m"
  	puts "what is the first value you would like to multiply?"

  	m1 = gets.chomp.to_i

  	puts "What is the second value you would like to multiply?"

  	m2 = gets.chomp.to_i

  	puts m1 * m2

  elsif input == "d"
  	puts "what is the first value you would like to divide?"

  	d1 = gets.chomp.to_i

  	puts "What is the second value you would like to divide by?"

  	d2 = gets.chomp.to_i

  	puts d1 / d2

  else
  	puts "Please select one of the four calculations: (a)dd, (s)ubtract, (m)ultiply, (d)ivide"

end

