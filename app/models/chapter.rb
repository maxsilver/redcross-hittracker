class Chapter < ActiveRecord::Base
  validates :name, :presence => true
  validates :region, :presence => true

  default_scope where(:deleted_at => nil)
  scope :during, lambda {|date_range| where(:reported_on => date_range)}

  belongs_to :region
  has_many :hits
end
