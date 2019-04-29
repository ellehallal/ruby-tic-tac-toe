require_relative './test_doubles/display_colour_double'
require 'game_validator'
require 'game_loader'
require 'display'
require 'yaml'

def file_setup
  filename = './spec/test_data/test.yml'
  game_obj = 'game_object'
  game_details = { 'best game' => game_obj }
  File.open(filename, 'w') { |file| file.write game_details.to_yaml }
  filename
end

def clear_file(filename)
  File.open(filename, 'w') { |file| file.truncate(0) }
end

def game_validator_setup
  display_colour = DisplayColourDouble.new
  display = Display.new(display_colour)
  game_loader = GameLoader.new
  GameValidator.new(display, game_loader)
end

RSpec.describe GameValidator do
  describe 'Validating if a game name exists' do
    it "returns the user's game selection if it exists" do
      allow($stdin).to receive(:gets).and_return('best game')
      game_validator = game_validator_setup
      filename = file_setup

      game_name = game_validator.existing_game_selection(filename)

      expect(game_name).to eq('best game')
      clear_file(filename)
    end

    it "displays 'invalid' if user input (game name) does not exist in specified file" do
      allow($stdin).to receive(:gets).and_return('worst game', 'best game')
      $stdout = StringIO.new
      game_validator = game_validator_setup
      filename = file_setup

      game_validator.existing_game_selection(filename)
      output = $stdout.string

      expect(output).to include('invalid')
      clear_file(filename)
    end
  end

  describe 'Saving a new game' do
    it "returns the user's game selection if it doesn't exist" do
      allow($stdin).to receive(:gets).and_return('even better game')
      game_validator = game_validator_setup
      filename = file_setup

      game_name = game_validator.new_game_name(filename)

      expect(game_name).to eq('even better game')
      clear_file(filename)
    end

    it "displays 'Please enter another name' if user input (game name) already exists" do
      allow($stdin).to receive(:gets).and_return('best game', 'best game ever')
      $stdout = StringIO.new
      game_validator = game_validator_setup
      filename = file_setup

      game_validator.new_game_name(filename)
      output = $stdout.string

      expect(output).to include('Please enter another name')
      clear_file(filename)
    end
  end
end
