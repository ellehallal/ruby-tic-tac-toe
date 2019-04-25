require 'yaml'
require 'game_loader'
require_relative './test_doubles/fake_class_double'

def file_setup
  filename = './spec/test_data/test.yml'
  game_obj = FakeClassDouble.new('one', 'two', 'three')
  game_details = {'Great game' => game_obj}
  File.open(filename, 'w') { |file| file.write game_details.to_yaml }
end

def clear_file(filename)
  File.open(filename, 'w') { |file| file.truncate(0) }
end

RSpec.describe GameLoader do
  describe 'Loading an object' do
    it 'returns an object from the specified file' do
      file_setup
      game_loader = GameLoader.new
      filename = './spec/test_data/test.yml'
      game_name = 'Great game'

      saved_game = game_loader.load(filename, game_name)

      expect(saved_game).to be_an_instance_of(FakeClassDouble)
      expect(saved_game.var1).to eq('one')
      expect(saved_game.var2).to eq('two')
      expect(saved_game.var3).to eq('three')

      clear_file(filename)
    end
  end

  describe 'Already exists' do
    game_loader = GameLoader.new
    filename = './spec/test_data/test.yml'

    it 'returns true if key exists in file' do
      file_setup
      game_name = 'Great game'

      saved_game = game_loader.exists?(filename, game_name)

      expect(saved_game).to eq(true)

      clear_file(filename)
    end

    it 'returns false if key does not exist in file' do
      game_name = 'Bad game'

      saved_game = game_loader.exists?(filename, game_name)

      expect(saved_game).to eq(false)

      clear_file(filename)
    end
  end
end
