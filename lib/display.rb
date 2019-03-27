class Display
  def initialize(board)
    @board = board
  end

  def display_board
    print """
     #{@board.squares[0]} | #{@board.squares[1]} | #{@board.squares[2]}
    -----------
     #{@board.squares[3]} | #{@board.squares[4]} | #{@board.squares[5]}
    -----------
     #{@board.squares[6]} | #{@board.squares[7]} | #{@board.squares[8]}\n"""
  end

  def ask_for_move
    print 'Choose a position from 1-9: '
    move = $stdin.gets.chomp
    until @board.move_valid?(move)
      show_invalid_move_message(move)
      move = $stdin.gets.chomp
    end
    move
  end

  def show_current_player(current_player_mark)
    print "The current player is #{current_player_mark}\n"
  end

  def show_invalid_move_message(move)
    print "#{move} is an invalid move. Please try again:\n"
  end

  def show_winner_message(player_mark)
    print "#{player_mark} is the winner!\n"
  end

  def show_tie_message
    print "The game is a tie!\n"
  end

  def show_game_outcome(outcome, player_mark)
    if outcome == 'tie'
      show_tie_message
    else
      show_winner_message(player_mark)
    end
  end

  def ask_play_again
    print "Play again? (Y/N):\n"
    $stdin.gets.chomp.upcase
  end

  def show_exit_message
    print "Thanks for playing Tic Tac Toe!\n"
  end
end
