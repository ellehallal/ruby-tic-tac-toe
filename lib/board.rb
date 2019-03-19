
class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def make_move(mark, position)
    @grid[position - 1] = mark
  end
end