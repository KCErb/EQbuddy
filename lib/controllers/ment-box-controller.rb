module EQbuddy
  class MentBoxController

    attr_reader :view, :ment

    def initialize(ment)
      @ment = ment
      @view = EQbuddy.app.ment_box self
    end

    def color
      ment.district.color
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
  end
end
