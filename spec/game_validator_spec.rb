require 'game_validator'
require 'yaml'

def file_setup
  filename = './spec/test_data/test.yml'
  game_obj = 'game_object'
  game_details = { 'Best game' => game_obj }
  File.open(filename, 'w') { |file| file.write game_details.to_yaml }
  filename
end

def clear_file(filename)
  File.open(filename, 'w') { |file| file.truncate(0) }
end

RSpec.describe GameValidator do
  describe "Validating user's game selection" do
    it "returns the user's game selection if it exists" do
      allow($stdin).to receive(:gets).and_return('Best game')
      game_validator = GameValidator.new
      filename = file_setup

      game_name = game_validator.validate_selection(filename)

      expect(game_name).to eq('Best game')
    end
  end
end
