require 'controller'

RSpec.describe Controller do
  before :each do
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    display = Display.new
    game = Game.new
    @controller = Controller.new(board, display, game)
  end

  it 'prompts for moves and displays updated board' do
    allow($stdin).to receive(:gets).and_return('1')
    expect do
      @controller.make_move('x')
    end
    .to output(
    """
     1 | 2 | 3
    -----------
     4 | 5 | 6
    -----------
     7 | 8 | 9\nChoose a position from 1-9: 
     x | 2 | 3
    -----------
     4 | 5 | 6
    -----------
     7 | 8 | 9\n""")
    .to_stdout
  end
end
