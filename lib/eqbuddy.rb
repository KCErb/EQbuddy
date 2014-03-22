#encoding: utf-8

require_relative 'init'

Shoes.app width: 500, height: 400, left: 100, top: 200, title: "EQbuddy" do

  Assignment.where(published: true).each do |ment|
    ment.teachers.each do |teacher|
      ment_box(teacher.pref_name)
    end
  end

end
