class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
            t.string :title		# varchar(255)
            t.string :abstract
            t.string :body_text	# text
            t.string :author
            t.timestamps		# automatically generates created_at and updated_at
    end
  end
end

