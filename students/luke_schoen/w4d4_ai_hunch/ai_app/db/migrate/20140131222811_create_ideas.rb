class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.references :robot, index: true
      t.references :sense, index: true
      
      t.timestamps
    end
  end
end
