class Client < ActiveRecord::Base
	has_many :animals
	belongs_to :shelter
end
