class Board
  attr_reader :board, :attr_reader

  def initialize(board)
    @board = board
    @moves_remaining = 9
  end

  def player_make_move(player_mark, position)
    @board[position - 1] = player_mark
    @moves_remaining -= 1
  end
end
