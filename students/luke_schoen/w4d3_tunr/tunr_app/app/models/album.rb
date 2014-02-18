class Album < ActiveRecord::Base
    validates :name, presence: true 
    # error shown in front end when entering in form if not entered
	
	has_many :songs
	belongs_to :artist
end
