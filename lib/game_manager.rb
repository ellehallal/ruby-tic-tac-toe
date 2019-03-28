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

  def game_loop
    play_game = true
    while play_game
      @controller.new_game
      play_game = play_again?
      @game.reset_game
    end
  end

  def play
    game_loop
    @display.show_exit_message
  end
end