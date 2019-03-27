class Board
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

  attr_reader :squares

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

  def winning_player_exists?(player1_mark, player2_mark)
    winning_line?(player1_mark) || winning_line?(player2_mark)
  end

  def complete?
    available_squares = @squares.count { |square| square.is_a? Integer }
    available_squares.zero?
  end

  def clear_squares
    @squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
