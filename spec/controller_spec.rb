require 'controller'
require 'board'
require 'display'
require 'game'
require 'player'

RSpec.describe Controller do
  board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
  display = Display.new(board)
  player1 = Player.new('x')
  player2 = Player.new('o')
  game = Game.new(board, player1, player2)
  controller = Controller.new(game, board, display)

  describe 'Play again: ' do
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
end
