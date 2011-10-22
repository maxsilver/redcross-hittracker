class Hit < ActiveRecord::Base
  validates :title, :presence => true
  validates :reporter, :presence => true
  validates :user, :presence => true
  validates :reported_on, :presence => true
  validates :press_release, :presence => true
  validates :media_outlet, :presence => true
  validates :chapter, :presence => true

  default_scope where(:deleted_at => nil)
  scope :during, lambda {|date_range| where(:reported_on => date_range)}

  belongs_to :reporter
  belongs_to :press_release
  belongs_to :media_outlet
  belongs_to :chapter
  belongs_to :user

  acts_as_taggable
end
