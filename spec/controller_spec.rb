require_relative './test_doubles/display_colour_double'
require 'controller'
require 'player_factory'
require 'display'
require 'player_validator'
require 'game_factory'
require 'game_validator'
require 'game_loader'
require 'game_saver'
require 'controller'

def controller_setup
  display_colour = DisplayColourDouble.new
  display = Display.new(display_colour)
  player_validator = PlayerValidator.new(display)
  player_factory = PlayerFactory.new(player_validator, display)
  game_validator = GameValidator.new(display)
  game_loader = GameLoader.new
  game_saver = GameSaver.new
  filename = './spec/test_data/controller_test.yml'
  game_factory = GameFactory.new(player_factory, game_validator, game_loader, filename)
  Controller.new(display, game_factory, game_saver, game_validator, filename)
end

def clear_file(filename)
  File.open(filename, 'w') { |file| file.truncate(0) }
end

RSpec.describe Controller do
  describe 'Playing a game: ' do
    it 'plays a game that ends with a tie' do
      allow($stdin).to receive(:gets)
        .and_return('new', 'h', 'h', '1', '2', '3', '4', '6', '5', '7', '9', '8')
      $stdout = StringIO.new
      controller = controller_setup

      controller.main_game
      output = $stdout.string

      expect(output).to include('The game is a tie!')
    end

    it 'plays a game that ends with a winning player' do
      allow($stdin).to receive(:gets)
        .and_return('new', 'h', 'h', '1', '6', '2', '9', '3')
      $stdout = StringIO.new
      controller = controller_setup

      controller.main_game
      output = $stdout.string

      expect(output).to include('x is the winner!')
    end
  end

  describe 'Saving a game' do
    filename = './spec/test_data/controller_test.yml'
    clear_file(filename)

    it "displays the exit message, when user input is 'save'" do
      allow($stdin).to receive(:gets)
        .and_return('new', 'h', 'h', 'save', 'favourite game')
      $stdout = StringIO.new
      controller = controller_setup

      controller.main_game
      output = $stdout.string

      expect(output).to include('Thanks for playing Tic Tac Toe!')
    end
  end

  describe 'Exiting a game' do
    it "displays the exit message, when user input is 'exit'" do
      allow($stdin).to receive(:gets)
        .and_return('new', 'h', 'h', 'exit')
      $stdout = StringIO.new
      controller = controller_setup

      controller.main_game
      output = $stdout.string

      expect(output).to include('Thanks for playing Tic Tac Toe!')
    end
  end
end
