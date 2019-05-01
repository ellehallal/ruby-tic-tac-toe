RSpec.describe GameManager do
  describe 'Play again: ' do
    it 'displays the exit message when the user inputs n' do
      allow($stdin).to receive(:gets)
        .and_return('new', 'h', 'h', '1', '2', '3', '5', '4', '6', '7', '9', '8', 'n')
      game_manager = manager_setup

      $stdout = StringIO.new

      game_manager.play
      output = $stdout.string

      expect(output).to include('Thanks for playing Tic Tac Toe!')
    end
  end
end
