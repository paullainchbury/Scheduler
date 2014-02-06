class AddPrefferedClassroomToCourse < ActiveRecord::Migration
  def change
    change_table :courses do |t|
        t.references :classroom
    end
  end
end
