class Classroom < ActiveRecord::Base
  attr_accessible :capacity, :name

  has_many :bookings


end
