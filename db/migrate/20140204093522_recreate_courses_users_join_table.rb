class RecreateCoursesUsersJoinTable < ActiveRecord::Migration
  def change
    drop_table :courses_users

    create_table :courses_users do |t|
      t.references :course
      t.references :user
      t.string :user_type
      t.timestamps
    end

  end
end
