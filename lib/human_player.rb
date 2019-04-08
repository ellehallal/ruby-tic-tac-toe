require_relative './player.rb'

class HumanPlayer < Player
  def choose_move
    $stdin.gets.chomp.to_i
  end
end
