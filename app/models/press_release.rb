class PressRelease < ActiveRecord::Base
  include AttributeDateParser

  validates :title, :presence => true
  validates :released_on, :presence => true

  belongs_to :user

  parse_date :released_on
  
  def self.earliest
    order("released_on ASC").first
  end

  def self.latest
    order("released_on ASC").last
  end
end
