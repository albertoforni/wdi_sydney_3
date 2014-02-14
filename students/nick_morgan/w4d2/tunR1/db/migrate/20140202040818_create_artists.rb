class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.text :image
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
