class Row < Shoes::Widget
  def initialize(*opts, &blk)
    @opts = opts
    @blk = blk
    flow do
      blk.call
    end
  end
end
