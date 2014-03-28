module Boots
  class Col < Shoes::Widget
    def initialize(opts = {}, &blk)
      s = stack width: col_width(opts), height: 40 do
        background rgb(223, 217, 229)
        border rgb(187, 176, 202)
        flow do
          blk.call
        end
      end

      #Adds the following to the app.resize array upon initialization
      app.resize do
        s.width = col_width(opts)
      end
    end

    private

    def col_width(opts)
      width = case 
              when app.width >= SCREEN_LG_MIN && opts[:lg]
                opts[:lg] * COL_WIDTH_LG
              when app.width >= SCREEN_MD_MIN && opts[:md]
                opts[:md] * COL_WIDTH_MD
              when app.width >= SCREEN_SM_MIN && opts[:sm]
                opts[:sm] * COL_WIDTH_SM
              when app.width < SCREEN_SM_MIN && opts[:xs]
                opts[:xs].to_f / 12.0
              else
                1.0
              end
    end

  end
end
