class Song < ActiveRecord::Base
    belongs_to :artist

    belongs_to :album

    has_and_belongs_to_many :playlists

    validates :name, :presence => true

end
