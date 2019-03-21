class Controller

  def initialize(game)
    @game = game
  end

  def play_move
    @game.make_move
    @game.toggle_current_player
  end
end
