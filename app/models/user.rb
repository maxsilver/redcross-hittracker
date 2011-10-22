class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :hits
  has_many :press_releases
  has_many :reporters
  has_many :media_outlets
end
