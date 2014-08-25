module EQbuddy
  class DraftBoardController < Shoes::Widget

    attr_reader :draft

    def initialize
      # TODO initialize from memory so that the draft board
      # can have a preserved state look feel
      @draft = "published"
      draft_board self
    end

    def create_navbar
      navbar_controller
    end

    def create_ment_boxes(draft)
      ments = Assignment.where(draft: draft)
      ments.each do |ment|
        ment_box_controller(ment)
      end
    end
  end
end
