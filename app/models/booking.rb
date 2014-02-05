class Booking < ActiveRecord::Base
  attr_accessible :course, :endtime, :start, :course_id, :classroom_id
  belongs_to :course
  belongs_to :classroom

  scope :for_course, lambda { |course| where(course_id: course) }

  scope :for_students

  scope :for_classroom, lambda { |classroom| where(classroom_id: classroom) }

end


