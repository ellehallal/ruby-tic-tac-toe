class Board
  attr_reader :squares

  def initialize(squares)
    @squares = squares
    @winning_combinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [2, 4, 6],
      [0, 4, 8]
    ]
  end

  def player_make_move(player_mark, position)
    @squares[position - 1] = player_mark
  end

  def move_valid?(move)
    move = move.to_i
    (@squares[move - 1].is_a? Integer) && move.between?(1, 9)
  end

  def has_winning_combination?(player_mark)
    @winning_combinations.any? do |combination|
      combination.all? { |position| @squares[position] == player_mark }
    end
  end

  def moves_remaining?
    @squares.count { |square| square.is_a? Integer }
  end
end
