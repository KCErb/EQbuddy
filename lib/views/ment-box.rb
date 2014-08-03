module EQbuddy
  class MentBox < Shoes::Widget

    attr_reader :controller, :top_bar, :stack
    attr_accessor :state

    def initialize(controller)
      @controller = controller
      @state = :closed
      draw_stack
    end

    def draw_stack
      @stack = flow height: 45 do
        @top_bar = background eval(controller.color), curve: 5
        draw_pictures
      end
    end

    def draw_pictures
      flow do
        controller.top_bar_pictures.each do |picture|
          image picture, height: 45
        end
      end
    end

  end
end
