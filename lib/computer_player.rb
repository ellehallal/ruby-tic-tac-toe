require_relative 'player.rb'
require_relative 'minimax.rb'

class ComputerPlayer < Player
  def choose_move(board, player1, player2)
    @display.display_board(board.squares)
    @display.show_current_player(mark, name)
    @display.show_computer_thinking(mark)

    sleep(1.5)
    move = Minimax.new.find_best_move(board, mark, player1, player2)
    @display.show_computer_move(move, mark)

    sleep(1.5)
    move
  end
end
