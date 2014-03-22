class MentBox < Shoes::Widget
  def initialize(txt)
   @f = flow height: 100, width: 200, margin: 10 do
      background red
      para txt, margin: 20

      hover do
        alert "hovered over #{txt}!"
      end
    end
  end
end
