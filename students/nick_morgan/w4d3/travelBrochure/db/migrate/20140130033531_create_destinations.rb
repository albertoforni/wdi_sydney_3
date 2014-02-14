class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.text :image
      t.string :country

      t.timestamps
    end
  end
end
