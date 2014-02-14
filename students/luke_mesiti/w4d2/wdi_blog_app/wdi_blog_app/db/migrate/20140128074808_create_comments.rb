class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
        t.text :content
        t.string :author
        t.integer :post_id # t.reference :posts, index:true <!-- this is how its done in rails 4
        t.timestamps
    end
  end
end


# add_reference :subjects, :course, index:true