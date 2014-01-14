# A user should be given a menu of operations
# A user should be able to choose from the menu
def menu
  puts "Please type the menu number for the calculation you'd like to perfrom: "
  puts " Put 1 for Basic calculator and 2 for Advanced calculator"
  calculator = gets.chomp.to_i


  if calculator == 1
    basic_calc
  else calculator == 2
    advanced_calc
  end
end


# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
def basic_calc
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  function = gets.chomp.downcase
    return 'q' if function == 'q'

  print "Enter first number: "
  num_1 = gets.chomp.to_i

  answer = 0

  
  case function  
    when "a"
      puts "Enter the second number"
      add_num = gets.chomp.to_i
      answer = num_1 + add_num
    when "s"
      puts "Enter the second number"
      sub_num = gets.chomp.to_i
      answer = num_1 - sub_num
    when "m"
      puts "Enter the second number"
      multi_num = gets.chomp.to_i
      answer = num_1 * multi_num
    when "d"
      puts "Enter the second number "
      divide_num = gets.chomp.to_i
      answer = num_1 / divide_num
    else
      puts "Wrong!"
  end

  print "The answer equals: #{answer}"

end 
def advanced_calc
 print "(p)ower, (s)qrt: "
  function_2 = gets.chomp.downcase
    return 'q' if function_2 == 'q'

  print "Enter first number: "
  num_3 = gets.chomp.to_i

  answer2 = 0

  case function_2
  when "p"
      puts "Enter the second number add to the power of #{num_3} to: "
      power_num = gets.chomp.to_i
      answer2 = num_3 ** power_num
    when "s"
      answer2 =  Math.sqrt(num_3)
    else 
     puts "wrong"
 end
   print "The answer equals: #{answer2}"

end
response = menu

# This process should continue until the user selects a quit option from the menu
while response != 'q'

  response = menu
end
