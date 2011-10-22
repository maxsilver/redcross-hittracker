class Hit < ActiveRecord::Base
  validates :title, :presence => true
  validates :reporter, :presence => true
  validates :user, :presence => true
  validates :reported_on, :presence => true
  validates :press_release, :presence => true
  validates :media_outlet, :presence => true

  has_one :reporter
  has_one :press_release
  has_one :media_outlet
  has_one :chapter
  belongs_to :user
  
  acts_as_taggable
end
