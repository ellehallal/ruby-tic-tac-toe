require 'human_player'
require 'computer_player'
require 'game_factory'

RSpec.describe GameFactory do
  describe 'Create players:' do
    it 'creates two human players' do
      new_players = GameFactory.create_players('h', 'h')

      expect(new_players[:player1]).to be_an_instance_of(HumanPlayer)
      expect(new_players[:player2]).to be_an_instance_of(HumanPlayer)
    end

    it 'creates two computer players' do
      new_players = GameFactory.create_players('c', 'c')

      expect(new_players[:player1]).to be_an_instance_of(ComputerPlayer)
      expect(new_players[:player2]).to be_an_instance_of(ComputerPlayer)
    end

    it 'creates one human and one computer player' do
      new_players = GameFactory.create_players('h', 'c')

      expect(new_players[:player1]).to be_an_instance_of(HumanPlayer)
      expect(new_players[:player2]).to be_an_instance_of(ComputerPlayer)
    end
  end

  describe 'Create Game:' do
    it 'creates a new Game' do
      squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      new_game = GameFactory.build(squares, 'h', 'h')

      expect(new_game).to be_an_instance_of(Game)
    end
  end
end
