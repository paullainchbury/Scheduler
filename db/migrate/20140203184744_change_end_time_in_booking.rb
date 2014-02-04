class ChangeEndTimeInBooking < ActiveRecord::Migration
  def change
    change_table :bookings do |t|
        t.remove :end
        t.datetime :endtime
    end
  end
end
