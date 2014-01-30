class CreatePlaylistsSongs < ActiveRecord::Migration
  def change
    create_table :playlists_songs do |t|
      t.references :song, index: true
      t.references :playlist, index: true
    end
  end
end
