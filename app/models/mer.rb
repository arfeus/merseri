class Mer < ActiveRecord::Base

  acts_as_taggable
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true,
                    length: { minimum: 1 }
                    
  validates :text, presence: true
                    
  def self.search(query)
   # where(:title, query) -> This would return an exact match of the query
   where("title like ?", "%#{query}%") 
  end

end