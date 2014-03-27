class Col < Shoes::Widget
  def initialize(opts = {}, &blk)
    s = stack width: col_width(opts) do
      flow do
        blk.call
      end
    end
    
    app.resize do
      s.width = col_width(opts)
    end
  end
  
  private

  def col_width(opts)
    weight = case 
             when app.width >= 1200 && opts[:lg]
               opts[:lg]
             when app.width >= 992 && opts[:md]
               opts[:md]
             when app.width >= 768 && opts[:sm]
               opts[:sm]
             when app.width < 768 && opts[:xs]
               opts[:xs]
             else
               12
             end
    weight.to_f/12.0
  end

end
