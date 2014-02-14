class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :description
      t.text :image

      t.timestamps
    end
  end
end
