class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.datetime :set_time
      t.boolean :alarm

      t.timestamps
    end
  end
end
