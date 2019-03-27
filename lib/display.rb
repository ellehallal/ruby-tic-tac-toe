class Display
  def display_board(board)
    print """
     #{board[0]} | #{board[1]} | #{board[2]}
    -----------
     #{board[3]} | #{board[4]} | #{board[5]}
    -----------
     #{board[6]} | #{board[7]} | #{board[8]}\n"""
  end

  def ask_for_move
    print 'Choose a position from 1-9: '
    $stdin.gets.chomp
  end

  def show_current_player(current_player_mark)
    print "The current player is #{current_player_mark}\n"
  end

  def show_invalid_move_message(move)
    print "#{move} is an invalid move.\n"
  end

  def show_winner_message(player_mark)
    print "#{player_mark} is the winner!\n"
  end

  def show_tie_message
    print "The game is a tie!\n"
  end
end
