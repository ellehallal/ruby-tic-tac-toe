require 'computer_player'

RSpec.describe ComputerPlayer do
  describe 'Create computer player' do
    it 'creates a new player with a mark' do
      computer_player = ComputerPlayer.new('x')

      expect(computer_player.mark).to eq('x')
    end
  end

  describe 'Selecting a move' do
    it 'returns an available move' do
      computer_player = ComputerPlayer.new('x')
      allow(computer_player).to receive(:sleep)
      allow(computer_player).to receive(:print)

      choose_move = computer_player.choose_move([1, 2, 3])

      expect(choose_move).to be_between(1, 3)
    end
  end
end
