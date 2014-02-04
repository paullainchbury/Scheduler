class AddMinutesToCourse < ActiveRecord::Migration
  def change
    change_table :courses do |t|
      t.integer :Mondaystartm
      t.integer :Mondayendm

      t.integer :Tuesdaystartm
      t.integer :Tuesdayendm

      t.integer :Wednesdaystartm
      t.integer :Wednesdayendm

      t.integer :Thursdaystartm
      t.integer :Thursdayendm

      t.integer :Fridaystartm
      t.integer :Fridayendm

      t.integer :Saturdaystartm
      t.integer :Saturdayendm

      t.integer :Sundaystartm
      t.integer :Sundayendm
    end
  end
end
