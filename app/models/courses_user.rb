class CoursesUser < ActiveRecord::Base
  attr_accessible :course_id, :user_id, :user_type
  
  belongs_to :course
  belongs_to :user

  validate :not_clashing

  validate :not_already_enrolled



  def not_already_enrolled
    existing_enrolment = CoursesUser.where(user_id: user_id, course_id: course_id).where("courses_users.id != ?", id.to_i).count

    if existing_enrolment > 0
      errors.add :user, "You're already enrolled on this course!"
    end
  end



  def not_clashing
    clash = nil
    users_existing_bookings = Booking.for_student(user).coming_up
    this_courses_bookings = Booking.for_course(course).coming_up

    this_courses_bookings.each do |course_date|
      users_existing_bookings.each do |student_date|
        if course_date.start < student_date.endtime && student_date.start < course_date.endtime
          clash = Course.find(student_date.course_id).name
        end  
      end
    end


    if !clash.blank?
      errors.add(:base, "You can't enrol on #{course.name} as it clashes with #{clash}.")
      return
    end

  end
end
