class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :activities, [:user_id, :created_at]
  end
end
