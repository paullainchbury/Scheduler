class AddClassroomForceToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :force_classroom, :boolean
  end
end
