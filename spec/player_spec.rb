require 'player'

RSpec.describe Player do
  describe 'Create player:' do
    it 'creates a new player with a mark' do
      display = 'display'
      new_player = Player.new('mark', 'human', display)

      expect(new_player.mark).to eq('mark')
      expect(new_player.name).to eq('human')
    end
  end
end
