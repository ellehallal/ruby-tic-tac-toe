class Board
  WINNING_LINES = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8]
  ].freeze

  attr_reader :squares

  def initialize(squares = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @squares = squares
  end

  def mark_square(mark, position)
    squares[position - 1] = mark
  end

  def move_valid?(move)
    move = move.to_i
    move.between?(1, 9) && (squares[move - 1].is_a? Integer)
  end

  def winning_line?(mark)
    WINNING_LINES.any? do |combination|
      combination.all? { |position| squares[position] == mark }
    end
  end

  def winning_line_exists?(mark1, mark2)
    winning_line?(mark1) || winning_line?(mark2)
  end

  def full?
    total_available_squares.zero?
  end

  def available_squares
    squares.select { |square| square.is_a? Integer }
  end

  def copy_board
    Board.new(squares.clone)
  end

  def finished?(mark1, mark2)
    full? || winning_line_exists?(mark1, mark2)
  end

  def empty?
    squares.size == total_available_squares
  end

  def corners
    [1, 3, 7, 9]
  end

  private

  def total_available_squares
    available_squares.size
  end
end
