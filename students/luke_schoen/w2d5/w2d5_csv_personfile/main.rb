require "./person.rb"
require 'fileutils'
require 'pry'
require 'pry-debugger'
# gem install fastercsv
require 'csv'

puts " #################################### "
puts " # WELCOME TO CSV CREATE & MODIFIER # "
puts " #################################### "

answer = "y"
while answer == "y"

	puts "Enter option:"
	puts "(C) - Create person in CSV file"
	puts "(E) - Eliminate person from CSV file"
	puts "(R) - Read CSV file"
	puts "(D) - Delete CSV file"
	puts ">>"
	option = gets.chomp.downcase.to_s
	filename_new = "people"

	case option 
		when "c"
			puts "Enter name:"
			puts ">>"
			person_name = gets.chomp.to_s
			puts "Enter age:"
			puts ">>"
			person_age = gets.chomp.to_s
			puts "Enter gender:"
			puts ">>"
			person_gender = gets.chomp.to_s

			person = Person.new(person_name, person_age, person_gender)

			# create directory and CSV file if not exist

			if !File.directory?("data")
				d = FileUtils.mkdir('data')
				puts "#{d} directory has been created for you!"
			end

			if !File.file?("data/#{filename_new}.csv")
  				CSV.open("data/#{filename_new}.csv", "w+") do |csv| 
  				# write to CSV file TRUNCATING (since new) 
    				csv << [person.name, person.age, person.gender] #"\r\n"]
  				end
			elsif File.file?("data/#{filename_new}.csv")
				CSV.open("data/#{filename_new}.csv", "a+") do |csv| 
				# write to CSV file - APPENDING (since existing)
    				csv << [person.name, person.age, person.gender]
  				end
			end

		when "e"
			puts "Enter name:"
			puts ">>"
			person_name = gets.chomp.to_s

			if File.file?("data/#{filename_new}.csv")

				puts "File contains the following entries matching: #{person_name}"	

				each_row = Hash.new

				CSV.foreach("data/#{filename_new}.csv") do |row|
					if row[0] == person_name
						output = ( row[0] + ", " + row[1] + ", " + row[2] ).to_s
						#row[0..-1].to_s
						puts output
					end
				end
				
				puts " ##################"
				puts " # Enter Selection:"
				puts " ##################"
				puts "Enter age:"
				puts ">>"
				person_age = gets.chomp.to_s
				puts "Enter gender:"
				puts ">>"
				person_gender = gets.chomp.to_s

				n_row = 0
				CSV.foreach("data/#{filename_new}.csv") do |row|
					n_row += 1
					puts "Selection for deletion is:"
					if row[0] == person_name && row[1] == person_age && row[2] == person_gender
						output = ( row[0] + ", " + row[1] + ", " + row[2] ).to_s
						del_option = n_row
						puts output
					end
				end

				if output.exists?
					puts " ##################"
					puts " # Confirm Deletion:"
					puts " ##################"
					puts "Do you wish to delete this selection? (y/n)"
					puts ">>"
					delete_option = gets.chomp.to_s

					ans_del = nil
					while !(ans_del == "y" || ans_del == "n")
						if delete_option == "y"
							count = 0
							CSV.open("data/#{filename_new}.csv", "r+") do |csv| 
	  						# write to CSV file 
	  							count += 1 
	    						if count == del_option
	    							csv << [nil, nil, nil] #"\r\n"]
	    						end
	  						end
						elsif delete_option == "n"
							puts "Restarting app..."
							break
						else 
							puts "Incorrect option entered, try again!"
							puts ">>"
						end
					ans_del = gets.chomp
					end
				end
			else 
				puts "No file exists with name: #{filename_new}"
			end



		when "r"
			if File.file?("data/#{filename_new}.csv")		
				CSV.foreach("data/#{filename_new}.csv") do |row|
					output = ( row[0] + ", " + row[1] + ", " + row[2] ).to_s
#					each_row = row[0..-1].to_s
					puts output
				end

#				each_row.each do |row| puts row 
#				end

			else 
				puts "No file exists with name: #{filename_new}"
			end
		when "d"
			if !File.directory?("data")
				puts "#{d} directory does not exist!"
			end

			if !File.file?("data/#{filename_new}.csv")
  				puts "#{filename_new}.csv file does not exist!"
			elsif File.file?("data/#{filename_new}.csv")
				File.delete("data/#{filename_new}.csv")
			end
		else
			puts "Incorrect option entered, try again"
		end

	puts "Do you wish to continue and choose another option? (y/n)"
	answer = gets.chomp
end