#encoding: utf-8
# Define common eqbuddy methods
# start the app


class EQbuddy
  def method_missing(symbol, *args, &blk)
    if shoes_method?(symbol)
      $app.send(symbol, *args, &blk)
    else
      super
    end
  end

  def shoes_method?(method_name)
    !self.respond_to?(method_name) && $app.respond_to?(method_name)
  end
end

require_relative 'init'

Shoes.app width: 500, height: 400, left: 100, top: 200, title: "EQbuddy" do
$app = self

  Assignment.all.each do |ment|
    ment.teachers.each do |teacher|
      MentBox.new(teacher.pref_name)
    end
  end

end
