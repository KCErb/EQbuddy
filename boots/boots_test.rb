require_relative 'col'
require_relative 'row'

Shoes.app width: 1200 do
  row do
    col lg: 6 do
      background purple
      para "Content"
    end
    col lg: 6 do
      background red
      para "content"
    end
  end
end


