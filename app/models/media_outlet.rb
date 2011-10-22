class MediaOutlet < ActiveRecord::Base
  validates :name, :presence => true
  validates :media_type, :presence => true
  belongs_to :user
end
