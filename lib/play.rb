require_relative './game.rb'
require_relative './board.rb'
require_relative './player.rb'
require_relative './display.rb'
require_relative './controller.rb'

display = Display.new
player1 = Player.new('x')
player2 = Player.new('o')
board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
game = Game.new(board, display, player1, player2)
controller = Controller.new(game)

controller.play
