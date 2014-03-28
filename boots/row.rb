module Boots
  class Row < Shoes::Widget
    def initialize(opts = {}, &blk)
      @opts = opts
      @blk = blk
      margin_array = [0, 10, 0, 10]


      f = flow margin: margin_array, width: side_width do
        background red
      end

      f = flow margin: margin_array, width: content_width do
        background blue
        blk.call
      end

      f = flow margin: margin_array, width: side_width do
        background red
      end

      p side_width
      
      #app.resize do
      # a flows margins can't be set this way yet. . .
      #  f.style( margin: margin_array)
      #end
    end

    private

    def side_width
      case
      when app.width < SCREEN_SM_MIN
        0.0
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
