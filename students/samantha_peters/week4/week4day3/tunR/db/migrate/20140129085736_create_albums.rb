class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :year
      t.string :genre
      t.string :album_art
      t.integer :artist_id

      t.timestamps
    end
  end
end
