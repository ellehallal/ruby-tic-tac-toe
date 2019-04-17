require_relative 'board.rb'
require_relative 'game.rb'

class GameFactory
  def initialize(player_factory)
    @player_factory = player_factory
  end

  def create_game(squares)
    board = Board.new(squares)
    player1 = @player_factory.create_player('x', 1)
    player2 = @player_factory.create_player('o', 2)
    Game.new(board, player1, player2)
  end
end
