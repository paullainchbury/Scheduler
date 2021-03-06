# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140219080549) do

  create_table "bookings", :force => true do |t|
    t.integer  "course_id"
    t.datetime "start"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "classroom_id"
    t.datetime "endtime"
  end

  create_table "classrooms", :force => true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.datetime "start"
    t.integer  "Mondaystart"
    t.integer  "Mondayend"
    t.integer  "Tuesdaystart"
    t.integer  "Tuesdayend"
    t.integer  "Wednesdaystart"
    t.integer  "Wednesdayend"
    t.integer  "Thursdaystart"
    t.integer  "Thursdayend"
    t.integer  "Fridaystart"
    t.integer  "Fridayend"
    t.integer  "Saturdaystart"
    t.integer  "Saturdayend"
    t.integer  "Sundaystart"
    t.integer  "Sundayend"
    t.integer  "Mondaystartm"
    t.integer  "Mondayendm"
    t.integer  "Tuesdaystartm"
    t.integer  "Tuesdayendm"
    t.integer  "Wednesdaystartm"
    t.integer  "Wednesdayendm"
    t.integer  "Thursdaystartm"
    t.integer  "Thursdayendm"
    t.integer  "Fridaystartm"
    t.integer  "Fridayendm"
    t.integer  "Saturdaystartm"
    t.integer  "Saturdayendm"
    t.integer  "Sundaystartm"
    t.integer  "Sundayendm"
    t.datetime "endtime"
    t.integer  "classroom_id"
    t.boolean  "force_classroom"
    t.integer  "capacity"
  end

  create_table "courses_instructors", :force => true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses_users", :force => true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "admin"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
