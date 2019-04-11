require 'human_player'
require 'computer_player'
require 'player_maker'
require 'display'

RSpec.describe PlayerMaker do
  describe 'Create players:' do
    it 'creates a human player with mark x' do
      display = Display.new
      new_player = PlayerMaker.create('h', 'x', display)

      expect(new_player).to be_an_instance_of(HumanPlayer)
      expect(new_player.mark).to eq('x')
    end

    it 'creates a computer player with mark o' do
      display = Display.new
      new_player = PlayerMaker.create('c', 'o', display)

      expect(new_player).to be_an_instance_of(ComputerPlayer)
      expect(new_player.mark).to eq('o')
    end
  end
end
