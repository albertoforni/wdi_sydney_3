class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :description
      t.text :cover_image
      t.references :artist, index: true

      t.timestamps
    end
  end
end
