class Game
  attr_reader :current_player, :display, :board

  def initialize(board, display, player1, player2)
    @board = board
    @display = display
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
    @display.display_board(@board.squares)
    if @board.winning_player_exists?(@player1.mark, @player2.mark)
      @display.show_winner_message(winning_player)
    else
      @display.show_tie_message
    end
  end
end
