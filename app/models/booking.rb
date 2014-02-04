class Booking < ActiveRecord::Base
  attr_accessible :course, :endtime, :start, :course_id, :classroom_id
  belongs_to :course
  belongs_to :classroom
  # validate :dates_overlap?
 
  # def dates_overlap?

  #   # thebookings = Booking.all
  #   thebookings = Booking.where('start BETWEEN ? AND ?', self.start, self.end)
  #   # Need to do a sql query to get all the bookings where the start date between the self.start and self.end
  #   thebookings.each do |booking|
  #     start1 = booking.start
  #     end1 = booking.end
  #     start2 = self.start
  #     end2 = self.end
  #     if start1 < end2 and start2 < end1
  #       errors.add(:start, "date overlaps another course")
  #     end
  #   end
  # end

end


