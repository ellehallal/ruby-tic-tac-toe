require_relative './test_doubles/display_colour_double'
require 'game_manager'
require 'player_factory'
require 'display'
require 'player_validator'
require 'game_factory'
require 'controller'

def manager_setup
  display_colour = DisplayColourDouble.new
  display = Display.new(display_colour)
  player_validator = PlayerValidator.new(display)
  player_factory = PlayerFactory.new(player_validator, display)
  game_factory = GameFactory.new(player_factory)
  controller = Controller.new(display, game_factory)
  GameManager.new(controller, display)
end

RSpec.describe GameManager do
  describe 'Play again: ' do
    it 'displays the exit message when the user inputs n' do
      allow($stdin).to receive(:gets)
        .and_return('h', 'h', '1', '2', '3', '5', '4', '6', '7', '9', '8', 'n')
      game_manager = manager_setup

      $stdout = StringIO.new

      game_manager.play
      output = $stdout.string

      expect(output).to include('Thanks for playing Tic Tac Toe!')
    end
  end
end
