
# tips
# fewer methods repeat functionality, one menu reuse


# A user should be given a menu of operations
# A user should be able to choose from the menu
def menu(name, activate, response)
	puts "Main Options: \n   Type 'd' - Displays status\n   Type 'c' - Enter input for calculation\n   Type 'q' - Exits"
	puts "Current Option Status: #{update_response}"
	numbers = [0...10]
	oper_norm = ["+", "-", "*", "/"]
	oper_adv = ["^", "sqrt"] 	
	update_response = gets.chomp.lowercase.to_s
	case update_response
		when 'd'
			puts "Option Status: #{update_response}"
			puts "#{numbers}"
			puts "#{oper}"
			puts " "
			puts "Press enter to key to return to menu..."
			if gets.chomp
				return update_response
				next
			end
		when 'c'
			puts "Sub Options: \n   Type 'b' - Basic arithmetic (i.e. #{oper_norm})\n   Type 'a' - Advanced arithmetic (i.e. #{oper_adv})\n   Type 'q' - Exits"
			if gets.chomp == "b"
				basic_calc
			elsif gets.chomp == "a"
				advanced_calc
			elsif gets.chomp == "q"
				return "q" 
				puts "Goodbye!!"
			else
				puts "Incorrect input, try again!!"
			end
		when 'q'
			return "q" 
			puts "Goodbye!!"
		else
			menu(name, activate, update_response)
	end

end



# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
def basic_calc
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  oper_choice_basic = gets.chomp.lowercase!.to_s
  first_val = gets.chomp.to_f
  second_val = gets.chomp.to_f
  ans = nil
  case oper_choice_basic
  	when "a" 
  		ans = first_val + second_val
  	when "s"
  		ans = first_val - second_val
  	when "m"
  		ans = first_val * second_val
  	when "d"
  		ans = first_val / second_val
  	else
  		puts "Incorrect input, try again!!"
  		basic_calc
  end
  puts "answer: #{first_val} + #{second_val} = #{ans}"
end

def advanced_calc
  print "(p)ower, (s)qrt: "
  oper_choice_adv = gets.chomp.lowercase!.to_s
  first_val = gets.chomp.to_f
  second_val = gets.chomp.to_f
  ans = nil
  case oper_choice_adv
  	when "p"
  		ans = first_val ^ second_val
  	when "s"
  		puts "Do you want the square root of #{first_val} or #{second_val}?"
  		if gets.chomp == first_val
  			ans = sqrt(first_val) 
  			puts "answer: square root of #{first_val} = #{ans}"
  		elsif gets.chomp == second_val
  			ans = sqrt(first_val) 
  			puts "answer: square root of #{second_val} = #{ans}"
  		else
  			puts "Incorrect input, try again!!"
  			advanced_calc
  		end
  	else
  		puts "Incorrect input, try again!!"
  		advanced_calc
  end
end

response = menu

# This process should continue until the user selects a quit option from the menu


while response != 'q'
  response = menu
end

# Welcome screen prior to menu

activate = false

for activate == false 
	puts "What's your name?"
	puts "Note: Type 'q' to exit at any time"
	name = gets.chomp
	puts "#{name}, please type 'ON' to turn on calc options menu"
	if gets.chomp.lowercase == "on"
		activate = true
		puts "Great, calc is ON!!"
		menu(name, activate, response)
	elsif gets.chomp.lowercase.to_s !== "on" 
		puts "Try again, type 'on' to turn on calc"
	elsif  gets.chomp.lowercase.to_s == "q" 
		response = "q" 
		puts "Goodbye!!"
	else 
		next
	end
end
