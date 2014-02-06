class User < ActiveRecord::Base
  has_secure_password
  
  has_many :courses_users
  has_many :courses_instructors

  has_many :courses_as_student, through: :courses_users, source: :course
  has_many :courses_as_instructor, through: :courses_instructors, source: :course

  attr_accessible :name, :email, :password, :password_confirmation
  validates_uniqueness_of :email

  accepts_nested_attributes_for :courses_as_student, :courses_as_instructor
  
  



end
