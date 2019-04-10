class GameManager
  def initialize(controller, display)
    @controller = controller
    @game = @controller.game
    @display = display
  end

  def play
    game_loop
    @display.show_exit_message
  end

  def play_again?
    choice = @display.ask_play_again
    choice == 'Y'
  end

  def game_loop
    play_game = true
    game_selection
    while play_game
      @controller.main_game
      play_game = play_again?
      @game.reset_game
    end
  end

  def game_selection
    selection = 0
    until selection.between?(1, 4)
      @display.show_game_options
      selection = $stdin.gets.to_i
    end
    selection
  end
end
