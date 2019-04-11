require 'player_selector'
require 'display'
require 'player_maker'
require 'human_player'
require 'computer_player'

RSpec.describe PlayerSelector do
  def player_selector_setup
    display = Display.new
    player_maker = PlayerMaker
    PlayerSelector.new(display, player_maker)
  end

  describe 'Player selection: ' do
    it 'returns a human player with mark x' do
      allow($stdin).to receive(:gets).and_return('H')
      player_selection = player_selector_setup

      player = player_selection.player1_type

      expect(player).to be_an_instance_of(HumanPlayer)
      expect(player.mark).to eq('x')
    end

    it 'returns a computer player with mark o' do
      allow($stdin).to receive(:gets).and_return('C')
      player_selection = player_selector_setup

      player = player_selection.player2_type

      expect(player).to be_an_instance_of(ComputerPlayer)
      expect(player.mark).to eq('o')
    end

    it 'prompts user for input again if input is not h or c' do
      allow($stdin).to receive(:gets).and_return('X', 'H')
      $stdout = StringIO.new
      player_selection = player_selector_setup

      player_selection.player1_type
      output = $stdout.string.split("\n")
      puts output

      expect(output[1])
        .to eq('Invalid option selected. Please try again:')
    end
  end
end
