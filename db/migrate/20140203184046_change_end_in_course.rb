class ChangeEndInCourse < ActiveRecord::Migration
  def change
    change_table :courses do |t|
        t.remove :end
        t.datetime :endtime
    end
  end


end
