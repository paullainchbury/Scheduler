class Booking < ActiveRecord::Base
  attr_accessible :course, :endtime, :start, :course_id, :classroom_id
  belongs_to :course
  belongs_to :classroom

  scope :coming_up, lambda { where('bookings.start > ?', Time.zone.now) }

  scope :for_course, lambda { |course| where(course_id: course) }

  scope :for_student, lambda { |user| where(course_id: user.course_ids).order(:start) }

  scope :for_classroom, lambda { |classroom| where(classroom_id: classroom) }

end


