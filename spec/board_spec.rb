RSpec.describe Board do
  describe 'Making a move: ' do
    it 'can accept a position and change the value to the specified mark' do
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])

      board.mark_square('x', 4)

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

    it 'returns true if a user enters move that is valid' do
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

      expect(board.winning_line_exists?('x', 'o')).to be true
    end

    it 'returns false when a mark is not in a winning line position' do
      board = Board.new(['x', 'o', 'x', 4, 5, 6, 'o', 'x', 'o'])

      expect(board.winning_line_exists?('x', 'o')).to be false
    end
  end

  describe 'Checking for available squares: ' do
    it 'returns false if there are available squares on the board' do
      board = Board.new([1, 2, 3, 'x', 5, 6, 7, 8, 9])

      expect(board.full?).to be false
    end

    it 'returns true if there are no available squares on the board' do
      board = Board.new(%w[x x o x o o o x x])

      expect(board.full?).to be true
    end
  end

  describe 'Available squares: ' do
    it 'returns the available squares as an array' do
      board = board_two_moves

      available_squares = board.available_squares

      expect(available_squares).to eq([2, 4, 5, 6, 7, 8, 9])
    end
  end

  describe 'Copy board: ' do
    it 'creates a new instance of Board with the current squares' do
      board = board_two_moves

      new_board = board.copy_board

      expect(new_board).to be_an_instance_of(Board)
      expect(board).not_to eq(new_board)
      expect(new_board.squares).to eq(['x', 2, 'o', 4, 5, 6, 7, 8, 9])
    end
  end

  describe 'Winning line present, or empty squares: ' do
    it 'returns true when a winning line is present' do
      board = Board.new(['x', 'x', 'x', 4, 5, 6, 7, 8, 9])

      expect(board.finished?('x', 'o')).to eq(true)
    end

    it 'returns true when all squares have a mark' do
      board = Board.new(['x', 'o', 'o', 'o', 'x', 'x', 'x', 'x', 'o'])

      expect(board.finished?('x', 'o')).to eq(true)
    end

    it 'returns false when a winning line is not present, and there are empty squares' do
      board = Board.new(['x', 'o', 'o', 'o', 'x', 'x', 'x', 'x', 9])

      expect(board.finished?('x', 'o')).to eq(false)
    end
  end

  describe 'Empty board: ' do
    it 'returns true when zero squares have been taken' do
      board = Board.new

      expect(board.empty?).to eq(true)
    end

    it 'returns false when squares have been taken' do
      board = Board.new(['x', 'x', 3, 4])

      expect(board.empty?).to eq(false)
    end
  end

  
end
