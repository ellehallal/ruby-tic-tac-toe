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

  describe 'New or existing game' do
    it "returns 'existing' when the specified file is not empty" do
      allow($stdin).to receive(:gets).and_return('existing')
      game_validator = game_validator_setup
      filename = './spec/test_data/game_loader_test.yml'

      game_type = game_validator.validate_game_type_input(filename)

      expect(game_type).to eq('existing')
    end

    it "prompts user to enter choice again, when input is not 'new' or 'existing" do
      allow($stdin).to receive(:gets).and_return('old', 'new')
      $stdout = StringIO.new
      game_validator = game_validator_setup
      filename = './spec/test_data/game_loader_test.yml'

      game_type = game_validator.validate_game_type_input(filename)
      output = $stdout.string

      expect(output).to include("Invalid game type. Please enter 'new' or 'existing':")
    end

    it "returns 'new' when inputted by user" do
      allow($stdin).to receive(:gets).and_return('new')
      game_validator = game_validator_setup
      filename = './spec/test_data/game_loader_test.yml'

      game_type = game_validator.validate_game_type_input(filename)

      expect(game_type).to eq('new')
    end

    it "returns 'new' automatically when the specified file is empty" do
      game_validator = game_validator_setup
      filename = './spec/test_data/empty_storage_test.yml'

      game_type = game_validator.validate_game_type_input(filename)

      expect(game_type).to eq('new')
    end
  end
end
