# examples of exceptions

def mult2(x)
x * 2
end

mult2()

# gives ArgumentError: wrong number of arguments (0 for 1)


def div_by
  puts "Gimme a number"
  x = gets.chomp.to_i
  puts "and what do you want me to divide by?"
  div = gets.chomp.to_i

  puts x / div
end

div_by
4
0

# gives ZeroDivisionError: divided by 0

# raise your own exception
raise "got a problem"
# defaults to RuntimeError

# you can also define your own kinds of errors by sub-classing like this:

class MyError < RuntimeError; end

raise MyError, "w00t!"

# To catch the exceptions, we wrap the code inside of a "begin/end" block and write "rescue"



def div_by
  begin
    puts "Gimme a number"
    x = gets.chomp.to_i
    puts "and what do you want me to divide by?"
    div = gets.chomp.to_i

    puts x / div

  rescue # catches the error!
    puts "oops, that failed!"
  end
end

# That's a bit better, but it doesn't let us try anything different to fix
# it.


def div_by
  begin
    puts "Gimme a number"
    x = gets.chomp.to_i
    puts "and what do you want me to divide by?"
    div = gets.chomp.to_i

    puts x / div

  rescue
    puts "oops, that didn't make sense... try again"
    retry
  end
end

# Note: with retry - you're turning this into a kind of a loop - and we all
#know what happens with loops if you don't have a way of getting out of it:


def div_by(x,y)
  begin
    x / y
  rescue
    puts "oops, what happened?"
    retry
  end
end

div_by(1,0)