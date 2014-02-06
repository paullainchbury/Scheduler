class Course < ActiveRecord::Base

  attr_accessible :name, :start, :endtime, :Mondaystart, :Mondayend, :Tuesdaystart, :Tuesdayend, :Wednesdaystart, :Wednesdayend, :Thursdaystart, :Thursdayend, :Fridaystart, :Fridayend, :Saturdaystart, :Saturdayend, :Sundaystart, :Sundayend, :Mondaystartm, :Mondayendm, :Tuesdaystartm, :Tuesdayendm, :Wednesdaystartm, :Wednesdayendm, :Thursdaystartm, :Thursdayendm, :Fridaystartm, :Fridayendm, :Saturdaystartm, :Saturdayendm, :Sundaystartm, :Sundayendm, :classroom_id, :force_classroom

  attr_accessor :thebookings

  has_many :bookings
  has_many :courses_users
  has_many :users, through: :courses_users
  belongs_to :classroom

  before_validation :create_bookings_for_course
  validates_presence_of :name, :start, :endtime
  validate :classroom_available

  scope :coming_up, lambda { where('courses.start > ?', Time.zone.now) }
  
  def create_bookings_for_course
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

      # Here's where the book in alternative classroom needs to go!

      # Get a list of available classrooms on the date of the clash

      # Choose the room with the closest capacity to the preferred room.

      # If force_classroom = true, book it.
      binding.pry


      clashes.each do |clash|
        error_string = "Classroom #{self.classroom.name} isn't available on:\n"
        error_string += clash.start.strftime("%A - %d/%m/%y")
        errors.add :course, error_string
      end
    end
  end

  

  

end
