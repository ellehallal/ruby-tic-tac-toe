class Game
  attr_reader :board, :current_player, :opponent, :save_game, :exit_game

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @opponent = @player2
    @save_game = false
    @exit_game = false
  end

  def play_move
    move = @current_player.choose_move(board, @opponent.mark)

    if save?(move)
      @save_game = true
    elsif exit?(move)
      @exit_game = true
    else
      board.mark_square(@current_player.mark, move)
      toggle_current_player
    end
  end

  def over?
    board.full? || board.winning_line_exists?(@current_player.mark, @opponent.mark)
  end

  def tie_or_won
    if board.winning_line_exists?(@current_player.mark, @opponent.mark)
      winning_player
    else
      'tie'
    end
  end

  def reset_save_game
    @save_game = false
  end

  def reset_exit_game
    @exit_game = false
  end

  private

  def exit?(move)
    move == 'exit'
  end

  def save?(move)
    move == 'save'
  end

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
