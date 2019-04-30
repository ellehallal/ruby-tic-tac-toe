require_relative 'board.rb'
require_relative 'game.rb'

class GameFactory
  def initialize(player_factory, game_validator, game_loader, filename, board, game)
    @player_factory = player_factory
    @game_validator = game_validator
    @game_loader = game_loader
    @filename = filename
    @board = board
    @game = game
  end

  def create_game
    selection = @game_validator.validate_game_type_input(@filename)

    if selection == 'new'
      new_game([1, 2, 3, 4, 5, 6, 7, 8, 9])
    else
      existing_game
    end
  end

  private

  def new_game(squares)
    board = @board.new(squares)
    player1 = @player_factory.create_player('x', 1)
    player2 = @player_factory.create_player('o', 2)
    @game.new(board, player1, player2)
  end

  def existing_game
    game_name = @game_validator.existing_game_selection(@filename)
    @game_loader.load(@filename, game_name)
  end
end
