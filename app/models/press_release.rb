class PressRelease < ActiveRecord::Base
  include AttributeDateParser
  
  validates :title, :presence => true
  validates :released_on, :presence => true
  
  belongs_to :user
  
  parse_date :released_on
end
