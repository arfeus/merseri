class Activity < ActiveRecord::Base
  belongs_to :user
  
  before_save { self.name = name.capitalize }
  
end
