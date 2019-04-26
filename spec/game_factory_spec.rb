require_relative './test_doubles/display_colour_double'
require 'game_factory'
require 'game_validator'
require 'game_loader'
require 'player_factory'
require 'player_validator'
require 'display'

def game_factory_setup
  display_colour = DisplayColourDouble.new
  display = Display.new(display_colour)
  player_validator = PlayerValidator.new(display)
  player_factory = PlayerFactory.new(player_validator, display)
  game_validator = GameValidator.new(display)
  game_loader = GameLoader.new
  filename = './spec/test_data/game_factory_test.yml'
  GameFactory.new(player_factory, game_validator, game_loader, filename)
end

RSpec.describe GameFactory do
  describe 'Creating a new game:' do

    game_factory = game_factory_setup
    $stdout = StringIO.new

    it 'creates a human vs human game' do
      allow($stdin).to receive(:gets).and_return('H', 'H', '1')
      
      game = game_factory.new_game([1, 2, 3, 4, 5, 6, 7, 8, 9])
      allow(game.current_player).to receive(:sleep)

      expect(game.current_player).to be_an_instance_of(HumanPlayer)
      game.play_move
      expect(game.current_player).to be_an_instance_of(HumanPlayer)
    end

    it 'creates a computer vs computer game' do
      allow($stdin).to receive(:gets).and_return('C', 'C')

      game = game_factory.new_game([1, 2, 3, 4, 5, 6, 7, 8, 9])
      allow(game.current_player).to receive(:sleep)

      expect(game.current_player).to be_an_instance_of(ComputerPlayer)
      game.play_move
      expect(game.current_player).to be_an_instance_of(ComputerPlayer)
    end

    it 'creates a computer vs human game' do
      allow($stdin).to receive(:gets).and_return('C', 'H')

      game = game_factory.new_game([1, 2, 3, 4, 5, 6, 7, 8, 9])
      allow(game.current_player).to receive(:sleep)

      expect(game.current_player).to be_an_instance_of(ComputerPlayer)
      game.play_move
      expect(game.current_player).to be_an_instance_of(HumanPlayer)
    end
  end
end
