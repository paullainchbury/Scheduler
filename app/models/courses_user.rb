class CoursesUser < ActiveRecord::Base
  attr_accessible :course_id, :user_id, :user_type
  
  belongs_to :course
  belongs_to :user
end
