require_relative 'board.rb'
require_relative 'game.rb'

class GameFactory
  def initialize(player_selector)
    @player_selector = player_selector
  end

  def create_game(squares)
    board = Board.new(squares)
    player1 = @player_selector.create_player(1, 'x')
    player2 = @player_selector.create_player(2, 'o')
    Game.new(board, player1, player2)
  end
end
