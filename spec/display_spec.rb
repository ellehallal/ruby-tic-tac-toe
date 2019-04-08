require 'display'
require 'board'

def display_setup
  display = Display.new
  display
end

RSpec.describe Display do
  context 'Displaying a grid:' do
    display = display_setup

    it 'accepts a grid as an argument and displays it' do
      expect { display.display_board([1, 2, 3, 4, 5, 6, 7, 8, 9]) }
        .to output("""
     1 | 2 | 3
    -----------
     4 | 5 | 6
    -----------
     7 | 8 | 9\n""").to_stdout
    end
  end

  context 'Asking the user for a move:' do
    display = display_setup
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])

    it 'displays "Choose a position from 1-9"' do
      allow($stdin).to receive(:gets).and_return('1')
      
      expect { display.ask_for_move(board) }
        .to output('Choose a position from 1-9: ').to_stdout
    end

    it "returns the user's move" do
      allow($stdin).to receive(:gets).and_return('1')

      move = display.ask_for_move(board)

      expect(move).to eq('1')
    end
  end

  context 'Displaying the current player:' do
    display = display_setup

    it 'displays "The current player is x"' do
      expect { display.show_current_player('x') }
        .to output("The current player is x\n").to_stdout
    end
  end

  context 'Displays a message when a user enters an incorrect move:' do
    display = display_setup

    it 'displays "22 is an invalid move."' do
      expect { display.show_invalid_move_message('22') }
        .to output("22 is an invalid move. Please try again:\n").to_stdout
    end
  end

  context 'Displays a message when the game is over: ' do
    display = display_setup

    it 'displays "x is the winner!"' do
      expect { display.show_winner_message('x') }
        .to output("x is the winner!\n").to_stdout
    end

    it 'displays "The game is a tie! "' do
      expect { display.show_tie_message }
        .to output("The game is a tie!\n").to_stdout
    end
  end

  context 'Displays message, depending on game outcome' do
    display = display_setup

    it "displays 'x is the winner!' when the outcome is x" do
      outcome = 'x'

      expect { display.show_game_outcome(outcome) }
        .to output("x is the winner!\n").to_stdout
    end

    it "displays 'The game is a tie!\n' when the outcome is a tie" do
      outcome = 'tie'

      expect { display.show_game_outcome(outcome) }
        .to output("The game is a tie!\n").to_stdout
    end
  end

  context 'Displays messages after game has ended ' do
    display = display_setup

    it 'displays "Play again? (Y/N):"' do
      allow($stdin).to receive(:gets).and_return('Y')

      expect { display.ask_play_again }
        .to output("Play again? (Y/N):\n").to_stdout
    end

    it "returns user's input as uppercase" do
      allow($stdin).to receive(:gets).and_return('y')

      expect(display.ask_play_again).to eq('Y')
    end

    it 'displays "Thanks for playing Tic Tac Toe!"' do
      expect { display.show_exit_message }
        .to output("Thanks for playing Tic Tac Toe!\n").to_stdout
    end
  end

  context 'Game options ' do
    display = display_setup

    it 'displays the available game options a user can select' do
      display = display_setup

      expect { display.show_game_options }
        .to output("""
    Let's play Tic Tac Toe!
    Please select a game type:
    1. Human vs Human
    2. Human vs Computer
    3. Computer vs Human
    4. Computer vs Computer\n""").to_stdout
    end

    it 'displays "Invalid game option selected. Please try again:"' do

      expect { display.show_invalid_option_message }
        .to output("Invalid game option selected. Please try again:\n").to_stdout
    end
  end
end
