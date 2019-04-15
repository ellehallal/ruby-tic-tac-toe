require 'human_player'
require 'computer_player'
require 'player_factory'
require 'display'
require 'display_colour'

def display_setup
  display_colour = DisplayColour.new
  Display.new(display_colour)
end

RSpec.describe PlayerFactory do
  describe 'Create players:' do
    it "creates a human player with a mark 'x' and the name 'human'" do
      display = display_setup
      new_player = PlayerFactory.create('h', 'x', display)

      expect(new_player).to be_an_instance_of(HumanPlayer)
      expect(new_player.mark).to eq('x')
      expect(new_player.name).to eq('Human')
    end

    it "creates a computer player a with mark 'o' and the name 'computer'" do
      display = display_setup
      new_player = PlayerFactory.create('c', 'o', display)

      expect(new_player).to be_an_instance_of(ComputerPlayer)
      expect(new_player.mark).to eq('o')
      expect(new_player.name).to eq('Computer')
    end
  end
end
