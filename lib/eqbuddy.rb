class EQbuddy
  def method_missing(symbol, *args, &blk)
    if shoes_method?(symbol)
      $app.send(symbol, *args, &blk)
    else
      super
    end
  end

  def shoes_method?(method_name)
    !self.respond_to?(method_name) && $app.respond_to?(method_name)
  end
end
