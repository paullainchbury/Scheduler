# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Classroom.delete_all
Booking.delete_all
Course.delete_all

Classroom.create(name: "1", capacity: 25)
Classroom.create(name: "2", capacity: 20)
Classroom.create(name: "3", capacity: 15)
Classroom.create(name: "4", capacity: 30)
Classroom.create(name: "5", capacity: 25)

Course.create(name: "WDI")
Course.create(name: "UX")
Course.create(name: "User testing")
Course.create(name: "Mobile development")
Course.create(name: "Javascript")
Course.create(name: "CSS")
Course.create(name: "Sinatra")
Course.create(name: "AngularJS")
Course.create(name: "Do this, not this")
Course.create(name: "Rails unchartered")
