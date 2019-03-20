class Board
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def player_make_move(player_mark, position)
    @board[position - 1] = player_mark
  end
end
