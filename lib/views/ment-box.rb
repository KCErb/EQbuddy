module EQbuddy
  class MentBox < Shoes::Widget
    attr_reader :slot, :top_bar
    def initialize(txt)
      @slot = flow height: 100, width: 200, margin: 10 do
        @top_bar = background red, height: 100, curve: 5
        para txt, margin: 20

        hover do
          @top_bar.style(fill: gray)
        end
        leave do
          @top_bar.style(fill: red)
        end
      end
    end
  end
end
