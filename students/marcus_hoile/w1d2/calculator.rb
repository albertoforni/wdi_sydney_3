
# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
def basic_calc
  print "Enter starting number: "
  num_start = gets.chomp.to_i
  print "(a)dd, (s)ubtract, (m)ultiply or (d)ivide #{num_start} by?"
  basic = gets.chomp
  case basic
  	# capture the number to add
  when "a"
  	print "add? number please: "
  	add = gets.chomp.to_i
  	puts num_start + add

# capture num to subtract
  when "s"
  	print "subtract? number please: "
  	subtract = gets.chomp.to_i
  	puts num_start - subtract

  when "m"
  	print "multiply by? number please:"
  	multiply = gets.chomp.to_i
  	puts num_start * multiply

  when "d"
  	print "divide by? number please:"
  	divide = gets.chomp.to_i
  	puts num_start / divide

  end
end


def advanced_calc
  print "Enter starting number: "
  num_start = gets.chomp.to_i
  print "(p)ower or (s)quare root of #{num_start}?"
  advanced = gets.chomp
  case advanced
  	 when advanced.include?("p")
  	print "to the power of? number please:"
  	power = gets.chomp.to_i
  	puts num_start ** power
  	  when "s"
  	print "square root of? number please:"
  	root = gets.chomp.to_i
  	puts num_start.sqrt(root)

  end
end


# A user should be given a menu of operations
# A user should be able to choose from the menu
def menu
  puts "What would like to do? (b)asic arithmetic, (a)dvanced or (q)uit?"
  answer = gets.chomp.downcase
	  if answer == "b"
	  	basic_calc
	  elsif answer == "a"
	  	advanced_calc
	  elsif answer == "q"
	  	puts "Turning off calculator..."
	  	answer
	end
end


menu

response = menu

# This process should continue until the user selects a quit option from the menu
while response != 'q'

 response = menu
end



