class AddTimesToCourse < ActiveRecord::Migration
  def change
    change_table :courses do |t|
      t.time :Mondaystart
      t.time :Mondayend

      t.time :Tuesdaystart
      t.time :Tuesdayend

      t.time :Wednesdaystart
      t.time :Wednesdayend

      t.time :Thursdaystart
      t.time :Thursdayend

      t.time :Fridaystart
      t.time :Fridayend

      t.time :Saturdaystart
      t.time :Saturdayend

      t.time :Sundaystart
      t.time :Sundayend
    end
  end
end
