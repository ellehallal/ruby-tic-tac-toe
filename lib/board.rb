class Board
  attr_reader :board, :moves_remaining

  def initialize(board)
    @board = board
    @moves_remaining = 9
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
    @board[position - 1] = player_mark
    update_moves_remaining
  end

  def position_available?(position)
    @board[position - 1].is_a? Integer
  end

  def has_winning_combination?(player_mark)
    @winning_combinations.any? do |combination|
      combination.all? { |position| @board[position] == player_mark }
    end
  end

  private
  def update_moves_remaining
    update_moves = @board.count { |position| position.is_a? Integer }
    @moves_remaining = update_moves
  end
end
