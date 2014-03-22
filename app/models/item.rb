class Item < ActiveRecord::Base

  acts_as_taggable  
  belongs_to :user
  
  before_save { self.name = name.capitalize }
  
  validates :name, :presence => {:message => 'Item name cannot be blank'}, :length => { :minimum => 3 }

  def self.search(query)
   # where(:title, query) -> This would return an exact match of the query
   where("name like ?", "%#{query}%") 
  end
  
end
