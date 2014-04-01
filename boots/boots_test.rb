require_relative 'boots'
Shoes.app width: 700 do

  style(Shoes::Para, size: 16, margin: 10)

  grid do
    row do
      12.times do
        col md: 1 do
          para "col-md-1"
        end
      end
    end

    row do
      col md: 8 do
        para ".col-md-8"
      end
      col md: 4 do 
        para ".col-md-4"
      end
    end

    row do
      3.times do
        col md: 4 do
          para ".col-md-4"
        end
      end
    end
    row do
      2.times do
        col md: 6 do
          para ".col-md-6"
        end
      end
    end
  end
end
