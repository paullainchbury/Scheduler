class User < ActiveRecord::Base
  has_secure_password
  
  has_many :courses, through: :courses_users
  has_many :courses_users

  attr_accessible :name, :email, :password, :password_confirmation
  validates_uniqueness_of :email

  accepts_nested_attributes_for :courses
  
end
