require 'game_factory'
require 'player_factory'
require 'player_validator'
require 'display'
require 'display_colour'

def game_factory_setup
  display_colour = DisplayColour.new
  display = Display.new(display_colour)
  player_validator = PlayerValidator.new(display)
  player_factory = PlayerFactory.new(player_validator, display)
  GameFactory.new(player_factory)
end

RSpec.describe GameFactory do
  describe 'Creating players:' do
    it 'creates a human vs human game' do
      allow($stdin).to receive(:gets).and_return('H', 'H', '1')
      squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      game_factory = game_factory_setup

      game = game_factory.create_game(squares)

      expect(game.current_player).to be_an_instance_of(HumanPlayer)
      game.play_move
      expect(game.current_player).to be_an_instance_of(HumanPlayer)
    end

    it 'creates a computer vs computer game' do
      allow($stdin).to receive(:gets).and_return('C', 'C')
      squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      game_factory = game_factory_setup

      game = game_factory.create_game(squares)

      expect(game.current_player).to be_an_instance_of(ComputerPlayer)
      game.play_move
      expect(game.current_player).to be_an_instance_of(ComputerPlayer)
    end

    it 'creates a computer vs human game' do
      allow($stdin).to receive(:gets).and_return('C', 'H')
      squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      game_factory = game_factory_setup

      game = game_factory.create_game(squares)

      expect(game.current_player).to be_an_instance_of(ComputerPlayer)
      game.play_move
      expect(game.current_player).to be_an_instance_of(HumanPlayer)
    end
  end
end
