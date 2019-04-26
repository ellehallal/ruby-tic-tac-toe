require_relative './test_doubles/display_colour_double'
require 'display'
require 'board'

def display_setup
  display_colour = DisplayColourDouble.new
  Display.new(display_colour)
end

RSpec.describe Display do
  context 'Displaying game options:' do
    display = display_setup
    $stdout = StringIO.new

    it "displays 'Please enter the game name to load:" do
      display.game_name_prompt
      output = $stdout.string

      expect(output).to include('Please enter the game name to load:')
    end

    it "displays 'You have entered an invalid game name. Please try again:" do
      display.invalid_game_message
      output = $stdout.string

      expect(output).to include('You have entered an invalid game name. Please try again:')
    end
  end

  context 'Asking the user for a move:' do
    display = display_setup
    $stdout = StringIO.new

    it 'displays "Choose a position from 1-9"' do
      allow($stdin).to receive(:gets).and_return('1')

      display.ask_for_move
      output = $stdout.string

      expect(output).to include('Choose a position from 1-9:')
    end
  end

  context 'Displaying a grid:' do
    display = display_setup
    $stdout = StringIO.new

    it 'accepts a grid as an argument and displays it' do
      display.display_board([1, 2, 3, 4, 5, 6, 7, 8, 9])
      output = $stdout.string

      expect(output).to include('1 | 2 | 3')
      expect(output).to include('4 | 5 | 6')
      expect(output).to include('7 | 8 | 9')
    end
  end

  context 'Asking the user for a move:' do
    display = display_setup
    $stdout = StringIO.new

    it 'displays "Choose a position from 1-9"' do
      allow($stdin).to receive(:gets).and_return('1')

      display.ask_for_move
      output = $stdout.string

      expect(output).to include('Choose a position from 1-9:')
    end
  end

  context 'Displaying the current player:' do
    display = display_setup
    $stdout = StringIO.new

    it 'displays "The current player is x"' do
      display.show_current_player('x', 'Computer')
      output = $stdout.string

      expect(output).to include('x (Computer), play a move:')
    end
  end

  context 'Displays a message when a user enters an incorrect move:' do
    display = display_setup
    $stdout = StringIO.new

    it 'Displays "You have entered an invalid move. Please try again:"' do
      display.invalid_move_message
      output = $stdout.string

      expect(output)
        .to include('You have entered an invalid move. Please try again:')
    end
  end

  context 'Displays message, depending on game outcome' do
    display = display_setup
    $stdout = StringIO.new

    it "displays 'x is the winner!' when the outcome is x" do
      outcome = 'x'

      display.show_game_outcome(outcome)
      output = $stdout.string

      expect(output).to include('x is the winner!')
    end

    it "displays 'The game is a tie!\n' when the outcome is a tie" do
      outcome = 'tie'

      display.show_game_outcome(outcome)
      output = $stdout.string

      expect(output).to include('The game is a tie!')
    end
  end

  context 'Displays messages after game has ended ' do
    display = display_setup
    $stdout = StringIO.new

    it 'displays "Play again? (Y/N):"' do
      allow($stdin).to receive(:gets).and_return('Y')

      display.ask_play_again
      output = $stdout.string

      expect(output).to include('Play again? (Y/N):')
    end

    it 'displays "Thanks for playing Tic Tac Toe!"' do
      display.show_exit_message
      output = $stdout.string

      expect(output).to include('Thanks for playing Tic Tac Toe!')
    end
  end

  context 'Game options ' do
    display = display_setup
    $stdout = StringIO.new

    it 'displays the available game options a user can select' do
      display.show_welcome_message
      output = $stdout.string

      expect(output)
        .to include("Let's play Tic Tac Toe!")
    end

    it 'displays "Invalid game option selected. Please try again:"' do
      display.show_invalid_option_message
      output = $stdout.string

      expect(output)
        .to include('Invalid option selected. Please try again:')
    end
  end

  context 'Player types ' do
    display = display_setup
    $stdout = StringIO.new

    it "displays 'Please select player 1 (h = human, c = computer):'" do
      display.ask_for_player_selection(1)
      output = $stdout.string

      expect(output)
        .to include('Please select player 1 (h = human, c = computer):')
    end

    it "displays 'Please select player 2 (h = human, c = computer):'" do
      display.ask_for_player_selection(2)
      output = $stdout.string

      expect(output)
        .to include('Please select player 2 (h = human, c = computer):')
    end
  end

  context 'Computer move ' do
    display = display_setup
    $stdout = StringIO.new

    it "displays 'Computer (x) is thinking. Please wait...'" do
      display.show_computer_thinking('x')
      output = $stdout.string

      expect(output)
        .to include('Computer (x) is thinking. Please wait...')
    end

    it 'displays "Computer (o) has selected position 3"' do
      display.show_computer_move(3, 'o')
      output = $stdout.string

      expect(output)
        .to include('Computer (o) has selected position 3')
    end
  end
end
