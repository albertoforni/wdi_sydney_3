class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.text :image
      t.references :destination, index: true

      t.timestamps
    end
  end
end
