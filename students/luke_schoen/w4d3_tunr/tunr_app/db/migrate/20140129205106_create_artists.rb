class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name, null: false # must be entered when import seed.rb
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
