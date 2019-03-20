class Game
  def prompt_make_move
    move = $stdin.gets.chomp
    move.to_i
  end
end
