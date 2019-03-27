require 'game'
require 'player'
require 'board'

RSpec.describe Game do

  context 'Playing a move when x is the current player:' do
    player1 = Player.new('x')
    player2 = Player.new('o')
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    game = Game.new(board, player1, player2)

    it 'plays move of x and updates the current player to o' do
      game.play_move('1')

      expect(game.current_player.mark).to eq('o')
    end

    it 'plays move of o and updates the current player to x' do
      game.play_move('2')

      expect(game.current_player.mark).to eq('x')
    end
  end

  context 'Checks if a user can continue playing:' do
    player1 = Player.new('x')
    player2 = Player.new('o')

    it 'returns false when less than 9 moves have been played' do
      board = Board.new([1, 'x', 'x', 'o', 5, 6, 'o', 8, 9])
      game = Game.new(board, player1, player2)

      expect(game.over?).to be false
    end

    it 'returns true when 9 moves have been played' do
      board = Board.new(['o', 'x', 'x', 'o', 'x', 'o', 'x', 'o', 'x'])
      game = Game.new(board, player1, player2)

      expect(game.over?).to be true
    end

    it 'returns false when both players do not have a winning combination' do
      board = Board.new([1, 'x', 'x', 'o', 5, 6, 'o', 8, 9])
      game = Game.new(board, player1, player2)

      expect(game.over?).to be false
    end

    it 'returns true when one player has a winning combination' do
      board = Board.new(['x', 'x', 'x', 'o', 5, 6, 'o', 8, 9])
      game = Game.new(board, player1, player2)

      expect(game.over?).to be true
    end
  end

  context "Manages game outcome:" do
    player1 = Player.new('x')
    player2 = Player.new('o')

    it 'returns "tie" when there are no winning players' do
      board = Board.new(['x', 'x', 3, 'o', 'o', 6, 7, 8, 9])
      game = Game.new(board, player1, player2)

      expect(game.tie_or_won).to eq('tie')
    end

    it "returns winning player's mark (x) when there is a winning player" do
      board = Board.new(['x', 'x', 'x', 'o', 'o', 6, 7, 8, 9])
      game = Game.new(board, player1, player2)

      expect(game.tie_or_won).to eq('x')
    end
  end
end
