class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :course
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
