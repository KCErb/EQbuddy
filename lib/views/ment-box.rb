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
      flow height: 45 do
        background eval(controller.color), curve: 5
        draw_pictures
        draw_chevron
      end
    end

    def draw_pictures
        controller.top_bar_pictures.each do |picture|
          image picture, height: 45
        end
    end

    def draw_chevron
      para "\uf078", font: "Fontawesome", stroke: white
    end

  end
end
