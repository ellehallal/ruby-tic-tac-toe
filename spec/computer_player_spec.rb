require 'computer_player'
require 'display'
require 'display_colour'
require 'board'

def computer_player_setup
  display_colour = DisplayColour.new
  display = Display.new(display_colour)
  computer_player = ComputerPlayer.new('x', 'Computer', display)
  computer_player
end

RSpec.describe ComputerPlayer do
  describe 'Selecting a move' do
    it 'returns an available move' do
      computer_player = computer_player_setup
      allow(computer_player).to receive(:sleep)

      board = Board.new([1, 2, 3])

      choose_move = computer_player.choose_move(board)

      expect(choose_move).to be_between(1, 3)
    end
  end
end
