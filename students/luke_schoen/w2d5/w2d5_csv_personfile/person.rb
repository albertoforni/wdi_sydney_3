class Person
	attr_accessor :name, :age, :gender

	def initialize (name=nil, age=nil, gender=nil) # nil indicates params optional
		@name = name
		@age = age.to_s
		@gender = gender
	end

	def to_s
		puts "#{name} #{age} #{gender}"
	end
end

#if __FILE__ == $0
#end

	#if !File.file?("data/#{filename_new}")
	#	f = File.new("data/#{filename_new}.csv", "w+")
	#	puts "#{f} filename has been created for you!"
	#end

  	#CSV::Writer.generate(f, '|') do |csv| # old CSV for Ruby 1.8, does not work
 
  	#File.rename("afile", "afile.bak")

		#qty = row[0].to_i
		#price = row[2].to_f
		#printf "%20s: $%5.2f %s\n", row[1], qty*price, row[3] || " ---"


  	#f.close

	#output = CSV.read("data/#{filename_new}").map do |row|  # or read("data/#{filename_new}.csv")
  	#	row.to_csv(:col_sep => "|")
	#end

	#     csv << ["row", "of", "CSV", "data"]
	#     csv << ["another", "row"]
	#     # ...
	#   end

	#puts output

	#f { send_data person1.to_csv(col_sep: "\t,") }
	#CSV(f) { |csv_in| csv_in.each { |row| p row } }
	#details = service_data.values {|x| puts x.join(' ') } 

=begin
	hash_of_names = [ { "Name" => "Luke", "Age" => "32", "Gender" => "Male" }, { "Name" => "Pranava", "Age" => "Unknown", "Gender" => "Male" } ]

	arr = []
	person_data = hash_of_names.each { 	|person| 
		arr << person
		#puts "#{person["Name"]} #{person["Age"]} #{person["Gender"]}"
    }
    puts arr
    puts person_data

	filename_new = "people"

	if !File.directory?("data")
		d = FileUtils.mkdir('data')
		puts "#{d} directory has been created for you!"
	end

	if !File.file?("data/#{filename_new}")
		f = File.new("data/#{filename_new}.csv", "w+")
		puts "#{f} filename has been created for you!"
	end

	f.puts person_data # add person_data to the file

	f.flush # transfer memory into file without having to f.close and open again 

	#array = f.readlines.map { |row| row.chomp }
	#puts array

	f.close

=end