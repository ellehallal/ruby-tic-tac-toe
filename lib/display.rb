require_relative 'display_colour'

class Display
  def initialize(display_colour)
    @display_colour = display_colour
  end

  def show_welcome_message
    clear_screen
    output = "Let's play Tic Tac Toe!\n"
    print @display_colour.greet_colour(output)
  end

  def display_board(board)
    clear_screen

    output = ''"
     #{board[0]} | #{board[1]} | #{board[2]}
    -----------
     #{board[3]} | #{board[4]} | #{board[5]}
    -----------
     #{board[6]} | #{board[7]} | #{board[8]}\n\n"''

    print @display_colour.board_colour(output)
  end

  def ask_for_player_selection(player_number)
    output = "Please select player #{player_number} (h = human, c = computer):\n"
    print @display_colour.input_prompt_colour(output)
  end

  def ask_for_move
    output = "Choose a position from 1-9: \n"

    print @display_colour.input_prompt_colour(output)
  end

  def show_invalid_option_message
    output = "Invalid option selected. Please try again:\n"
    print @display_colour.warning_colour(output)
  end

  def show_current_player(mark, name)
    output = "#{mark} (#{name}), play a move:\n"

    print @display_colour.player_colour(mark, output)
  end

  def invalid_move_message
    output = "You have entered an invalid move. Please try again:\n"

    print @display_colour.warning_colour(output)
  end

  def show_computer_thinking(mark)
    print "\nComputer (#{mark}) is thinking. Please wait...\n"
  end

  def show_computer_move(move, mark)
    print "Computer (#{mark}) has selected position #{move}\n"
  end

  def show_game_outcome(outcome)
    if outcome == 'tie'
      show_tie_message
    else
      show_winner_message(outcome)
    end
  end

  def ask_play_again
    output = "Play again? (Y/N):\n"

    print @display_colour.input_prompt_colour(output)
  end

  def show_exit_message
    output = "Thanks for playing Tic Tac Toe!\n"
    print @display_colour.greet_colour(output)
  end

  private

  def show_winner_message(mark)
    output = "#{mark} is the winner!\n"
    print @display_colour.player_colour(mark, output)
  end

  def show_tie_message
    output = "The game is a tie!\n"
    print @display_colour.tie_outcome_colour(output)
  end

  private

  def clear_screen
    system('clear')
  end
end
