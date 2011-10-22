class Chapter < ActiveRecord::Base
  validates :name, :presence => true
  validates :region, :presence => true

  default_scope where(:deleted_at => nil)

  belongs_to :region
  has_many :hits
end
