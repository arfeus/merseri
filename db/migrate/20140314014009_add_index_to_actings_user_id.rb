class AddIndexToActingsUserId < ActiveRecord::Migration
  def change
    add_index :actings, :user_id
  end
end
