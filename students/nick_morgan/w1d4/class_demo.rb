class Car
	attr_accessor :max_speed, :color, :seating_material, :current_speed
end

#an attribute has a @ symbol magically inside it.

def initialize(max=180, color="black", seating="cloth")
	@max_speed = max
	@color = color
	@seating_material = seating
	@current_speed = 0
end

def change_speed(new_speed)
	if new_speed < max_speed
		@current_speed = new_speed
	else
		puts "whoah! #{new_speed} is too fast!"
		@current_speed = max_speed
	end
end


class Ferrari < Car
end

ferrari = Ferrari.new(300, "red", "leather")
ferrari.color = "red"
ferrari.max_speed = 300
ferrari.seating_material = "leather"

ferrari.change_speed(420)

p ferrari