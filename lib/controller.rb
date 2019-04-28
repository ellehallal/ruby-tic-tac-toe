require_relative 'game_factory.rb'

class Controller
  def initialize(display, game_factory, game_saver, game_validator, filename)
    @display = display
    @game_factory = game_factory
    @game_saver = game_saver
    @game_validator = game_validator
    @filename = filename
  end

  def main_game
    game_setup
    until @game.over?
      play_move
      save_game?
      exit_game?
    end
    end_of_game
  end

  private

  def save_game?
    if @game.save_game
      @game.reset_save_game
      game_name = @game_validator.new_game_name(@filename)
      @game_saver.save(@filename, game_name, @game)
      @display.save_game_confirmation
    end
  end

  def exit_game?
    goodbye if @game.exit_game
  end

  def goodbye
    @display.show_exit_message
    exit(0)
  end

  def game_setup
    @game = @game_factory.create_game
    @display.save_exit_message
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
