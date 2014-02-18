class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	    t.string :comments	# varchar(255)
            t.string :author
            t.timestamps	
    end
  end
end
