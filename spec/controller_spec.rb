require 'controller'
require 'board'
require 'display'
require 'game'
require 'player'

RSpec.describe Controller do
  describe 'Controller: alternates current player after each move ' do
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    display = Display.new
    player1 = Player.new('x')
    player2 = Player.new('o')
    game = Game.new(board, display, player1, player2)
    controller = Controller.new(game)

    it 'player1 makes a move then current player toggles to player2' do
      allow($stdin).to receive(:gets).and_return('1')
      controller.play_move
      expect(game.current_player.mark).to eq('o')
    end

    it 'player2 makes a move then current player toggles to player1' do
      allow($stdin).to receive(:gets).and_return('9')
      controller.play_move
      expect(game.current_player.mark).to eq('x')
    end
  end
end
