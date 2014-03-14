class AddIndexToActingsActivityId < ActiveRecord::Migration
  def change
    add_index :actings, :activity_id
  end
end
