class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.text :image
      t.datetime :created_at
      t.datetime :updated_at
      t.references :artist, index: true
    end
  end
end
