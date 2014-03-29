module Boots
  class Row < Shoes::Widget
    def initialize(opts = {}, &blk)
      @opts = opts
      @blk = blk
      margin_array = [0, 10, 0, 10]


      f1 = flow margin: margin_array, width: side_width do
        background red
      end

      f2 = flow margin: margin_array, width: content_width do
        background blue
        blk.call
      end

      f3 = flow margin: margin_array, width: side_width do
        background green
      end

      app.resize do
        f1.width = side_width
        f2.width = content_width
        f3.width = side_width
      end
    end

    private

    def side_width
      case
      when app.width < SCREEN_SM_MIN
        1
      when app.width < SCREEN_MD_MIN
        (app.width - CONTENT_WIDTH_SM)/2
      when app.width < SCREEN_LG_MIN
        (app.width - CONTENT_WIDTH_MD)/2
      else
        (app.width - CONTENT_WIDTH_LG)/2
      end
    end

    def content_width
      case
      when app.width < SCREEN_SM_MIN
        1.0
      when app.width < SCREEN_MD_MIN
        CONTENT_WIDTH_SM
      when app.width < SCREEN_LG_MIN
        CONTENT_WIDTH_MD
      else
        CONTENT_WIDTH_LG
      end

    end
  end
end
