RSpec.describe GameSaver do
  describe 'Saving an object' do
    it 'saves a hash, with the key "TicTacToe" and value "text"' do
      game_saver = GameSaver.new
      filename = './spec/test_data/test.yml'
      game_name = 'TicTacToe'
      obj = 'text'

      game_saver.save(filename, game_name, obj)
      open_file = YAML.load_file(filename)

      expect(open_file['TicTacToe']).to eq('text')

      clear_file(filename)
    end

    it 'saves a class instance to file' do
      game_saver = GameSaver.new
      filename = './spec/test_data/test.yml'
      game_name = 'Fake Game'
      game = FakeGame.new(1, 2, 3)

      game_saver.save(filename, game_name, game)
      file = YAML.load_file(filename)
      fake_game = file['Fake Game']

      expect(fake_game).to be_an_instance_of(FakeGame)

      clear_file(filename)
    end
  end
end
