class Person
	def initialize(stomach=[],allergies)
		self.stomach = stomach
		self.allergies = allergies
	end

	attr_accessor :stomach
	attr_reader :allergies
	  
	 # When someone tries to set a last name, enforce rules about it.  
	 def allergies=(allergies)  
	    if allergies == nil or allergies.size == 0  
	      raise ArgumentError.new('Person must have atleast one allergy :-)')
	    end  
	    @allergies =allergies
	 end  
  

	def eat(food)
		begin
			stomach.push(food).flatten!
			stomach.each do |s|
				raise AllergyError, "You have allergy for this #{s}" if allergies.include?(s)
			end
		rescue Exception => e
			puts e.message
		else
			stomach.push(food).flatten!
			puts "Successfully completed the food"
		end
	end
end

class AllergyError < StandardError

end

if (__FILE__ == $0)
	allergies = ['fd','dump']
	per = Person.new(allergies)	
	food = ['noodles','gobi','chat','Alu']
	puts per.eat(food)
end