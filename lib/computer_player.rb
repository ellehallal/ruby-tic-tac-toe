require_relative 'player.rb'

class ComputerPlayer < Player
  def choose_move(board)
    @display.display_board(board.squares)
    @display.show_current_player(@mark, @name)
    @display.show_computer_thinking(@mark)

    sleep(1.5)
    move = board.available_squares.sample
    @display.show_computer_move(move, @mark)

    sleep(1.5)
    move
  end
end
