class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  default_scope where(:deleted_at => nil)

  attr_accessible :email, :password, :password_confirmation, :remember_me, :receive_notifications

  has_many :hits
  has_many :press_releases
  has_many :reporters
  has_many :media_outlets
  
  def name 
    "Samuel Bowles"
  end
end
