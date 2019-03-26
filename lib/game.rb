class Game
  attr_reader :current_player

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

  def make_move
    @display.display_board(@board.board)
    @display.show_current_player(@current_player.mark)
    move = @display.ask_for_move
    until move_valid?(move)
      @display.invalid_move_message(move)
      move = @display.ask_for_move
    end
    @board.player_make_move(@current_player.mark, move.to_i)
  end

  def winning_player_exists?
    @board.has_winning_combination?(@player1.mark) || @board.has_winning_combination?(@player2.mark)
  end

  public

  def moves_remaining?
    @board.moves_remaining > 0
  end

  def play_move
    make_move
    toggle_current_player
  end

  def can_continue_playing?
    moves_remaining? && !winning_player_exists?
  end

  def move_valid?(move)
    move = move.to_i
    move.between?(1, 9) && @board.position_available?(move)
  end
end
