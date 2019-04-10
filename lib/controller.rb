class Controller
  attr_reader :game
  def initialize(game, display)
    @game = game
    @display = display
  end

  def main_game
    @game.over?
    play_move until @game.over?
    end_of_game
  end

  private

  def play_move
    @display.display_board(@game.board.squares)
    @display.show_current_player(@game.current_player_mark)
    move = @display.ask_for_move(@game.board)
    @game.play_move(move)
  end

  def end_of_game
    outcome = @game.tie_or_won
    @display.display_board(@game.board.squares)
    @display.show_game_outcome(outcome)
  end
end
