require 'game'
require 'player'

RSpec.describe Game do
  describe 'Game: ' do
    player1 = Player.new('x')
    player2 = Player.new('o')

    it 'prompts the user for their move and returns the move as an integer' do
      game = Game.new(player1, player2)
      allow($stdin).to receive(:gets).and_return('1')
      move = game.prompt_make_move
      expect(move).to eq(1)
    end

    it 'toggles the current player from player1(x) to player2(o)' do
      game = Game.new(player1, player2)
      game.toggle_player
      expect(game.current_player.mark).to eq('o')
    end

    it 'toggles the current player from player2(o) to player1(x)' do
      game = Game.new(player1, player2)
      game.toggle_player
      game.toggle_player
      expect(game.current_player.mark).to eq('x')
    end
  end
end
