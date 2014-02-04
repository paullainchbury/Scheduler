class AddClassroomIdToBookings < ActiveRecord::Migration
  change_table :bookings do |t|
    t.references :classroom
  end
end
