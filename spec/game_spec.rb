require 'game'
require 'player'
require 'display'
require 'board'

RSpec.describe Game do
  describe 'Game: ' do
    display = Display.new
    player1 = Player.new('x')
    player2 = Player.new('o')

    it 'prompts the user for their move and returns the move as an integer' do
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      game = Game.new(board, display, player1, player2)

      allow($stdin).to receive(:gets).and_return('1')
      move = game.prompt_for_move
      expect(move).to eq(1)
    end

    it 'toggles the current player from player1(x) to player2(o)' do
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      game = Game.new(board, display, player1, player2)

      game.toggle_current_player
      expect(game.current_player.mark).to eq('o')
    end

    it 'toggles the current player from player2(o) to player1(x)' do
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      game = Game.new(board, display, player1, player2)

      game.toggle_current_player
      game.toggle_current_player
      expect(game.current_player.mark).to eq('x')
    end

    it 'prompts for moves and displays updated board' do
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      game = Game.new(board, display, player1, player2)

      allow($stdin).to receive(:gets).and_return('1')
      expect do
        game.make_move
      end
      .to output(
      """
     1 | 2 | 3
    -----------
     4 | 5 | 6
    -----------
     7 | 8 | 9\nThe current player is x\nChoose a position from 1-9: 
     x | 2 | 3
    -----------
     4 | 5 | 6
    -----------
     7 | 8 | 9\n""")
    .to_stdout
    end

  end
end
