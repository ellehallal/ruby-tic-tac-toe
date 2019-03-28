require 'controller'
require 'board'
require 'display'
require 'game'
require 'player'

def controller_setup(squares, mark1, mark2)
  board = Board.new(squares)
  display = Display.new(board)
  player1 = Player.new(mark1)
  player2 = Player.new(mark2)
  game = Game.new(board, player1, player2)
  controller = Controller.new(game, display)
  controller
end

RSpec.describe Controller do
  describe 'Displays outcome of game:' do
    it 'displays the board and x is the winner' do
      controller = controller_setup(['x', 'x', 'o', 'o', 'x', 'x', 'o', 'o', 'x'], 'x', 'o')

      expect { controller.end_of_game }
        .to output("""
     x | x | o
    -----------
     o | x | x
    -----------
     o | o | x\nx is the winner!\n""").to_stdout
    end

    it 'displays the board and declares a tie' do
      controller = controller_setup(['x', 'o', 'x', 'o', 'o', 'x', 'x', 'x', 'o'], 'x', 'o')

      expect { controller.end_of_game }
        .to output("""
     x | o | x
    -----------
     o | o | x
    -----------
     x | x | o\nThe game is a tie!\n""").to_stdout
    end
  end
end
