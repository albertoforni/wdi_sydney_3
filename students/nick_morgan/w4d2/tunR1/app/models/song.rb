class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist
  validates :name, :artist_id, presence:true

end
