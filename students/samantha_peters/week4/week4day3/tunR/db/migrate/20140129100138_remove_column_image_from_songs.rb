class RemoveColumnImageFromSongs < ActiveRecord::Migration
  def change
  	remove_column :songs, :image
  end
end
