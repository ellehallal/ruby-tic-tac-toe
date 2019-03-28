require 'controller'
require 'board'
require 'display'
require 'game'
require 'player'

def controller_setup(squares)
  board = Board.new(squares)
  display = Display.new(board)
  player1 = Player.new('x')
  player2 = Player.new('o')
  game = Game.new(board, player1, player2)
  controller = Controller.new(game, display)
  controller
end

RSpec.describe Controller do
  describe 'Making a move: ' do
    it 'allows the player to make a move' do
      allow($stdin).to receive(:gets).and_return('1')
      controller = controller_setup([1, 2, 3, 4, 5, 6, 7, 8, 9])
      

      expect { controller.play_move }
        .to output("""
     1 | 2 | 3
    -----------
     4 | 5 | 6
    -----------
     7 | 8 | 9\nThe current player is x\nChoose a position from 1-9: """).to_stdout
    end
  end

  describe 'Displays outcome of game:' do
    it 'displays the board and x is the winner' do
      controller = controller_setup(['x', 'x', 'o', 'o', 'x', 'x', 'o', 'o', 'x'])

      expect { controller.end_of_game }
        .to output("""
     x | x | o
    -----------
     o | x | x
    -----------
     o | o | x\nx is the winner!\n""").to_stdout
    end

    it 'displays the board and declares a tie' do
      controller = controller_setup(['x', 'o', 'x', 'o', 'o', 'x', 'x', 'x', 'o'])

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
