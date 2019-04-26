require_relative 'board.rb'
require_relative 'game.rb'

class GameFactory
  def initialize(player_factory, game_validator, game_loader, filename)
    @player_factory = player_factory
    @game_validator = game_validator
    @game_loader = game_loader
    @filename = filename
    @squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def create_game
    selection = @game_validator.validate_game_type_input

    if selection == 'new'
      new_game(@squares)
    else
      existing_game
    end
  end

  private

  def new_game(squares)
    board = Board.new(squares)
    player1 = @player_factory.create_player('x', 1)
    player2 = @player_factory.create_player('o', 2)
    Game.new(board, player1, player2)
  end

  def existing_game
    game_name = @game_validator.existing_game_selection(@filename)
    @game_loader.load(@filename, game_name)
  end
end
