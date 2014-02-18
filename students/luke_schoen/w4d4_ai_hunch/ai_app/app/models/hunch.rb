class Hunch < ActiveRecord::Base
	validates :name, presence: true 
	#scope :search
	
	has_and_belongs_to_many :ideas


end
