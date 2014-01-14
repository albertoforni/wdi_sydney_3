# A user should be given a menu of operations


# A user should be able to choose from the menu
def menu
	puts "(b)asic calulations, (a)dvanced calculations"
	puts "What would you like to do?"  
	main_menu = gets.chomp.to_s

	#User's entry determines menu
	case main_menu
	when "b"
		basic_calc
	when "a"
		advanced_calc
	else
		puts "You didn't enter a valid selection - try again."
	end

end


# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
def basic_calc
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide (b)ack: "

  #take user's selection of the menu
  basic_calc_menu = gets.chomp.to_s

  #act based on user's choice...
  case basic_calc_menu

  when "a"
  	#"addition" selection
  

   	puts "Enter your sum (format: number + number) **Press q to quit ***"
 	

  	def add
  		# >> is a console marker
	    print ">> "

	    # splits into array, seperating by spaces
	    add_numbers = gets.chomp.split(" ")

	    #go back to the menu if the user hits Q  
	    basic_calc if add_numbers[0] == 'q'     

	    #make variables to be the first number, the last number, and the add symbol thing
	    number1 = add_numbers[0].to_i
	    number2 = add_numbers[2].to_i
	    plus = add_numbers[1].to_sym

	    # when the user adds the plus symbol, add the numbers and print
	    case plus
	    when :+ then puts number1 + number2

	    	#if they were successful adding, let them do another sum
		    puts "Another sum? (y)es / (n)o"
		    next_answer = gets.chomp

			    if next_answer == "y"
			    	add
			    elsif next_answer == "n"
			    	basic_calc
			    else
			    	"Not a valid answer, try Y or N."
			    end

	    else
	      puts "Sorry that wasn't a valid sum. Try again"
	    end

	end

	#run the method above
	add



when "s"
#subctraction selection

  

   	puts "Enter your subtraction thingy (format: number - number) **Press q to quit ***"
 	

  	def subtract
  		# >> is a console marker
	    print ">> "

	    # splits into array, seperating by spaces
	    subtract_numbers = gets.chomp.split(" ")

	    #go back to the menu if the user hits Q  
	    basic_calc if subtract_numbers[0] == 'q'     

	    #make variables to be the first number, the last number, and the minus symbol thing
	    number1 = subtract_numbers[0].to_i
	    number2 = subtract_numbers[2].to_i
	    minuserer = subtract_numbers[1].to_sym

	    # when the user adds the minus symbol, add the numbers and print
	    case minuserer
	    when :- then puts number1 - number2

	    	#if they were successful subtracting, let them do another sum
		    puts "Another sum? (y)es / (n)o"
		    next_answer = gets.chomp

			    if next_answer == "y"
			    	add
			    elsif next_answer == "n"
			    	basic_calc
			    else
			    	"Not a valid answer, try Y or N."
			    end

	    else
	      puts "Sorry that wasn't a valid sum. Try again"
	    end

	end

	#run the method above
	subtract

when "m"
	#multiplication selection
  

   	puts "Enter your multiplier sum (format: number * number) ** Press q to quit ***"
 	

  	def multiply
  		# >> is a console marker
	    print ">> "

	    # splits into array, seperating by spaces
	    multiply_numbers = gets.chomp.split(" ")

	    #go back to the menu if the user hits Q  
	    basic_calc if multiply_numbers[0] == 'q'     

	    #make variables to be the first number, the last number, and the times symbol
	    number1 = multiply_numbers[0].to_i
	    number2 = multiply_numbers[2].to_i
	    multiplier = multiply_numbers[1].to_sym

	    # when the user adds the times symbol, add the numbers and print
	    case multiplier
	    when :* then puts number1 * number2

	    	#if they were successful multiplying, let them do another sum
		    puts "Another sum? (y)es / (n)o"
		    next_answer = gets.chomp

			    if next_answer == "y"
			    	add
			    elsif next_answer == "n"
			    	basic_calc
			    else
			    	"Not a valid answer, try Y or N."
			    end

	    else
	      puts "Sorry that wasn't a valid sum. Try again"
	    end

	end

	#run the method above
	multiply



