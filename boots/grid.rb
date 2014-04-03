module Boots
  class Grid < Shoes::Widget
    def initialize(opts = {}, &blk)
      s = stack margin_left: side_width do
        blk.call
      end

      resize do
        s.margin_left = side_width
      end
    end

    private

    def side_width
      case
      when app.width >= SCREEN_LG_MIN
        (app.width - CONTENT_WIDTH_LG)/2
      when app.width >= SCREEN_MD_MIN 
        (app.width - CONTENT_WIDTH_MD)/2
      when app.width >= SCREEN_SM_MIN 
        (app.width - CONTENT_WIDTH_SM)/2
      when app.width < SCREEN_SM_MIN 
        0
      end
    end
  end
end
