class Display

  def display_board(board)
    print """
     #{board[0]} | #{board[1]} | #{board[2]}
    -----------
     #{board[3]} | #{board[4]} | #{board[5]}
    -----------
     #{board[6]} | #{board[7]} | #{board[8]}\n"""
  end

  def ask_for_move(board)
    print 'Choose a position from 1-9: '
    move = $stdin.gets.chomp
    until board.move_valid?(move)
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

  def show_game_outcome(outcome)
    if outcome == 'tie'
      show_tie_message
    else
      show_winner_message(outcome)
    end
  end

  def ask_play_again
    print "Play again? (Y/N):\n"
    $stdin.gets.chomp.upcase
  end

  def show_exit_message
    print "Thanks for playing Tic Tac Toe!\n"
  end

  def show_game_options
    print """
    Let's play Tic Tac Toe!
    Please select a game type:
    1. Human vs Human
    2. Human vs Computer
    3. Computer vs Human
    4. Computer vs Computer\n"""
  end
end