when "d"
	#division selection

	   	puts "Enter your divider sum stuff (format: number * number) ** Press q to quit ***"

  	def division
  		# >> is a console marker
	    print ">> "

	    # splits into array, seperating by spaces
	    divide_numbers = gets.chomp.split(" ")

	    #go back to the menu if the user hits Q  
	    basic_calc if divide_numbers[0] == 'q'     

	    #make variables to be the first number, the last number, and the divider symbol
	    number1 = divide_numbers[0].to_i
	    number2 = divide_numbers[2].to_i
	    dividerer = divide_numbers[1].to_sym

	    # when the user adds the dividing symbol, add the numbers and print
	    case dividerer
	    when :/ then puts number1 / number2

	    	#if they were successful dividing, let them do another sum
		    puts "Another sum? (y)es / (n)o"
		    next_answer = gets.chomp

			    if next_answer == "y"
			    	add
			    elsif next_answer == "n"
			    	basic_calc
			    else
			    	"Not a valid answer, try Y or N."
			    end

	    else
	      puts "Sorry that wasn't a valid sum. Try again"
	    end

	end

	#run the method above
	division

when "b"
	#take them to the big menu
	menu
else
	"You didn't enter a valid selection. Try again!"
end



end

def advanced_calc
  puts "(p)ower, (s)quare root, (b)ack"
  adv_calc_menu = gets.chomp

 case adv_calc_menu
 when "p"
 	#powering menu choice

 		puts "Enter your sum for powering (format: number ** number) ** Press q to quit ***"

 	  	def power
  		# >> is a console marker
	    print ">> "

	    # splits into array, seperating by spaces
	    expon_numbers = gets.chomp.split(" ")



	    #go back to the menu if the user hits Q  
	    basic_calc if expon_numbers[0] == 'q'     

	    #make variables to be the first number, the last number, and the divider symbol
	    number1 = expon_numbers[0].to_i
	    number2 = expon_numbers[2].to_i
	    powerer = expon_numbers[1].to_sym


	    # match the powerer to the symbol we got in the array - if it matches, add the numbers and print
	    case powerer
	    when :** then puts number1 ** number2

	    	#if they were successful powering and squaring or whatnot, let them do another sum
		    puts "Another sum? (y)es / (n)o"
		    next_answer = gets.chomp

			    if next_answer == "y"
			    	power
			    elsif next_answer == "n"
			    	advanced_calc
			    else
			    	"Not a valid answer, try Y or N."
			    end

	    else
	      puts "Sorry that wasn't a valid sum. Try again"
	    end

	end

	#run the method above
	power

	when "s"

	#choice for square rooting

		 puts "Enter the number for which you want to find the square root ** Press q to quit ***"

 	  	def squareroot
  		# >> is a console marker
	    print ">> "

	    # grab the number off the user, (or Q)
	    squirt_numbers = gets.chomp



	    #go back to the menu if the user hits Q  
	    if squirt_numbers == 'q'     
	    	basic_calc

	    #othewise, convert the input to an interger, and square root it and then print that badboy.
		else 

			puts Math.sqrt(squirt_numbers.to_i)


	    	#if they were successful squaring and rooting or whatever these maths-ites do, let them do another sum
		    puts "Another sum? (y)es / (n)o"
		    next_answer = gets.chomp

			    if next_answer == "y"
			    	squareroot
			    elsif next_answer == "n"
			    	advanced_calc
			    else
			    	"Not a valid answer, try Y or N."
			    end


	    end

	end

	#run the method above
	squareroot

	when "b"
		menu

	end

end


response = menu

#This process should continue until the user selects a quit option from the menu
while response != 'q'

response = menu
end