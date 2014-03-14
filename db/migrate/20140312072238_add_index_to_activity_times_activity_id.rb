class AddIndexToActivityTimesActivityId < ActiveRecord::Migration
  def change
    add_index :activity_times, :activity_id
  end
end
