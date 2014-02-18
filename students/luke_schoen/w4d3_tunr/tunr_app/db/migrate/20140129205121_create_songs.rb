class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name, null: false # must be entered when import seed.rb
      t.text :description
      t.string :length
      t.string :integer
      t.string :url
      t.references :album, index: true
      t.references :artist, index: true

      t.timestamps
    end
  end
end
