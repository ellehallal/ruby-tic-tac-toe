class Board
  attr_reader :squares

  @@winning_lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8]
  ]

  def initialize(squares)
    @squares = squares
  end

  def player_make_move(player_mark, position)
    @squares[position - 1] = player_mark
  end

  def move_valid?(move)
    move = move.to_i
    move.between?(1, 9) && (@squares[move - 1].is_a? Integer)
  end

  def winning_line?(player_mark)
    @@winning_lines.any? do |combination|
      combination.all? { |position| @squares[position] == player_mark }
    end
  end

  def moves_remaining?
    available_squares = @squares.count { |square| square.is_a? Integer }
    available_squares > 0
  end

  def clear_squares
    @squares.each_index { |index| @squares[index] = index + 1 }
  end
end
