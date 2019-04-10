require 'computer_player'
require 'display'
require 'board'

def computer_player_setup
  display = Display.new
  computer_player = ComputerPlayer.new('x', display)
  computer_player
end

RSpec.describe ComputerPlayer do
  describe 'Selecting a move' do
    it 'returns an available move' do
      computer_player = computer_player_setup
      board = Board.new([1, 2, 3])
      allow(computer_player).to receive(:sleep)
      allow(computer_player).to receive(:puts)

      choose_move = computer_player.choose_move(board)

      expect(choose_move).to be_between(1, 3)
    end
  end
end
