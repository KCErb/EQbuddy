module EQbuddy
  class DraftBoard < Shoes::Widget
    def initialize(controller)
      background white
      controller.create_navbar
      controller.create_ment_boxes controller.draft
    end
  end
end
