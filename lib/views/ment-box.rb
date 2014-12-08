# encoding: utf-8
module EQbuddy
  class MentBox < Shoes::Widget

    attr_reader :controller, :body
    # TODO attr_accessor state - widget is broken right now
    # TODO also, this thing opens and stays open due to some
    #      widget issues as well :(

    def initialize(controller)
      @controller = controller
      @body = stack
      @state = controller.state
      @state == :closed ? draw_closed : draw_open
    end

    def draw_closed
      @state = :closed
      body.style(height: 60, width: 285, margin: [15, 15, 0, 0])
      body.clear do
        flow do
          background controller.color, curve: 5
          draw_pictures
          draw_chevron white
        end
      end
    end

    def draw_open
      @state = :open
      # TODO left should not have to be explicitly set to zero
      # Also, you should attach the bottom background curve to the bottom segment
      # Or something instead of a fixed height like you have here
      body.style(width: 285, margin: [15, 15, 0, 0])
      body.clear do
        flow do
          background controller.color, curve: 5, height: 60
          draw_chevron white
        end
        background rgb(240, 240, 240), height: 40, top: 220, left: 0, curve: 5
        background rgb(240, 240, 240), height: 200, top: 40, left: 0
      end
    end

    def draw_pictures
      controller.top_bar_pictures.each do |picture|
        image picture, height: 44, width: 44, margin: [10, 5, 0, 5]
      end
    end

    def draw_chevron(color)
      # TODO figure out how to get parent width?!
      chevron = @state == :closed ? "\uf078" : "\uf077"
      para chevron, font: "Fontawesome", stroke: color, left: 240, top: 13,
           size: 16, click: proc { @state == :closed ? draw_open : draw_closed }
    end

  end
end
