class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :members
      t.string :formed
      t.string :image
      t.string :website

      t.timestamps
    end
  end
end
