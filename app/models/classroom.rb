class Classroom < ActiveRecord::Base
  attr_accessible :capacity, :name

  has_many :bookings
  validates_presence_of :name, :capacity 

end
