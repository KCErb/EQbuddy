module Boots
  class Row < Shoes::Widget
    def initialize(opts = {}, &blk)
      @opts = opts
      @blk = blk

      flow margin_bottom: 10 do
        blk.call
      end

    end
  end
end
