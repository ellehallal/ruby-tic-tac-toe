require_relative 'game_factory.rb'

class Controller
  def initialize(display, game_factory)
    @display = display
    @game_factory = game_factory
  end

  def main_game
    game_setup
    until @game.over?
      play_move
      exit_game?
    end
    end_of_game
  end

  private

  def exit_game?
    if @game.exit_game
      @display.show_exit_message
      exit(0)
    end
  end

  def game_setup
    @game = @game_factory.create_game
  end

  def play_move
    @game.play_move
  end

  def end_of_game
    outcome = @game.tie_or_won
    @display.display_board(@game.board.squares)
    @display.show_game_outcome(outcome)
  end
end
