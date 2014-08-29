# encoding: utf-8
module EQbuddy
  class MentBox < Shoes::Widget

    attr_reader :controller, :body
    attr_accessor :state

    def initialize(controller)
      @controller = controller
      @body = stack
      @state = :closed
      @state == :closed ? draw_closed : draw_open
    end

    def draw_closed
      p "draw closed called"
      @body.style(height: 60, width: 285, margin: [15, 15, 0, 0])
      @body.clear do
        flow do
          background controller.color, curve: 5
          draw_pictures
          draw_chevron(:down, white, 16)
        end
      end
    end

    def draw_pictures
      controller.top_bar_pictures.each do |picture|
        image picture, height: 44, width: 44, margin: [10, 5, 0, 5]
      end
    end

    def draw_chevron(which, color, size)
      # TODO figure out how to get parent width?!
      chevron = which == :down ? "\uf078" : "\uf077"
      pa = para chevron, font: "Fontawesome", stroke: color, left: 240, top: 13,
      size: size, weight: "light", click: proc {which == :down ? draw_open : draw_closed }
    end

    def draw_open
      p "draw open called"
      # TODO: left should not have to be explicitly set to zero
      # Also, you should attach the bottom background curve to the bottom segment
      # Or something instead of a fixed height like you have here
      @body.clear do
        flow do
          background controller.color, curve: 5, height: 60
          draw_chevron(:up, white, 16)
        end
        background rgb(240, 240, 240), height: 40, top: 220, left: 0, curve: 5
        background rgb(240, 240, 240), height: 200, top: 40, left: 0
      end
      @body.style(width: 285, margin: [15, 15, 0, 0])
    end

  end
end
