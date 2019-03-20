require 'board'

RSpec.describe Board do
  describe 'creating a board' do

    it 'can accept a position and change the value to the specified mark' do
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      board.player_make_move('x', 4)
      expect(board.board).to eq([1, 2, 3, 'x', 5, 6, 7, 8, 9])
    end
  end
end
