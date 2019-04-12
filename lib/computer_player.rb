require_relative 'player.rb'

class ComputerPlayer < Player
  def choose_move(board)
    @display.display_board(board.squares)
    @display.show_current_player(@mark, @name)
    @display.show_computer_thinking

    sleep(1.5)
    computer_move = board.available_squares.sample
    @display.show_computer_move(computer_move)
    computer_move
  end
end
