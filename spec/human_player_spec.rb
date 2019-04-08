require 'human_player'

RSpec.describe HumanPlayer do
  describe 'Create human player' do
    it 'creates a new player with a mark' do
      human_player = HumanPlayer.new('x')
      expect(human_player.mark).to eq('x')
    end
  end

  describe 'Selecting a move' do
    it 'prompts the player for a move and returns it' do
      allow($stdin).to receive(:gets).and_return('1')
      human_player = HumanPlayer.new('x')

      move = human_player.choose_move

      expect(move).to eq(1)
    end
  end
end
