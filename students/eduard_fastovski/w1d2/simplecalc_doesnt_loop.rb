# this doesnt work. until command == "q" do 

	puts "Please type 'A' for addition, 'S' for subtraction 'M' for multiplication and 'D' for division. 'P' for Power. /n Press q to quit."

	command = gets.chomp


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

	def power(a, b)
		puts "The answer is #{a**b}"
	end



	if command == 'A'
		puts "Enter first value"
		value1 = gets.chomp.to_i
		puts "Enter second value"
		value2 = gets.chomp.to_i
		
		add(value1, value2)
	end

	if command == 'S'
		puts "Enter first value"
		value1 = gets.chomp.to_i
		puts "Enter second value"
		value2 = gets.chomp.to_i
		
		sub(value1, value2)
	end

	if command == 'M'
		puts "Enter first value"
		value1 = gets.chomp.to_i
		puts "Enter second value"
		value2 = gets.chomp.to_i
		
		mul(value1, value2)
	end

	if command == 'D'
		puts "Enter first value"
		value1 = gets.chomp.to_i
		puts "Enter second value"
		value2 = gets.chomp.to_i
		
		div(value1, value2)
	end

	if command == 'P'
		puts "Enter first value"
		value1 = gets.chomp.to_i
		puts "Enter second value"
		value2 = gets.chomp.to_i
		
		power(value1, value2)
	end


	if command == "q"
		exit
	end
#end