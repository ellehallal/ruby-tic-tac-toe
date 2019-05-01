require_relative 'player.rb'

class HumanPlayer < Player
  def choose_move(board, *_args)
    @display.display_board(board.squares)
    @display.show_current_player(mark, name)
    @display.ask_for_move

    move = $stdin.gets.chomp

    save_or_exit?(move) ? move : handle_move(board, move)
  end

  private

  def save_or_exit?(move)
    %w[exit save].include?(move)
  end

  def handle_move(board, move)
    move = move.to_i
    until board.move_valid?(move)
      @display.invalid_move_message
      @display.ask_for_move
      move = $stdin.gets.chomp.to_i
    end
    move
  end
end
