#encoding: utf-8
require_relative 'init'

Shoes.app width: 500, height: 400, left: 100, top: 200, title: "EQbuddy" do

  CURR_MONTH = 3
  
  Assignment.all.each do |ment|

    if ment.month == CURR_MONTH
      ment.teachers.each do |teacher|
        para "#{teacher.pref_name} is #{teacher.dob.year - Time.now.year} years old."
      end
    end
  end

end
