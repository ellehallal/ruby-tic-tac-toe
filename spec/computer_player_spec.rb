require_relative './test_doubles/display_colour_double'
require 'computer_player'
require 'display'
require 'board'

def computer_player_setup
  display_colour = DisplayColourDouble.new
  display = Display.new(display_colour)
  computer_player = ComputerPlayer.new('x', 'Computer', display)
  computer_player
end

RSpec.describe ComputerPlayer do
  describe 'Selecting a move' do
    it 'returns an available move' do
      computer_player = computer_player_setup
      allow(computer_player).to receive(:sleep)

      board = Board.new(['x', 'o', 3, 4, 5, 6, 7, 8, 9])

      choose_move = computer_player.choose_move(board, 'x', 'o')

      expect(choose_move).to be_between(3, 9)
    end

    it 'returns either 1, 3, 7, 9 when the board is empty' do
      computer_player = computer_player_setup
      allow(computer_player).to receive(:sleep)

      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])

      choose_move = computer_player.choose_move(board, 'x', 'o')

      expect(choose_move).to eq(1).or(eq(3)).or(eq(7)).or(eq(9))
    end
  end
end
