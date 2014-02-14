class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.references :artist, index: true
      t.references :album, index: true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
