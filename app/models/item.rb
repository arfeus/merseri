class Item < ActiveRecord::Base

  acts_as_taggable  
  belongs_to :user
  
  before_save { self.name = name.capitalize }
  
  validates :name, :presence => {:message => 'Item name cannot be blank'}, :length => { :minimum => 3 }

end
