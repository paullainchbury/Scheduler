class AddDatesToCourses < ActiveRecord::Migration
  def change
    change_table :courses do |t|
      t.datetime :start
      t.datetime :end
    end
  end
end
