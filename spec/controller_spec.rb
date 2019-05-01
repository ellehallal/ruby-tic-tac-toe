RSpec.describe Controller do
  describe 'Playing a game: ' do
    it 'plays a game that ends with a tie' do
      controller = controller_setup
      allow(controller).to receive(:sleep)
      allow($stdin).to receive(:gets)
        .and_return('new', 'h', 'h', '1', '2', '3', '4', '6', '5', '7', '9', '8')
      $stdout = StringIO.new

      controller.main_game
      output = $stdout.string

      expect(output).to include('The game is a tie!')
    end

    it 'plays a game that ends with a winning player' do
      controller = controller_setup
      allow(controller).to receive(:sleep)
      allow($stdin).to receive(:gets)
        .and_return('new', 'h', 'h', '1', '6', '2', '9', '3')
      $stdout = StringIO.new

      controller.main_game
      output = $stdout.string

      expect(output).to include('x is the winner!')
    end
  end

  describe 'Saving and exiting a game' do
    filename = './spec/test_data/controller_test.yml'

    it "displays the exit message, when user input is 'save'" do
      clear_file(filename)
      controller = controller_setup
      allow(controller).to receive(:sleep)
      allow($stdin).to receive(:gets)
        .and_return('new', 'h', 'h', 'save', 'favourite game', 'exit')
      $stdout = StringIO.new

      controller.main_game
      output = $stdout.string

      expect(output).to include('Thanks for playing Tic Tac Toe!')
    end

    it "displays the exit message, when user input is 'exit'" do
      clear_file(filename)
      controller = controller_setup
      allow(controller).to receive(:sleep)
      allow($stdin).to receive(:gets)
        .and_return('new', 'h', 'h', 'exit')
      $stdout = StringIO.new

      controller.main_game
      output = $stdout.string

      expect(output).to include('Thanks for playing Tic Tac Toe!')
    end
  end
end
