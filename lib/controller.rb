require_relative 'game_factory.rb'

class Controller
  def initialize(display, game_factory)
    @display = display
    @game_factory = game_factory
  end

  def main_game(squares = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    game_setup(squares)
    play_move until @game.over?
    end_of_game
  end

  private

  def game_setup(squares = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @game = @game_factory.create_game(squares)
  end

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
