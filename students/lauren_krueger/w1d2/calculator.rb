def menu
	puts "Welcome to the Ruby Calculator."
	puts "What operations would you like to perform?"
	basic_calc
end

# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
def basic_calc
  puts "(a)dd, (s)ubtract, (m)ultiply, (d)ivide, (p)ower, (sq)rt: "
  puts "Enter 'q' to quit."
  input = gets.chomp
  result = 0

  case input
  	when "a"
  		first_num = ask_number("first")
  		second_num = ask_number("second")
  		result = first_num + second_num
  	when "s"
  		first_num = ask_number("first")
  		second_num = ask_number("second")
  		result = first_num - second_num
  	when "m"
  		first_num = ask_number("first")
  		second_num = ask_number("second")
  		result = first_num * second_num
  	when "d"
  		first_num = ask_number("first")
  		second_num = ask_number("second")
  		result = first_num / second_num
  	when "p"
  		first_num = ask_number("first")
  		second_num = ask_number("second")
  		result = first_num ** second_num
  	when "sq"
  		first_num = ask_number("first")
  		result = Math.sqrt(first_num)
  	when "q"
  		result = "q"
  	end

  	puts result

  end

  def ask_number(position)
  	print "#{position} number: "
  	gets.chomp.to_f
  end

  response = menu

  # This process should continue until the user selects a quit option from the menu

  while response != 'q'
  	response = menu
  end
