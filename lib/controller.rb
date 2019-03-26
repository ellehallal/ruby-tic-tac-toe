class Controller
  def initialize(game)
    @game = game
  end

  def play
    play_game = true
    while play_game
      @game.play_move until @game.is_over?
      @game.tie_or_won
      play_game = play_again?
    end
    @game.display.show_exit_message
  end

  def play_again?
    choice = @game.display.ask_play_again
    if choice == 'Y'
      @game.board.clear_squares
      true
    else
      false
    end
  end
end
