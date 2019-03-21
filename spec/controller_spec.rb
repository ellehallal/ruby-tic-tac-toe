require 'controller'
require 'board'
require 'display'
require 'game'
require 'player'

RSpec.describe Controller do
  describe 'Controller: ' do
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    display = Display.new
    player1 = Player.new('x')
    player2 = Player.new('o')
    game = Game.new(board, display, player1, player2)
    controller = Controller.new(game)
  end
end
