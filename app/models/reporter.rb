class Reporter < ActiveRecord::Base
  validates :name, :presence => true
  has_many :hits
  belongs_to :user
end
