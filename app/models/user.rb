class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :receive_notifications, :admin
  scope :subscribed, where(:receive_notifications => true)

  has_many :hits
  has_many :press_releases
  has_many :reporters
  has_many :media_outlets

end
