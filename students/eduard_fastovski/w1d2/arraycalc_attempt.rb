puts "Please type 'A' for addition, 'S' for subtraction 'M' for multiplication and 'D' for division. /n Press q to quit."

command = gets.chomp



numbers = [] # the empty array i want to push numbers to





if command == 'A'
	puts "Type numbers you wish to add. Type submit to get the answer."
	
	#But how do i tell it "when the user types submit, exit the loop"? command refers to the first gets.chomp
	until command == "submit" do
	number = gets.chomp # this one is within the loop, so typing submit here wont do anything
	numbers.push(number.to_i) # push this loops number to the array
	end
	
	puts numbers #display the array
	sum = 0
	numbers.each {|number| sum+=number } #sum of the array
	puts sum
end

