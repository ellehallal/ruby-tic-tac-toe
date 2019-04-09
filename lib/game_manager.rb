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

  def game_selection
    selection = prompt_game_selection
    validate_game_selection(selection)
    selection
  end

  private

  def game_loop
    play_game = true
    while play_game
      game_selection
      @controller.main_game
      play_game = play_again?
      @game.reset_game
    end
  end

  def prompt_game_selection
    @display.show_game_options
    selection = $stdin.gets.to_i
  end

  def validate_game_selection(selection)
    until selection.between?(1, 4)
      @display.show_invalid_option_message
      selection = prompt_game_selection
    end
  end

  
end
