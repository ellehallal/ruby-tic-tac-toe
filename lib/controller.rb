class Controller
  def initialize(board, display, game)
    @board = board
    @display = display
    @game = game
  end

  def make_move(player)
    @display.display_grid(@board.grid)
    @display.display_make_move
    move = @game.prompt_make_move
    @board.make_move(player, move)
    @display.display_grid(@board.grid)
  end
end
