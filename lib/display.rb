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
  end
end
