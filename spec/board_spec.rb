require 'board'

RSpec.describe Board do
  it 'can take an array as an argument when initialised' do
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    expect(board.grid).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it 'can accept a position and change the value to the specified mark' do
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    board.make_move('x', 4)
    expect(board.grid).to eq([1, 2, 3, 'x', 5, 6, 7, 8, 9])
  end
end
