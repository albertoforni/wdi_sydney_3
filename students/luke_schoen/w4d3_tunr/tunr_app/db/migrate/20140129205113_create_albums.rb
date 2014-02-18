class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false # must be entered when import seed.rb
      t.text :description
      t.string :image
      t.references :artist, index: true

      t.timestamps
    end
  end
end
