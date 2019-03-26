require 'board'

RSpec.describe Board do
  describe 'creating a board' do
    
    it 'can accept a position and change the value to the specified mark' do
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])

      board.player_make_move('x', 4)

      expect(board.squares).to eq([1, 2, 3, 'x', 5, 6, 7, 8, 9])
    end
  end

  describe 'Making a move: ' do

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

  describe 'Checking for winning combinations on the board: ' do
    it 'returns true if a mark is in a winning combination position' do
      board = Board.new(['x', 'x', 'x', 4, 5, 6, 'o', 8, 'o'])

      expect(board.has_winning_combination?('x')).to eq(true)
    end

    it 'returns false if a mark is not in a winning combination position' do
      board = Board.new(['x', 'o', 'x', 4, 5, 6, 'o', 'x', 'o'])

      expect(board.has_winning_combination?('x')).to eq(false)
    end
  end
end
