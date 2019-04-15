require_relative 'player.rb'

class HumanPlayer < Player
  def choose_move(board)
    @display.display_board(board.squares)
    @display.show_current_player(@mark, @name)
    @display.ask_for_move

    move = $stdin.gets.chomp.to_i
    until board.move_valid?(move)
      @display.invalid_move_message
      @display.ask_for_move
      move = $stdin.gets.chomp.to_i
    end
    move
  end
end
