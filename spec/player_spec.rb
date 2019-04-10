require 'player'

RSpec.describe Player do
  describe 'Create player:' do
    it 'creates a new player with a mark' do
      display = 'display'
      new_player = Player.new('mark', display)

      expect(new_player.mark).to eq('mark')
    end
  end
end
