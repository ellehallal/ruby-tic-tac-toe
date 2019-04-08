require 'controller'
require 'board'
require 'display'
require 'game'
require 'human_player'

def controller_setup(squares)
  board = Board.new(squares)
  display = Display.new
  player1 = HumanPlayer.new('x')
  player2 = HumanPlayer.new('o')
  game = Game.new(board, player1, player2)
  controller = Controller.new(game, display)
  controller
end

RSpec.describe Controller do
  describe 'Playing the game: ' do

    it 'breaks the loop when the game is a tie' do
      controller = controller_setup(['x', 'o', 'x', 'o', 'o', 'x', 'x', 'x', 'o'])
      allow(controller).to receive(:end_of_game)
      allow(controller).to receive(:play_move)

      controller.main_game

      expect(controller).not_to receive(:play_move)
      expect(controller).to have_received(:end_of_game).once
    end

    it 'breaks the loop when there is a winning player' do
      controller = controller_setup(['x', 'x', 'x', 'o', 'o', 'x', 'x', 'o', 'o'])
      allow(controller).to receive(:end_of_game)
      allow(controller).to receive(:play_move)

      controller.main_game

      expect(controller).not_to receive(:play_move)
      expect(controller).to have_received(:end_of_game).once
    end
  end
end
