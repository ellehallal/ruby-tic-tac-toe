require_relative '../test_doubles/display_colour_double'
require_relative '../test_doubles/fake_class_double'
require 'yaml'
require 'display'
require 'board'
require 'computer_player'
require 'controller'
require 'player_factory'
require 'player_validator'
require 'game_manager'
require 'game_factory'
require 'game_validator'
require 'game_loader'
require 'game_saver'
require 'minimax'

module Helpers
  def board_two_moves
    Board.new(['x', 2, 'o', 4, 5, 6, 7, 8, 9])
  end

  def board_setup(squares = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    Board.new(squares)
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

  def game_factory_setup
    display_colour = DisplayColourDouble.new
    display = Display.new(display_colour)
    player_validator = PlayerValidator.new(display)
    player_factory = PlayerFactory.new(player_validator, display)
    game_loader = GameLoader.new
    game_validator = GameValidator.new(display, game_loader)
    filename = './spec/test_data/game_factory_test.yml'
    GameFactory.new(player_factory, game_validator, game_loader, filename)
  end
  
  def existing_game_setup
    filename = './spec/test_data/game_factory_test.yml'
    game_obj = FakeClassDouble.new(1, 2, 3)
    game_details = { 'great game' => game_obj }
    File.open(filename, 'w') { |file| file.write game_details.to_yaml }
  end

  def manager_setup
    display_colour = DisplayColourDouble.new
    display = Display.new(display_colour)
    player_validator = PlayerValidator.new(display)
    player_factory = PlayerFactory.new(player_validator, display)
    game_loader = GameLoader.new
    game_saver = GameSaver.new
    game_validator = GameValidator.new(display, game_loader)
    filename = './spec/test_data/game_factory_test.yml'
    game_factory = GameFactory.new(player_factory, game_validator, game_loader, filename)
    controller = Controller.new(display, game_factory, game_saver, game_validator, filename)
    GameManager.new(controller, display)
  end

  def game_setup(squares = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    display_colour = DisplayColourDouble.new
    display = Display.new(display_colour)
    board = Board.new(squares)
    player1 = HumanPlayer.new('x', 'Human', display)
    player2 = HumanPlayer.new('o', 'Human', display)
    game = Game.new(board, player1, player2)
    game
  end

  def file_setup
    filename = './spec/test_data/test.yml'
    game_obj = 'game_object'
    game_details = { 'best game' => game_obj }
    File.open(filename, 'w') { |file| file.write game_details.to_yaml }
    filename
  end
  
  def game_validator_setup
    display_colour = DisplayColourDouble.new
    display = Display.new(display_colour)
    game_loader = GameLoader.new
    GameValidator.new(display, game_loader)
  end

  def human_player_setup
    display_colour = DisplayColourDouble.new
    display = Display.new(display_colour)
    HumanPlayer.new('x', 'Human', display)
  end

  def player_factory_setup
    display = display_setup
    player_validator = PlayerValidator.new(display)
    PlayerFactory.new(player_validator, display)
  end

  def player_validator_setup
    display_colour = DisplayColourDouble.new
    display = Display.new(display_colour)
    PlayerValidator.new(display)
  end
end