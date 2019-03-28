class Controller
  def initialize(game, display)
    @game = game
    @display = display
  end

  def new_game
    main_game
    end_of_game
  end

  def main_game
    until @game.over?
      @display.display_board
      @display.show_current_player(@game.current_player.mark)
      move = @display.ask_for_move
      @game.play_move(move)
    end
  end

  def end_of_game
    outcome = @game.tie_or_won
    @display.display_board
    @display.show_game_outcome(outcome)
  end
end
