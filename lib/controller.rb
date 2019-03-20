class Controller
  def initialize(board, display, game)
    @board = board
    @display = display
    @game = game
  end

  def make_move(player_mark)
    @display.display_board(@board.board)
    @display.ask_for_move
    move = @game.prompt_make_move
    @board.player_make_move(player_mark, move)
    @display.display_board(@board.board)
  end
end
