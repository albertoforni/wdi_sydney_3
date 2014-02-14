class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
    	t.string :name, :species, :gender, :favourite_toy
    	t.boolean :adopted
    	t.integer :age
    	t.timestamps
    end
  end
end
