#require "./person.rb"
require 'fileutils'
require 'csv'

class MovieFile
	attr_accessor :display_movie_list

	def initialize(display_movie_list=nil)
		@display_movie_list = display_movie_list
	end

	def create_movie(movie_searched)
			filename_new = "people"

			if !File.directory?("data") # create directory and CSV file if not exist
				d = FileUtils.mkdir('data')
				puts "#{d} directory has been created for you!"
			end

			if !File.file?("data/#{filename_new}.csv")
  				CSV.open("data/#{filename_new}.csv", "w+") do |csv| 
  				# write to CSV file TRUNCATING (since new) 
    				csv << [movie_searched["Title"], movie_searched["Poster"]] 
  				end
			elsif File.file?("data/#{filename_new}.csv")
				CSV.open("data/#{filename_new}.csv", "a+") do |csv| 
				# write to CSV file - APPENDING (since existing)
    				csv << [movie_searched["Title"], movie_searched["Poster"]]
  				end
			end
	end
end
