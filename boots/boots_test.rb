require_relative 'col'
require_relative 'row'
LARGE = 1200
MEDIUM = 1000
SMALL = 800
XSMALL = 600

Shoes.app width: XSMALL do
  
  row do
   @c1= col lg: 4, md: 6, sm: 8, xs: 10 do
      background white
      para "content"
    end
    @c2= col lg: 4, md: 6, sm: 8, xs: 10 do
      background blue
      para "content"
    end
    @c3= col lg: 4, md: 6, sm: 8, xs: 10 do
      background red
      para "content"
    end
  end

end


