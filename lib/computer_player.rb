require_relative './player.rb'

class ComputerPlayer < Player
  def choose_move(available_moves)
    print 'Computer is thinking...'
    sleep(3)
    available_moves.sample
  end
end
