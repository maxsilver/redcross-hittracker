class Hit < ActiveRecord::Base
  validates :title, :presence => true
  validates :reporter, :presence => true
  validates :user, :presence => true
  validates :reported_on, :presence => true
  validates :press_release, :presence => true
  validates :media_outlet, :presence => true
  validates :chapter, :presence => true

  scope :during, lambda {|date_range| where(:reported_on => date_range)}
  scope :with_reporter, lambda { |reporter_id| where(:reporter_id => reporter_id)}
  scope :with_media_outlet, lambda { |media_outlet_id| where(:media_outlet => media_outlet_id )}
  scope :with_chapter, lambda { |chapter_id| where(:chapter => chapter_id )}
  scope :with_title, lambda { |title| where(:title => title )}
  scope :most_recent, order("reported_on desc").limit(10)

  belongs_to :reporter
  belongs_to :press_release
  belongs_to :media_outlet
  belongs_to :chapter
  belongs_to :user

  acts_as_taggable

  def self.earliest
    order("reported_on ASC").first
  end

  def self.latest
    order("reported_on ASC").last
  end
  
  def self.latest_reported_on
    return latest.reported_on if latest
    Date.today
  end
  
  def self.earliest_reported_on
    return earliest.reported_on if earliest
    Date.today
  end
end
