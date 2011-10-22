class PressRelease < ActiveRecord::Base
  validates :title, :presence => true
  validates :released_on, :presence => true
  
end
