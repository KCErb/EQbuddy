class EQBuddy

  def method_missing(symbol, *args, &blk)
    if app_should_handle_method? symbol
      app.send(symbol, *args, &blk)
    else
      super
    end
  end

  def go
    alert "test"
  end
end




Shoes.app width: 200, height: 100, title: "EQBuddy" do
  a = EQBuddy.new
  a.go
end
