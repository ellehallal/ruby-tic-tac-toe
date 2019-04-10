require_relative './player.rb'

class ComputerPlayer < Player
  attr_reader :name

  def initialize(mark)
    super(mark)
    @name = 'Computer'
  end

  def choose_move(available_moves)
    puts "\n\nComputer is thinking. Please wait...\n\n"
    sleep(1.5)
    computer_move = available_moves.sample
    puts "Computer has selected position #{computer_move}"
    computer_move
  end
end
