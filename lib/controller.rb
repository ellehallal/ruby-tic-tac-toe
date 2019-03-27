class Controller
  def initialize(game, board, display)
    @game = game
    @board = board
    @display = display
  end

  def play
      until @game.over?
        @display.display_board
        @display.show_current_player(@game.current_player.mark)
        move = @display.ask_for_move
        @game.play_move(move)
      end
      outcome = @game.tie_or_won
      @display.display_board
      @display.show_game_outcome(outcome)
  end

  def play_again?
    choice = @display.ask_play_again
    if choice == 'Y'
      @board.clear_squares
      true
    else
      false
    end
  end
end
