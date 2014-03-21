class MentBox < EQbuddy
  def initialize(txt)
    flow height: 100, width: 200, margin: 10 do
      background red
      para txt, margin: 20

      hover do
        alert "hovered over #{txt}"
      end
    end
  end
end
