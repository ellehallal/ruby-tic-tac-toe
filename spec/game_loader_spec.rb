require 'yaml'
require 'game_loader'
require_relative './test_doubles/fake_class_double'

def clear_file(filename)
  File.open(filename, 'w') { |file| file.truncate(0) }
end

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
end
