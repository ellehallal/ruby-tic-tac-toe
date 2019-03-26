require 'board'

RSpec.describe Board do
  describe 'creating a board' do
    it 'can accept a position and change the value to the specified mark' do
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      board.player_make_move('x', 4)
      expect(board.board).to eq([1, 2, 3, 'x', 5, 6, 7, 8, 9])
    end
  end

  describe 'tracking remaining moves' do
    it 'when a move is made, the number of moves remaining decrements by 1' do
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      board.player_make_move('x', 4)
      expect(board.moves_remaining).to eq(8)
    end

    it 'returns true if position is available' do
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      expect(board.position_available?(4)).to eq(true)
    end

    it 'returns false if position is taken' do
      board = Board.new([1, 2, 3, 'x', 5, 6, 7, 8, 9])
      board.player_make_move('o', 4)
      expect(board.position_available?(4)).to eq(false)
    end
  end
end
