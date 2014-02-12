class Course < ActiveRecord::Base

  attr_accessible :name, :start, :endtime, :Mondaystart, :Mondayend, :Tuesdaystart, :Tuesdayend, :Wednesdaystart, :Wednesdayend, :Thursdaystart, :Thursdayend, :Fridaystart, :Fridayend, :Saturdaystart, :Saturdayend, :Sundaystart, :Sundayend, :Mondaystartm, :Mondayendm, :Tuesdaystartm, :Tuesdayendm, :Wednesdaystartm, :Wednesdayendm, :Thursdaystartm, :Thursdayendm, :Fridaystartm, :Fridayendm, :Saturdaystartm, :Saturdayendm, :Sundaystartm, :Sundayendm, :classroom_id, :force_classroom, :courses_instructors_attributes, :instructor_ids

  attr_accessor :thebookings

  has_many :bookings, :dependent => :destroy
  # Would be good to send signed up users an email when a course is cancelled.
  has_many :courses_users, :dependent => :destroy 
  has_many :courses_instructors, :dependent => :destroy
  has_many :students, through: :courses_users, source: :user
  has_many :instructors, through: :courses_instructors, source: :user
  belongs_to :classroom

  accepts_nested_attributes_for :courses_instructors

  before_validation :create_bookings_for_course
  validates_presence_of :name, :start, :endtime
  validate :classroom_available
  validate :instructor_available

  scope :coming_up, lambda { where('courses.start > ?', Time.zone.now) }
  
  def create_bookings_for_course

    # Destroy existing bookings for this course.
    # Is this going to delete all the bookings even if the new ones aren't saved??
    Booking.for_course(self.id).destroy_all



    @thebookings = []

    start1 = self.start.beginning_of_day
    end1 = self.endtime.end_of_day

    date_range = (start1.to_i..end1.to_i).step(1.day)

    thebookings = []

    date_range.each do |date_as_i|

      date = Time.at(date_as_i).to_datetime
      start_timeh = nil
      weekday = date.wday

      if weekday == 1 && !(self.Mondaystart.blank?)
        start_timeh = self.Mondaystart.to_i
        start_timem = self.Mondaystartm.to_i
        end_timeh = self.Mondayend.to_i
        end_timem = self.Mondayendm.to_i
      end

      if weekday == 2 && !(self.Tuesdaystart.blank?)
        start_timeh = self.Tuesdaystart.to_i
        start_timem = self.Tuesdaystartm.to_i
        end_timeh = self.Tuesdayend.to_i
        end_timem = self.Tuesdayendm.to_i
      end

      if weekday == 3 && !(self.Wednesdaystart.blank?)
        start_timeh = self.Wednesdaystart.to_i
        start_timem = self.Wednesdaystartm.to_i
        end_timeh = self.Wednesdayend.to_i
        end_timem = self.Wednesdayendm.to_i
      end

      if weekday == 4 && !(self.Thursdaystart.blank?)
        start_timeh = self.Thursdaystart.to_i
        start_timem = self.Thursdaystartm.to_i
        end_timeh = self.Thursdayend.to_i
        end_timem = self.Thursdayendm.to_i
      end

      if weekday == 5 && !(self.Fridaystart.blank?)
        start_timeh = self.Fridaystart.to_i
        start_timem = self.Fridaystartm.to_i
        end_timeh = self.Fridayend.to_i
        end_timem = self.Fridayendm.to_i
      end

      if weekday == 6 && !(self.Saturdaystart.blank?)
        start_timeh = self.Saturdaystart.to_i
        start_timem = self.Saturdaystartm.to_i
        end_timeh = self.Saturdayend.to_i
        end_timem = self.Saturdayendm.to_i
      end

      if weekday == 0 && !(self.Sundaystart.blank?)
        start_timeh = self.Sundaystart.to_i
        start_timem = self.Sundaystartm.to_i
        end_timeh = self.Sundayend.to_i
        end_timem = self.Sundayendm.to_i
      end

      if start_timeh!=nil
        starttime = DateTime.new(date.year, date.month, date.day, start_timeh, start_timem)
        endtime = DateTime.new(date.year, date.month, date.day, end_timeh, end_timem)
        @thebookings << self.bookings.build(start: starttime, endtime: endtime, classroom_id: self.classroom_id)
      end
    end
  end

  def classroom_available
    clashes = []
    
    classroom_bookings = Booking.for_classroom(self.classroom_id).where('bookings.start > ?', self.start.beginning_of_day).where('bookings.start < ?', self.endtime.end_of_day)

    classroom_bookings.each do |existing_booking|
      @thebookings.each do |new_booking|
        if existing_booking.start < new_booking.endtime && new_booking.start < existing_booking.endtime
          clashes << new_booking
        end  
      end
    end

    if clashes.any?

      if self.force_classroom != true
        clashes.each do |clash|
          error_string = "Classroom #{self.classroom.name} isn't available on:\n"
          error_string += clash.start.strftime("%A - %d/%m/%y")
          errors.add :course, error_string
        end
      end

      if self.force_classroom
        clashfix = 0
        no_of_clashes = clashes.count
        other_classrooms = Classroom.where('id <> ?', self.classroom_id).order(:capacity).reverse_order
        
        clashes.each do |clash|
          
          other_classrooms.each do |classroom|
            if Booking.for_classroom(classroom.id).between(clash.start, clash.endtime).empty?
            clashfix +=1
            clash.classroom_id = classroom.id
            break
            end
          end
        end

        if clashfix != no_of_clashes
          error_string = "You can't book this course as there are no available classrooms for one or more of your class dates"
          errors.add :course, error_string
        end



        

      end
    end
  end

  # ---------------

def instructor_available
    clashes = []
    
    
    if self.instructors.any?
    instructor_bookings = Booking.for_student(self.instructors.first).where('bookings.start > ?', self.start.beginning_of_day).where('bookings.start < ?', self.endtime.end_of_day) + Booking.for_instructor(self.instructors.first).where('bookings.start > ?', self.start.beginning_of_day).where('bookings.start < ?', self.endtime.end_of_day)

    if !instructor_bookings.blank?
        instructor_bookings.each do |existing_booking|
        @thebookings.each do |new_booking|
          if (existing_booking.start < new_booking.endtime && new_booking.start < existing_booking.endtime)
            clashes << new_booking
          end  
        end
      end
    end
  end



  if clashes.any?
    # binding.pry
    clashes = clashes.uniq
    clashes.each do |clash|
      starttime = clash.start.strftime("%I:%M %p")
      endtime = clash.endtime.strftime("%I:%M %p")
      clashdate = clash.start.strftime("%A, ")
      clashdate += clash.start.day.ordinalize
      clashdate += clash.start.strftime(" of %B")
      errors.add :course, "#{self.instructors.first.name} is not available between #{starttime} and #{endtime} on the #{clashdate}"
    end
  end

  end

  

end
