class Game
  attr_reader :board, :current_player, :opponent

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @opponent = @player2
  end

  def play_move
    player_move = @current_player.choose_move(board, @opponent.mark)
    board.player_make_move(@current_player.mark, player_move)
    toggle_current_player
  end

  def over?
    board.complete? || board.winning_player_exists?(@current_player.mark, @opponent.mark)
  end

  def tie_or_won
    if board.winning_player_exists?(@current_player.mark, @opponent.mark)
      winning_player
    else
      'tie'
    end
  end

  private

  def winning_player
    if board.winning_line?(@current_player.mark)
      @current_player.mark
    else
      @opponent.mark
    end
  end

  def toggle_current_player
    if @current_player == @player1
      @current_player = @player2
      @opponent = @player1
    else
      @current_player = @player1
      @opponent = @player2
    end
  end
end
