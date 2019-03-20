require 'display'

RSpec.describe Display do
  describe 'displaying output' do
    display = Display.new

    it 'display_grid accepts a grid as an argument and displays it' do
      expect do
        display.display_board([1, 2, 3, 4, 5, 6, 7, 8, 9])
      end.to output(
    """
     1 | 2 | 3
    -----------
     4 | 5 | 6
    -----------
     7 | 8 | 9\n"""
    ).to_stdout
    end

    it 'displays "Choose a position from 1-9"' do
      expect do
        display.ask_for_move
      end.to output('Choose a position from 1-9: ').to_stdout
    end
  end
end
