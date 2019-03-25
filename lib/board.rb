class Board
  attr_reader :board, :moves_remaining

  def initialize(board)
    @board = board
    @moves_remaining = 9
  end

  def player_make_move(player_mark, position)
    @board[position - 1] = player_mark
    update_moves_remaining
  end

  def position_available?(position)
    @board[position - 1].is_a? Integer
  end

  private
   
  def update_moves_remaining
    update_moves = @board.count { |position| position.is_a? Integer }
    @moves_remaining = update_moves
  end
end
