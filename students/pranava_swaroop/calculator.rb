# A user should be given a menu of operations
# A user should be able to choose from the menu
def menu
	option = gets.chomp.downcase
end


# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
def basic_calc
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "

end

def advanced_calc
  print "(p)ower, (sq)rt, (q)uit: "

end

def add(a,b)
	(a+b)
end


def sub(a,b)
	a-b
end

def mul(a,b)
	a*b
end

def div(a,b)
	a/b
end

def pow(a,b)
	a**b
end

def sqrt(a)
	Math::sqrt(a)
end	


def validate(resp)

	if(resp != 'sq')
		print "\tEnter the first number: "
		a = gets.chomp.to_i
		print "\tEnter the second number: "
		b = gets.chomp.to_i
		case resp
		when 'a'
			puts  "\t output: #{add(a,b)}"
		when 's'
			puts  "\t output: #{sub(a,b)}"
		when 'm'
			puts  "\t output: #{mul(a,b)}"
		when 'd'
			puts  "\t output: #{div(a,b)}"
		when 'p'
			puts  "\t output: #{pow(a,b)}"
		else
			puts 'Please enter a valid option to calculate'
		end
	else
		case resp
		when 'sq'
			print "\tEnter the a number: "
			a = gets.chomp.to_i
			puts "\t output: #{sqrt(a)}"
		else
			puts 'Please enter a valid option to calculate'
		end
	end
	
end

basic_calc
advanced_calc

response = menu

# This process should continue until the user selects a quit option from the menu
while response != 'q'

  #validate and call the respective option
  validate(response)

  response = menu
end