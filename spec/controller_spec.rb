require_relative './test_doubles/display_colour_double'
require 'controller'
require 'player_factory'
require 'display'
require 'player_validator'
require 'game_factory'
require 'game_validator'
require 'game_loader'
require 'controller'

def controller_setup
  display_colour = DisplayColourDouble.new
  display = Display.new(display_colour)
  player_validator = PlayerValidator.new(display)
  player_factory = PlayerFactory.new(player_validator, display)
  game_validator = GameValidator.new(display)
  game_loader = GameLoader.new
  filename = './spec/test_data/game_factory_test.yml'
  game_factory = GameFactory.new(player_factory, game_validator, game_loader, filename)
  Controller.new(display, game_factory)
end

RSpec.describe Controller do
  describe 'Playing a game: ' do
    it 'plays a game that ends with a tie' do
      allow($stdin).to receive(:gets)
        .and_return('new', 'h', 'h', '1', '2', '3', '4', '6', '5', '7', '9', '8')
      $stdout = StringIO.new
      controller = controller_setup

      controller.main_game
      output = $stdout.string

      expect(output).to include('The game is a tie!')
    end

    it 'plays a game that ends with a winning player' do
      allow($stdin).to receive(:gets)
        .and_return('new', 'h', 'h', '1', '6', '2', '9', '3')
      $stdout = StringIO.new
      controller = controller_setup

      controller.main_game
      output = $stdout.string

      expect(output).to include('x is the winner!')
    end
  end
end
