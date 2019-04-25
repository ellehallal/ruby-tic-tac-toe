require 'game_saver'
require_relative './test_doubles/fake_class_double'


def clear_file(filename)
  File.open(filename, 'w') { |file| file.truncate(0) }
end

RSpec.describe GameSaver do
  describe 'Saving an object' do
    it 'saves a hash, with the key "TicTacToe" and value "text"' do
      game_saver = GameSaver.new
      filename = './spec/test_data/test.yml'
      game_name = 'TicTacToe'
      content = 'text'

      game_saver.save(filename, game_name, content)
      open_file = YAML.load_file(filename)

      expect(open_file['TicTacToe']).to eq('text')

      clear_file(filename)
    end

    it 'saves a class instance to file' do
      game_saver = GameSaver.new
      filename = './spec/test_data/test.yml'
      game_name = 'Fake Class'
      content = FakeClassDouble.new(1, 2, 3)

      game_saver.save(filename, game_name, content)
      file = YAML.load_file(filename)
      fake_class = file['Fake Class']

      expect(fake_class).to be_an_instance_of(FakeClassDouble)

      clear_file(filename)
    end
  end
end
