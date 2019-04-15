require_relative 'player_selector.rb'
require_relative 'board.rb'
require_relative 'game.rb'

class GameFactory
  def initialize(player_selector)
    @player_selector = player_selector
  end

  def create_game(squares)
    board = Board.new(squares)
    player1 = @player_selector.player1_type
    player2 = @player_selector.player2_type
    Game.new(board, player1, player2)
  end
end
