class CreateActings < ActiveRecord::Migration
  def change
    create_table :actings do |t|
      t.integer :user_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
