module Boots
  class Grid < Shoes::Widget
    def initialize(opts = {}, &blk)
      left_stack = stack width: side_width do
      end

      center_content = stack width: content_width do
        blk.call
      end



      resize do
        left_stack.width = side_width
        center_content.width = content_width
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
        1
      end
    end

    def content_width
      case
      when app.width >= SCREEN_LG_MIN
          CONTENT_WIDTH_LG +5
      when app.width >= SCREEN_MD_MIN 
        CONTENT_WIDTH_MD+5
      when app.width >= SCREEN_SM_MIN 
        CONTENT_WIDTH_SM+5
      when app.width < SCREEN_SM_MIN 
        1.0
      end
    end

  end
end
