class AddActiveToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :active, :boolean
  end
end
