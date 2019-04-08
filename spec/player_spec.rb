require 'player'

RSpec.describe Player do
  describe 'Create player:' do
    it 'creates a new player with a mark' do
      new_player = Player.new('mark')

      expect(new_player.mark).to eq('mark')
    end
  end

  describe 'Selecting a move' do
    it 'prompts the player for a move and returns it' do
      allow($stdin).to receive(:gets).and_return('1')
      new_player = Player.new('x')

      move = new_player.choose_move

      expect(move).to eq(1)
    end
  end
end
