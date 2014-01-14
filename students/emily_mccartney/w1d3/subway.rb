require 'pry'
require 'pry-debugger'

subway = {}
subway[:n] = %w(ts 34th 28th 23rd us 8th)
subway[:l] = %w(8th 6th us 3rd 1st)
subway[:l6] = %w(gc 33rd 28th 23rd us ap)



puts "what is your start line"
print "n, l, l6"
startline = gets.chomp.downcase.to_sym

puts "which station do you want to get on?"
startstation = gets.chomp.downcase

puts "what is your end line"
print "n, l, l6"
endline = gets.chomp.downcase.to_sym

puts "which station do you want to get off?"
endstation = gets.chomp.downcase

startindex = subway[startline].index(startstation)
endindex = subway[endline].index(endstation)


# p subway[startline][startindex..endindex]


if endline != startline

if (startline == :n) || (startline == :l6)
 us_on_index = 4  
else
 us_on_index = 2
end

#we need to iterate over each station from start to the us end point #upto method makes a range
p subway[startline][startindex..us_on_index]
# startindex.upto(us_on_index){|x| puts "#{subway[startline][x]}"} #array inside the hash 

#if the subway stop is going backwards
#travelling the second line

if startindex < us_on_index
 #travel down the line the endstation this is creating the off index of the us station of the new line
 if (endline == :n) || (endline == :l6)
  us_off_index = 4
 else
  us_off_index = 2
 end
p subway[endline][endindex..us_off_index].reverse
#us_off_index.downto(endindex){|x| puts "#{subway[endline][x]}"} #array inside the hash 

else 
 #travel up the line to the endstation
 p subway[endline][us_on_index..endindex]
 # us_off_index.upto(endindex){|x| puts "#{subway[endline][x]}"} #array inside the hash 
end

else 
 p subway[startline][startindex..endindex]
 # startindex.upto(endindex){|x| puts "#{subway[startline][x]}"}
end


# p subway[newline][startindex..secondindex]



# n_end = subway[:n].index("us") #4
# l_end = subway[:l].index("us") #2
# l6_end = subway[:l6].index("us") #4

# if endline != startline
# puts "what is your next line"
# print "n, l, l6"
# newline = gets.chomp.downcase.to_sym

# puts "which station do you want to get off?"
# endstation2 = gets.chomp.downcase
# end 

# case newline
# when "n"
# secondindex = [subway[:n].index("us")].endstation2.index  #index of us to endstation2
# when "l"
# secondindex = [subway[:l].index("us")].endstation2.index  #index of us to endstation2
# when "l6"
# secondindex = [subway[:l6].index("us")].endstation2.index  #index of us to endstation2

# end



#  find the index of union square on all lines make them variables

#   if endline != startline && endline == :n

#    stations_line = #index of startstation to us and then add the index of us on the new line to their end station
#   startstaion.index  
#   elsif endline != startline && endline == :l
#    stations_line = subway[endline].index(l_end)
#   else endline != startline && endline == :l6
#    stations_line = subway[endline].index(l6_end)
#   end
 
# if endline != startline
#  puts "do you want to chnage at us (y, n)?"
#  changestation = gets.chomp.downcase
# elsif y
#  puts "what new line do you want to get on?"
#  puts "n, l, l6"
# end

