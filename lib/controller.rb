class Controller
  def initialize(game)
    @game = game
  end

  def play
    until @game.is_over? do @game.play_move end
    @game.tie_or_won
  end
end
