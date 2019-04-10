require 'controller'
require 'board'
require 'display'
require 'game'
require 'player'
require 'game_manager'

def manager_setup(squares, mark1, mark2)
  board = Board.new(squares)
  display = Display.new
  player1 = Player.new(mark1)
  player2 = Player.new(mark2)
  game = Game.new(board, player1, player2)
  controller = Controller.new(game, display)
  game_manager = GameManager.new(controller, display)
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

  describe 'Game selection: ' do
    game_manager = manager_setup([1, 2, 3, 4, 5, 6, 7, 8, 9], 'x', 'o')

    it 'prompts the user to select a game option and returns it if between 1 - 4' do
      allow($stdin).to receive(:gets).and_return('1')

      selection = game_manager.game_selection

      expect(selection).to eq(1)
    end

    it "only returns user's selection selection if between 1-4" do
      allow($stdin).to receive(:gets).and_return('a')
      allow($stdin).to receive(:gets).and_return('2')

      selection = game_manager.game_selection

      expect(selection).to eq(2)
    end
  end
end
