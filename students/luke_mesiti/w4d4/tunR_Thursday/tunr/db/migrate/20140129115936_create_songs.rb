class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :length
      t.string :description
      t.references :album, index: true
      t.references :artist, index: true

      t.timestamps
    end
  end
end
