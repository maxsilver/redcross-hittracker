class Region < ActiveRecord::Base
  has_many :chapters
  has_many :hits, :through => :chapters
end
