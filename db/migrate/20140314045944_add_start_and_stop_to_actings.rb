class AddStartAndStopToActings < ActiveRecord::Migration
  def change
    add_column :actings, :start, :datetime
    add_column :actings, :stop, :datetime
  end
end
