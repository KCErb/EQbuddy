module EQbuddy

  def start(app)
    EQbuddy.app = app
    start_draft_board
  end

  def self.app
    @app
  end

  def self.app=(app)
    @app = app
  end

  def start_draft_board
    DraftBoardController.new
  end
end
