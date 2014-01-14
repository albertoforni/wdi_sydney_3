# A user should be given a menu of operations
# A user should be able to choose from the menu
def menu
  	puts "Please type 'A' for addition, 'S' for subtraction 'M' for multiplication and 'D' for division. Press q to quit."
  	basic_calc

end


# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
def basic_calc()

	command = gets.chomp.downcase
  
 	def add(a, b)
		puts "The answer is #{a+b}"
	end

	def sub(a, b)
		puts "The answer is #{a-b}"
	end

	def mul(a, b)
		puts "The answer is #{a*b}"
	end

	def div(a, b)
		puts "The answer is #{a/b}"
	end


	if command == 'a'
		puts "Enter first value"
		value1 = gets.chomp.to_i
		puts "Enter second value"
		value2 = gets.chomp.to_i
		
		add(value1, value2)
	end

	if command == 's'
		puts "Enter first value"
		value1 = gets.chomp.to_i
		puts "Enter second value"
		value2 = gets.chomp.to_i
		
		sub(value1, value2)
	end

	if command == 'm'
		puts "Enter first value"
		value1 = gets.chomp.to_i
		puts "Enter second value"
		value2 = gets.chomp.to_i
		
		mul(value1, value2)
	end

	if command == 'd'
		puts "Enter first value"
		value1 = gets.chomp.to_i
		puts "Enter second value"
		value2 = gets.chomp.to_i
		
		div(value1, value2)
	end

	if command == "q"
		exit
	end

end

def advanced_calc
  print "(p)ower, (s)qrt: "

end


response = menu

# This process should continue until the user selects a quit option from the menu
while response != 'q'

  response = menu
end