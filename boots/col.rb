module Boots
  class Col < Shoes::Widget
    def initialize(opts = {}, &blk)
      s = stack width: col_size(opts), height: 40 do
        background rgb(223, 217, 229)
        border rgb(187, 176, 202)
        flow do
          blk.call
        end
      end

      resize do
        s.width = col_size(opts) if size_transition?
      end
    end

    private
   
    def col_size(opts)
      case
      when app.width >= SCREEN_LG_MIN && opts[:lg]
        opts[:lg] * column_width
      when app.width >= SCREEN_MD_MIN && opts[:md]
        opts[:md] * column_width
      when app.width >= SCREEN_SM_MIN && opts[:sm]
        opts[:sm] * column_width
      when app.width < SCREEN_SM_MIN && opts[:xs]
        opts[:xs] * column_width
      else
        12 * column_width 
      end
    end

    def column_width
      case
      when app.width >= SCREEN_LG_MIN
        @curr_size = "lg"
        COL_WIDTH_LG
      when app.width >= SCREEN_MD_MIN 
        @curr_size = "md"
        COL_WIDTH_MD
      when app.width >= SCREEN_SM_MIN 
        @curr_size = "sm"
        COL_WIDTH_SM
      when app.width < SCREEN_SM_MIN 
        @curr_size = "xs"
        1.0
      end
    end

    def size_transition?
      @prev_size = @curr_size
      column_width
      @new_size = @curr_size
      @prev_size != @curr_size
    end

  end
end
