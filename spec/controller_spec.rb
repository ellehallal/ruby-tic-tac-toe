require 'controller'
require 'player_factory'
require 'display'
require 'display_colour'
require 'player_validator'
require 'game_factory'
require 'controller'

def controller_setup
  player_factory = PlayerFactory
  display_colour = DisplayColour.new
  display = Display.new(display_colour)
  player_validator = PlayerValidator.new(display, player_factory)
  game_factory = GameFactory.new(player_validator)
  Controller.new(display, game_factory)
end

RSpec.describe Controller do
  describe 'Playing the game: ' do
    it 'plays a game that ends with a tie' do
      allow($stdin).to receive(:gets)
        .and_return('h', 'h', '1', '2', '3', '4', '6', '5', '7', '9', '8')
      $stdout = StringIO.new
      controller = controller_setup

      controller.main_game
      output = $stdout.string

      expect(output).to include('The game is a tie!')
    end

    it 'plays a game that ends with a winning player' do
      allow($stdin).to receive(:gets)
        .and_return('h', 'h', '1', '6', '2', '9', '3')
      $stdout = StringIO.new
      controller = controller_setup

      controller.main_game
      output = $stdout.string

      expect(output).to include('x is the winner!')
    end
  end
end
