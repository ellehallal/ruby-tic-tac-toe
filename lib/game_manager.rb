class GameManager
  def initialize(game, controller, display)
    @game = game
    @controller = controller
    @display = display
  end

  def play_again?
    choice = @display.ask_play_again
    choice == 'Y'
  end
end
