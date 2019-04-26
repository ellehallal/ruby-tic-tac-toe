require_relative './test_doubles/display_colour_double'
require_relative './test_doubles/fake_class_double'
require 'game_factory'
require 'game_validator'
require 'game_loader'
require 'player_factory'
require 'player_validator'
require 'display'
require 'yaml'

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

def existing_game_setup
  filename = './spec/test_data/game_factory_test.yml'
  game_obj = FakeClassDouble.new(1, 2, 3)
  game_details = { 'Great game' => game_obj }
  File.open(filename, 'w') { |file| file.write game_details.to_yaml }
end

RSpec.describe GameFactory do
  describe 'Creating a new game:' do

    game_factory = game_factory_setup
    $stdout = StringIO.new

    it 'creates a human vs human game' do
      allow($stdin).to receive(:gets).and_return('new','H', 'H', '1')

      game = game_factory.create_game
      allow(game.current_player).to receive(:sleep)

      expect(game.current_player).to be_an_instance_of(HumanPlayer)
      game.play_move
      expect(game.current_player).to be_an_instance_of(HumanPlayer)
    end

    it 'creates a computer vs computer game' do
      allow($stdin).to receive(:gets).and_return('new','C', 'C')

      game = game_factory.create_game
      allow(game.current_player).to receive(:sleep)

      expect(game.current_player).to be_an_instance_of(ComputerPlayer)
      game.play_move
      expect(game.current_player).to be_an_instance_of(ComputerPlayer)
    end

    it 'creates a computer vs human game' do
      allow($stdin).to receive(:gets).and_return('new','C', 'H')

      game = game_factory.create_game
      allow(game.current_player).to receive(:sleep)

      expect(game.current_player).to be_an_instance_of(ComputerPlayer)
      game.play_move
      expect(game.current_player).to be_an_instance_of(HumanPlayer)
    end
  end

  describe 'Retrieving an existing game from a file:' do
    it 'returns an existing instance of a class from the specified file' do
      game_factory = game_factory_setup
      existing_game_setup
      allow($stdin).to receive(:gets).and_return('existing', 'Great game')

      game = game_factory.create_game

      expect(game).to be_an_instance_of(FakeClassDouble)
    end
  end
end
