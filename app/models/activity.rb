class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :actings, dependent: :destroy
  
  before_save { self.name = name.capitalize }
  
end
