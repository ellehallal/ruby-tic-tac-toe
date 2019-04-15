require 'player_validator'
require 'player_factory'
require 'display'

RSpec.describe PlayerValidator do
  def player_selector_setup
    display = Display.new
    player_factory = PlayerFactory
    PlayerValidator.new(display, player_factory)
  end

  describe 'Player validation: ' do
    it 'returns a human player with mark x' do
      allow($stdin).to receive(:gets).and_return('H')
      player_validator = player_selector_setup

      player = player_validator.create_player(1, 'x')

      expect(player).to be_an_instance_of(HumanPlayer)
      expect(player.mark).to eq('x')
    end

    it 'returns a computer player with mark o' do
      allow($stdin).to receive(:gets).and_return('C')
      player_validator = player_selector_setup

      player = player_validator.create_player(2, 'o')

      expect(player).to be_an_instance_of(ComputerPlayer)
      expect(player.mark).to eq('o')
    end

    it 'prompts user for input again if input is not h or c' do
      allow($stdin).to receive(:gets).and_return('X', 'H')
      $stdout = StringIO.new
      player_validator = player_selector_setup

      player_validator.create_player(2, 'o')
      output = $stdout.string.split("\n")
      puts output

      expect(output[1])
        .to eq('Invalid option selected. Please try again:')
    end
  end
end
