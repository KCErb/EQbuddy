#encoding: utf-8
require_relative 'init'

Shoes.app width: 500, height: 400, left: 100, top: 200, title: "EQbuddy" do

  Assignment.all.each do |ment|
    ment.teachers.each do |teacher|
      para "#{teacher.pref_name} is #{teacher.dob.year - Time.now.year} years old."
    end
  end
end
