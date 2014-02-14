class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :email

      t.timestamps
    end
  end
end
