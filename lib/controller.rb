require_relative './game_factory.rb'

class Controller
  attr_reader :game
  def initialize(display)
    @game = nil
    @display = display
    @default_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def create_game(player1, player2, squares = @default_squares)
    @game = GameFactory.build(squares, player1, player2)
  end

  def main_game(squares = @default_squares)
    @display.show_welcome_message
    players = player_selection
    create_game(players[0], players[1], squares)
    @game.reset_game
    play_game
  end

  def play_game
    play_move until @game.over?
    end_of_game
  end

  def player_selection
    players = []

    selection1 = prompt_player1_selection
    validated_selection1 = validate_player_selection(selection1, 'player1')

    selection2 = prompt_player2_selection
    validated_selection2 = validate_player_selection(selection2, 'player2')

    players.push(validated_selection1, validated_selection2)
  end

  private

  def prompt_player1_selection
    @display.ask_for_player1
    $stdin.gets.chomp.downcase
  end

  def prompt_player2_selection
    @display.ask_for_player2
    $stdin.gets.chomp.downcase
  end

  def validate_player_selection(selection, player)
    until %w[h c].include?(selection)
      @display.show_invalid_option_message

      if player == 'player1'
        selection = prompt_player1_selection
      elsif player == 'player2'
        selection = prompt_player2_selection
      end
    end
    selection
  end

  def play_move
    @display.display_board(@game.board.squares)
    @display.show_current_player(@game.player_info[:mark], @game.player_info[:name])
    @display.ask_for_move
    @game.play_move(@display.invalid_move_message)
    @game.toggle_current_player
  end

  def end_of_game
    outcome = @game.tie_or_won
    @display.display_board(@game.board.squares)
    @display.show_game_outcome(outcome)
  end
end
