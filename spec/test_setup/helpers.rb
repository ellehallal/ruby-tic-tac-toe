require_relative '../test_doubles/display_colour_double'
require 'computer_player'
require 'display'
require 'board'
require 'player_factory'
require 'player_validator'
require 'game_factory'
require 'game_validator'
require 'game_loader'
require 'game_saver'

module Helpers
  def board_two_moves
    Board.new(['x', 2, 'o', 4, 5, 6, 7, 8, 9])
  end

  def computer_player_setup
    display_colour = DisplayColourDouble.new
    display = Display.new(display_colour)
    computer_player = ComputerPlayer.new('x', 'Computer', display)
    computer_player
  end

  def controller_setup
    display_colour = DisplayColourDouble.new
    display = Display.new(display_colour)
    player_validator = PlayerValidator.new(display)
    player_factory = PlayerFactory.new(player_validator, display)
    game_loader = GameLoader.new
    game_saver = GameSaver.new
    game_validator = GameValidator.new(display, game_loader)
    filename = './spec/test_data/controller_test.yml'
    game_factory = GameFactory.new(player_factory, game_validator, game_loader, filename)
    Controller.new(display, game_factory, game_saver, game_validator, filename)
  end
  
  def clear_file(filename)
    File.open(filename, 'w') { |file| file.truncate(0) }
  end

  def display_setup
    display_colour = DisplayColourDouble.new
    Display.new(display_colour)
  end

end