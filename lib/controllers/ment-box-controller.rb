module EQbuddy
  class MentBoxController < Shoes::Widget

    attr_reader :view, :ment

    def initialize(ment)
      @ment = ment
      @view = ment_box self
    end

    def color
      parse_color(ment.district.color)
    end

    def top_bar_pictures
      pictures = []
      ment.teachers.each do |teacher|
        fp = to_image_path(teacher.image_id)
        pictures << fp
      end
      pictures
    end

    def to_image_path(image_id)
      File.expand_path("images/people") + "/" + image_id + ".jpg"
    end

    def parse_color(color)
      case color
      when "green"
        rgb(110,155,35)
      when "red"
        rgb(190,80,60)
      when "blue"
        rgb(0,120,140)
      when "yellow"
        rgb(200,160,60)
      end
    end
  end
end
