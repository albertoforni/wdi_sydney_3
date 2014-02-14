class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :genre
      t.text :image
      t.integer :isbn

      t.timestamps
    end
  end
end
