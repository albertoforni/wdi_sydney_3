class Robot < ActiveRecord::Base
	validates :name, presence: true 
	
	has_many :senses
			#, :dependent => :nullify #:destroy, 
	has_many :ideas
			#, :through => :senses
			#, :dependent => :nullify
end
