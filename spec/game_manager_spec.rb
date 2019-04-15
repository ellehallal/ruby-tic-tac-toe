require 'controller'
require 'board'
require 'display'
require 'game'
require 'player'
require 'game_manager'
require 'player_maker'

def manager_setup
  player_maker = PlayerMaker
  display = Display.new
  player_selector = PlayerSelector.new(display, player_maker)
  game_factory = GameFactory.new(player_selector)
  controller = Controller.new(display, game_factory)
  GameManager.new(controller, display)
end

RSpec.describe GameManager do
  describe 'Play again: ' do
    it 'returns true if the user inputs "Y"' do
      game_manager = manager_setup
      allow($stdin).to receive(:gets).and_return('Y')

      play_again = game_manager.play_again?

      expect(play_again).to eq(true)
    end

    it 'returns false if the user does not input "Y"' do
      game_manager = manager_setup
      allow($stdin).to receive(:gets).and_return('12')

      play_again = game_manager.play_again?

      expect(play_again).to eq(false)
    end

    it 'displays the exit message when the user inputs N' do
      allow($stdin).to receive(:gets).and_return('h', 'h', 'n', '1', '2', '3', '5', '4', '6', '7', '9', '8')
      game_manager = manager_setup

      $stdout = StringIO.new

      game_manager.play
      output = $stdout.string.split("\n")

      expect(output.last).to eq('Thanks for playing Tic Tac Toe!')
    end
  end
end
