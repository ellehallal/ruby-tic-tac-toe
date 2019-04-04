class Controller
  def initialize(game, display)
    @game = game
    @display = display
  end

  def main_game
    p @game.over?
    play_move until @game.over?

    end_of_game
  end

  private

  def play_move
    @display.display_board(@game.board.squares)
    @display.show_current_player(@game.current_player.mark)
    move = @display.ask_for_move
    @game.play_move(move)
  end

  def end_of_game
    outcome = @game.tie_or_won
    @display.display_board(@game.board.squares)
    @display.show_game_outcome(outcome)
  end
end
