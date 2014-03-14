class AddActivityIdToActivityTime < ActiveRecord::Migration
  def change
    add_column :activity_times, :activity_id, :integer
  end
end
