class Controller
  def initialize(game, display)
    @game = game
    @display = display
  end

  def new_game
    @game.reset_game
    until @game.over?
      @display.display_board
      @display.show_current_player(@game.current_player.mark)
      move = @display.ask_for_move
      @game.play_move(move)
    end
    end_of_game
  end

  def end_of_game
    outcome = @game.tie_or_won
    @display.display_board
    @display.show_game_outcome(outcome)
  end

  def play_again?
    choice = @display.ask_play_again
    choice == 'Y'
  end

  def play
    play_game = true
    while play_game
      new_game
      play_game = play_again?
    end
    @display.show_exit_message
  end
end
