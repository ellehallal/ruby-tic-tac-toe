require 'board'

RSpec.describe Board do
  describe 'Making a move: ' do

    it 'can accept a position and change the value to the specified mark' do
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])

      board.player_make_move('x', 4)

      expect(board.squares).to eq([1, 2, 3, 'x', 5, 6, 7, 8, 9])
    end
  end

  describe 'Validating a move: ' do
    board = Board.new([1, 2, 3, 'x', 5, 6, 7, 8, 9])

    it 'returns true if position is available' do
      expect(board.move_valid?(3)).to be true
    end

    it 'returns false if position is taken' do
      expect(board.move_valid?(4)).to be false
    end

    it 'returns false if a user enters a move that is not a single integer' do
      expect(board.move_valid?(22)).to be false
    end

    it 'returns false if a user enters a move not between 1-9' do
      expect(board.move_valid?(10)).to be false
    end

    it 'returns false a if user enters a move that is not an integer' do
      expect(board.move_valid?('k')).to be false
    end

    it 'returns true if a user enters move that is a single integer and is not taken' do
      expect(board.move_valid?(2)).to be true
    end
  end

  describe 'Checking for winning lines on the board: ' do
    it 'returns true if a mark is in a winning line position' do
      board = Board.new(['x', 'x', 'x', 4, 5, 6, 'o', 8, 'o'])

      expect(board.winning_line?('x')).to be true
    end

    it 'returns false if a mark is not in a winning line position' do
      board = Board.new(['x', 'o', 'x', 4, 5, 6, 'o', 'x', 'o'])

      expect(board.winning_line?('x')).to be false
    end

    it "returns true when either player's mark is in a winning line position" do
      board = Board.new(['x', 'x', 'x', 4, 5, 6, 'o', 8, 'o'])

      expect(board.winning_player_exists?('x', 'o')).to be true
    end

    it "returns false when either player's mark is not in a winning line position" do
      board = Board.new(['x', 'o', 'x', 4, 5, 6, 'o', 'x', 'o'])

      expect(board.winning_player_exists?('x', 'o')).to be false
    end
  end

  describe 'Checking for available spaces: ' do
    it 'returns false if there are available spaces on the board' do
      board = Board.new([1, 2, 3, 'x', 5, 6, 7, 8, 9])

      expect(board.complete?).to be false
    end

    it 'returns true if there are no available spaces on the board' do
      board = Board.new(['x', 'x', 'o', 'x', 'o', 'o', 'o', 'x', 'x'])

      expect(board.complete?).to be true
    end
  end

  describe 'Clear the squares: ' do
    it 'clears the squares' do
      board = Board.new(['x', 2, 'o', 4, 5, 6, 7, 8, 9])

      board.clear_squares

      expect(board.squares).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end
end
