class Controller
  attr_reader :game
  def initialize(game, display)
    @game = game
    @display = display
  end

  def main_game
    play_move until @game.over?
    end_of_game
  end

  private

  def play_move
    @game.play_move
    @game.toggle_current_player
  end

  def end_of_game
    outcome = @game.tie_or_won
    @display.display_board(@game.board.squares)
    @display.show_game_outcome(outcome)
  end
end
