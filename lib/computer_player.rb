require_relative './player.rb'

class ComputerPlayer < Player
  def choose_move(available_moves)
    puts "\nComputer is thinking..."
    sleep(3)
    computer_move = available_moves.sample
    puts "Computer has selected position #{computer_move}"
    computer_move
  end
end
