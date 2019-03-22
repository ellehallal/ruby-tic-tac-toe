require 'player'

RSpec.describe Player do
  describe 'create player' do
    it 'creates a new player with a mark' do
      new_player = Player.new('mark')
      expect(new_player.mark).to eq('mark')
    end
  end
end
