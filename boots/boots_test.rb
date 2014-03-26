require_relative 'col'
require_relative 'row'
Shoes.app width: 1000 do
  row do
    col lg: 6, md: 4 do
      background purple
      para "content"
    end
    col lg: 6, md: 4 do
      background red
      para "content"
    end
  
    col lg: 6, md: 4 do
      background blue
      para "content"
    end
  end
end


