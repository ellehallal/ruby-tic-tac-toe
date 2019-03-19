require 'display'

RSpec.describe Display do
  before :each do
    @display = Display.new
  end

  it 'display_grid accepts a grid as an argument and displays it' do
    expect do
      @display.display_grid([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end.to output("\n     1 | 2 | 3\n    -----------\n     4 | 5 | 6\n    -----------\n     7 | 8 | 9\n\n    ").to_stdout
  end

  it 'displays "Choose a position from 1-8"' do
    expect do
      @display.display_make_move
    end.to output("Choose a position from 1-8: ").to_stdout
  end
end
