require_relative './player.rb'

class ComputerPlayer < Player
  def choose_move(available_moves)
    available_moves.sample
  end
end

