# encoding: utf-8
module EQbuddy
  class MentBox < Shoes::Widget

    attr_reader :controller, :top_bar
    attr_accessor :state

    def initialize(controller)
      @controller = controller
      @state = :closed
      @state == :closed ? draw_closed : draw_open
    end

    def draw_closed
      flow height: 65, width: 305, margin: 10 do
        background controller.color, curve: 5
        draw_pictures
        draw_chevron
      end
    end

    def draw_pictures
      controller.top_bar_pictures.each do |picture|
        image picture, height: 44, width: 44, margin: [10, 5, 0, 5]
      end
    end

    def draw_chevron
      # TODO figure out how to get parent width?!
      para "\uf078", font: "Fontawesome", stroke: white, left: 265, top: 20,
      size: 20
    end

  end
end
