class Game
  attr_reader :current_player

  def initialize(board, display, player1, player2)
    @board = board
    @display = display
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

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
    @board.player_make_move(@current_player.mark, move)
    @display.display_board(@board.board)
  end

  def play_move
    make_move
    toggle_current_player
  end
end
