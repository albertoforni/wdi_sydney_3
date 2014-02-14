class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :songs
  validates :name, :artist_id, presence:true
end
