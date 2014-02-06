class CreateCoursesInstructorsJoinTable < ActiveRecord::Migration
  def change
    create_table :courses_instructors do |t|
      t.references :course
      t.references :user
      t.timestamps
    end

  end
end
