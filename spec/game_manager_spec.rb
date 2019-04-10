require 'controller'
require 'board'
require 'display'
require 'game'
require 'player'
require 'game_manager'

def manager_setup(squares)
  display = Display.new
  controller = Controller.new(display)
  controller.create_game('h', 'h', squares)
  game_manager = GameManager.new(controller, display)
  game_manager
end

RSpec.describe GameManager do
  describe 'Play again: ' do
    it 'returns true if the user inputs "Y"' do
      game_manager = manager_setup([1, 2, 3, 4, 5, 6, 7, 8, 9])
      allow($stdin).to receive(:gets).and_return('Y')

      play_again = game_manager.play_again?

      expect(play_again).to eq(true)
    end

    it 'returns false if the user does not input "Y"' do
      game_manager = manager_setup([1, 2, 3, 4, 5, 6, 7, 8, 9])
      allow($stdin).to receive(:gets).and_return('12')

      play_again = game_manager.play_again?

      expect(play_again).to eq(false)
    end

    it 'displays the exit message when the user inputs N' do
      game_manager = manager_setup(%w[x o x x o o x x o])

      display = Display.new
      controller = Controller.new(display)
      game_manager = GameManager.new(controller, display)

      allow(game_manager).to receive(:gets).and_return('c', 'c', 'n')
      $stdout = StringIO.new

      game_manager.play
      output = $stdout.string.split("\n")

      expect(output.last).to eq('Thanks for playing Tic Tac Toe!')
    end
  end
end
