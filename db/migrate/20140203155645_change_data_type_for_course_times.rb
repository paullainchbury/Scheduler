class ChangeDataTypeForCourseTimes < ActiveRecord::Migration
  def change
    change_table :courses do |t|

    t.remove :Mondaystart
    t.remove :Mondayend
    t.remove :Tuesdaystart
    t.remove :Tuesdayend
    t.remove :Wednesdaystart
    t.remove :Wednesdayend
    t.remove :Thursdaystart
    t.remove :Thursdayend
    t.remove :Fridaystart
    t.remove :Fridayend
    t.remove :Saturdaystart
    t.remove :Saturdayend
    t.remove :Sundaystart
    t.remove :Sundayend 
  end

    
  end
end
