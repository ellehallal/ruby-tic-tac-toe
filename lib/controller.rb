class Controller
  def initialize(game)
    @game = game
  end

  def play
    @game.play_move until @game.is_over?
    @game.tie_or_won
  end
end
