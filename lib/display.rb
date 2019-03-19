class Display
  def display_grid(grid)
    print """
     #{grid[0]} | #{grid[1]} | #{grid[2]}
    -----------
     #{grid[3]} | #{grid[4]} | #{grid[5]}
    -----------
     #{grid[6]} | #{grid[7]} | #{grid[8]}

    """
  end

  def display_make_move
    print 'Choose a position from 1-8: '
  end
end
