require 'controller'
require 'board'
require 'display'
require 'game'
require 'player'

def game_setup(squares, mark1, mark2)
  board = Board.new(squares)
  display = Display.new(board)
  player1 = Player.new(mark1)
  player2 = Player.new(mark2)
  game = Game.new(board, player1, player2)
  controller = Controller.new(game, board, display)
  controller
end

RSpec.describe Controller do

  describe 'Play again: ' do
    controller = game_setup([1, 2, 3, 4, 5, 6, 7, 8, 9], 'x', 'o')

    it 'returns true if the user inputs "Y"' do
      allow($stdin).to receive(:gets).and_return('Y')
      
      play_again = controller.play_again?

      expect(play_again).to eq(true)
    end

    it 'returns true if the user does not input "Y"' do
      allow($stdin).to receive(:gets).and_return('12')

      play_again = controller.play_again?

      expect(play_again).to eq(false)
    end
  end

  describe 'Displays outcome of game ' do

    it 'displays the board and x is the winner' do
      controller = game_setup(['x', 'x', 'o', 'o', 'x', 'x', 'o', 'o', 'x'], 'x', 'o')

      expect { controller.end_of_game }
        .to output("""
     x | x | o
    -----------
     o | x | x
    -----------
     o | o | x\nx is the winner!\n""").to_stdout
    end

    it 'displays the board and declares a tie' do
      controller = game_setup(['x', 'o', 'x', 'o', 'o', 'x', 'x', 'x', 'o'], 'x', 'o')

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
