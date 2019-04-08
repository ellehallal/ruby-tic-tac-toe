class Game
  attr_reader :board

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  private

  def toggle_current_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def winning_player
    if @board.winning_line?(@player1.mark)
      @player1.mark
    else
      @player2.mark
    end
  end

  public

  def play_move(move)
    @board.player_make_move(@current_player.mark, move.to_i)
    toggle_current_player
  end

  def over?
    @board.complete? || @board.winning_player_exists?(@player1.mark, @player2.mark)
  end

  def tie_or_won
    if @board.winning_player_exists?(@player1.mark, @player2.mark)
      winning_player
    else
      'tie'
    end
  end

  def reset_game
    @board.clear_squares
    @current_player = @player1
  end

  def current_player_mark
    @current_player.mark
  end
end
