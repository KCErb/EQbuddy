module EQbuddy
  class DraftBoardController
    def initialize
      # TODO initialize from memory so that the draft board
      # can have a preserved state look feel
      draft = "published"
      create_ment_boxes(draft)
    end

    def create_ment_boxes(draft)
      ments = Assignment.where(draft: draft)
      ments.each do |ment|
        MentBoxController.new(ment)
      end
    end
  end
end
