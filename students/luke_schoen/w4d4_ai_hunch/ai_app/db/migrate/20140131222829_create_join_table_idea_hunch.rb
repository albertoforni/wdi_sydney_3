class CreateJoinTableIdeaHunch < ActiveRecord::Migration
  def change
    create_join_table :ideas, :hunches do |t|
      # t.index [:idea_id, :hunch_id]
      # t.index [:hunch_id, :idea_id]
    end
  end
end
