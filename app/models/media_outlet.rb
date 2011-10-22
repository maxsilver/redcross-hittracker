class MediaOutlet < ActiveRecord::Base
  validates :name, :presence => true
  validates :media_type, :presence => true
  has_many :hits
  belongs_to :user
end
