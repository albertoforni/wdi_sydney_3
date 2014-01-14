def menu
	puts "What operations do you wanna do?"
	save = basic_calc
  puts "#{save}"
end
def basic_calc
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide. (e)xponent, (sq)uare root"
  input = gets.chomp
  result = 0
  case input
  when"a"
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
  when "ex"
  	first_num = ask_number("first")
  	second_num = ask_number("second")
  	result = first_num ** second_num
  when "sq"
 	first_num = ask_number("first")
  	result = Math.sqrt(first_num)
  when "q"
  	result = "q"
  end
end
def ask_number(position)
	print "Give me the #{position} of number"
	gets.chomp.to_f
end
response = menu
while response != 'q'
response = menu
end
