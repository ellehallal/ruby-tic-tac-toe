require_relative './player.rb'

class HumanPlayer < Player
  def choose_move(moves = 0)
    $stdin.gets.chomp.to_i
  end
end
