Shoes.app do
  #Navbars
  navbar fixed: true do
    header "EQbuddy"
    navbar_collapse do
      link "Assignments"
      link "People"
      divider
      dropdown "options" do
        link "Send Assignments"
        link "Print Assignments"
        divider
        dropdown_header "Show"
        link "Teachers"
        link "Teachees"
      end
    end
  end
  
  # Grid system - Rows flow. So if I make two columns in a row one with
  # size 12 and the other size 6 on mobile it will just leave the second
  # on the next row without a buddy.
  row do
    col xs: 12, sm: 8, md: 6, lg: 4 do
    end
    col do
    end
    col do 
    end
  end

  #Buttons - default, primary success info warning danger link
  # sizes - lg, default, sm, xs
  btn type: :default, size: :lg, glyphicon: :search do
  end


  #Icons
  glyphicon name: :search

  #Bootstrap styles h1-h6, small just make aliases h1 : title etc.
  h1 "" 
  title "" 

  #Image resize - just use img and it will do the rest . . .
  img "" do
  end

end
