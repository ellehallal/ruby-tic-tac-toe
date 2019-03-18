require 'board'

RSpec.describe Board do

  it 'can take an array as an argument when initialised' do
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    expect(board.grid).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

end