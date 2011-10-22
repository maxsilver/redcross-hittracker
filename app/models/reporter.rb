class Reporter < ActiveRecord::Base
  validates :name, :presence => true
end
