class AddDatesToCoursesAgain < ActiveRecord::Migration
    def change
    change_table :courses do |t|
      t.integer :Mondaystart
      t.integer :Mondayend

      t.integer :Tuesdaystart
      t.integer :Tuesdayend

      t.integer :Wednesdaystart
      t.integer :Wednesdayend

      t.integer :Thursdaystart
      t.integer :Thursdayend

      t.integer :Fridaystart
      t.integer :Fridayend

      t.integer :Saturdaystart
      t.integer :Saturdayend

      t.integer :Sundaystart
      t.integer :Sundayend
    end
  end
end
