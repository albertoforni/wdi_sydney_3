def calc
  puts "Calculator 1.0 \nEnter 'q' to quit."

  while true
    print ">> "
    str = gets.chomp.split(" ")  # splits into array, rejects blanks
    return if str[0] == 'q'      # quit if first element is 'q'

    operand1 = str[0].to_i
    operand2 = str[2].to_i
    operator = str[1].to_sym

    case operator
    when :+ then puts operand1 + operand2
    when :- then puts operand1 - operand2
    when :* then puts operand1 * operand2
    when :/ then puts operand1 / operand2
    when :% then puts operand1 % operand2
    else
      puts "invalid input"
    end
  end

end