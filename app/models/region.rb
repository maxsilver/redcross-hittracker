class Region < ActiveRecord::Base
  default_scope where(:deleted_at => nil)

  has_many :chapters
  has_many :hits, :through => :chapters
end
