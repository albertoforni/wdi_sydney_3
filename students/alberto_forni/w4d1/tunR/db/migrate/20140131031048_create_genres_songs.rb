class CreateGenresSongs < ActiveRecord::Migration
  def change
    create_table :genres_songs do |t|
      t.references :genre, index: true
      t.references :song, index: true
    end
  end
end
