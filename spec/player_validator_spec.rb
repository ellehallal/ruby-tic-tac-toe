require 'player_validator'
require 'player_factory'
require 'display'
require 'display_colour'
require 'human_player'
require 'computer_player'

def player_selector_setup
  display_colour = DisplayColour.new
  display = Display.new(display_colour)
  PlayerValidator.new(display)
end

RSpec.describe PlayerValidator do
  describe 'Player validation: ' do
    it 'returns a human player with mark x' do
      allow($stdin).to receive(:gets).and_return('H')
      player_validator = player_selector_setup

      player_selection = player_validator.validate_player(1)

      expect(player_selection).to eq('h')
    end

    it 'returns a computer player with mark o' do
      allow($stdin).to receive(:gets).and_return('C')
      player_validator = player_selector_setup

      player_selection = player_validator.validate_player(2)

      expect(player_selection).to eq('c')
    end

    it 'prompts user for input again if input is not h or c' do
      allow($stdin).to receive(:gets).and_return('X', 'H')
      $stdout = StringIO.new
      player_validator = player_selector_setup

      player_validator.validate_player(2)
      output = $stdout.string

      expect(output)
        .to include('Invalid option selected. Please try again:')
    end
  end
end
