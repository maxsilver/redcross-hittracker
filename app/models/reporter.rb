class Reporter < ActiveRecord::Base
  validates :name, :presence => true
  default_scope where(:deleted_at => nil)

  has_many :hits
  belongs_to :user
end
