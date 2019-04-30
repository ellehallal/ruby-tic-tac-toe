require 'yaml'
require 'game_loader'
require_relative './test_doubles/fake_class_double'

RSpec.describe GameLoader do
  describe 'Loading an object' do
    it 'returns an object from the specified file' do
      game_loader = GameLoader.new
      filename = './spec/test_data/game_loader_test.yml'
      game_name = 'great game'

      saved_game = game_loader.load(filename, game_name)

      expect(saved_game).to be_an_instance_of(FakeClassDouble)
      expect(saved_game.var1).to eq(1)
      expect(saved_game.var2).to eq(2)
      expect(saved_game.var3).to eq(3)
    end
  end

  describe 'Getting game names' do
    it 'returns the existing game names' do
      game_loader = GameLoader.new
      filename = './spec/test_data/game_loader_test.yml'

      saved_games = game_loader.existing_game_names(filename)

      expect(saved_games).to eq(['great game', 'bad game'])
    end
  end

  describe 'Retrieving file contents' do
    it 'returns file contents as a hash' do
      game_loader = GameLoader.new
      filename = './spec/test_data/game_loader_test.yml'

      file = game_loader.retrieve_file_contents(filename)

      expect(file).to be_a_kind_of(Hash)
    end
  end
end
