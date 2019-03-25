require 'display'

RSpec.describe Display do
  context 'Displaying a grid:' do
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
     7 | 8 | 9\n""")
    .to_stdout
    end
  end

  context 'Asking the user for a move:' do
    display = Display.new

    it 'displays "Choose a position from 1-9"' do
      allow($stdin).to receive(:gets).and_return('1')
      expect do
        display.ask_for_move
      end.to output('Choose a position from 1-9: ').to_stdout
    end

    it 'returns the users move as an integer' do
      allow($stdin).to receive(:gets).and_return('1')
      move = display.ask_for_move
      expect(move).to eq(1)
    end
  end

  context 'Displaying the current player:' do
    display = Display.new

    it 'displays "The current player is x"' do
      expect do
        display.show_current_player('x')
      end.to output("The current player is x\n").to_stdout
    end
  end

  context 'Displays message when user enters incorrect move' do
    display = Display.new

    it 'displays "22 is an invalid move."' do
      expect do
        display.invalid_move_message('22')
      end.to output("22 is an invalid move.\n").to_stdout
    end
  end
end
