require 'controller'
require 'board'
require 'display'
require 'game'
require 'player'
require 'game_manager'

def manager_setup(squares, mark1, mark2)
  board = Board.new(squares)
  display = Display.new(board)
  player1 = Player.new(mark1)
  player2 = Player.new(mark2)
  game = Game.new(board, player1, player2)
  controller = Controller.new(game, display)
  game_manager = GameManager.new(game, controller, display)
  game_manager
end

RSpec.describe GameManager do
  describe 'Play again: ' do
    game_manager = manager_setup([1, 2, 3, 4, 5, 6, 7, 8, 9], 'x', 'o')

    it 'returns true if the user inputs "Y"' do
      allow($stdin).to receive(:gets).and_return('Y')

      play_again = game_manager.play_again?

      expect(play_again).to eq(true)
    end

    it 'returns true if the user does not input "Y"' do
      allow($stdin).to receive(:gets).and_return('12')

      play_again = game_manager.play_again?

      expect(play_again).to eq(false)
    end
  end
end