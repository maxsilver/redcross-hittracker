class MediaOutlet < ActiveRecord::Base
  validates :name, :presence => true
  validates :media_type, :presence => true

  default_scope where(:deleted_at => nil)

  has_many :hits
  belongs_to :user
end
