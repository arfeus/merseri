class ChangeTextFormatInMers < ActiveRecord::Migration
  def up
    change_column :mers, :text, :text
  end
  def dow
    change_column :mers, :text, :string
  end
end
