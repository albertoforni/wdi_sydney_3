class ChangeSongsColumn < ActiveRecord::Migration
  def change

   change_column :songs, :image, :string


  end
end
