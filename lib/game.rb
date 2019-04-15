class Game
  attr_reader :board, :current_player

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  private

  def winning_player
    if @board.winning_line?(@player1.mark)
      @player1.mark
    else
      @player2.mark
    end
  end

  public

  def play_move
    player_move = @current_player.choose_move(@board)
    @board.player_make_move(@current_player.mark, player_move)
  end

  def toggle_current_player
    @current_player = if @current_player == @player1
                        @player2
                      else
                        @player1
                      end
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
end
