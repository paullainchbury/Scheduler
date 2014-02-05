class Course < ActiveRecord::Base

  attr_accessible :name, :start, :endtime, :Mondaystart, :Mondayend, :Tuesdaystart, :Tuesdayend, :Wednesdaystart, :Wednesdayend, :Thursdaystart, :Thursdayend, :Fridaystart, :Fridayend, :Saturdaystart, :Saturdayend, :Sundaystart, :Sundayend, :Mondaystartm, :Mondayendm, :Tuesdaystartm, :Tuesdayendm, :Wednesdaystartm, :Wednesdayendm, :Thursdaystartm, :Thursdayendm, :Fridaystartm, :Fridayendm, :Saturdaystartm, :Saturdayendm, :Sundaystartm, :Sundayendm
  has_many :bookings
  has_many :courses_users
  has_many :users, through: :courses_users

  validates_presence_of :name, :start, :endtime


  # validate :classroom_is_available

  scope :coming_up, lambda { where('courses.start > ?', Time.zone.now) }

  

end
