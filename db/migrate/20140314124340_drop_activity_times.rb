class DropActivityTimes < ActiveRecord::Migration
  def up
    drop_table :activity_times
  end
end
