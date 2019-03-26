require 'game'
require 'player'
require 'display'
require 'board'

RSpec.describe Game do
  context 'Prompting the user:' do
    display = Display.new
    player1 = Player.new('x')
    player2 = Player.new('o')

    it 'displays the board and prompts user for a move' do
      board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      game = Game.new(board, display, player1, player2)

      allow($stdin).to receive(:gets).and_return('1')
      expect { game.play_move }
        .to output("""
     1 | 2 | 3
    -----------
     4 | 5 | 6
    -----------
     7 | 8 | 9\nThe current player is x\nChoose a position from 1-9: """)
        .to_stdout
    end
  end

  context 'Playing a move when x is the current player:' do
    display = Display.new
    player1 = Player.new('x')
    player2 = Player.new('o')
    board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    game = Game.new(board, display, player1, player2)

    it 'plays move of x and updates the current player to o' do
      allow($stdin).to receive(:gets).and_return('1')
      game.play_move

      expect(game.current_player.mark).to eq('o')
    end

    it 'plays move of o and updates the current player to x' do
      allow($stdin).to receive(:gets).and_return('9')
      game.play_move

      expect(game.current_player.mark).to eq('x')
    end
  end

  context 'Checks if a user can continue playing:' do
    display = Display.new
    player1 = Player.new('x')
    player2 = Player.new('o')

    it 'returns true when less than 9 moves have been played' do
      allow($stdin).to receive(:gets).and_return('9')
      board = Board.new([1, 'x', 'x', 'o', 5, 6, 'o', 8, 9])
      game = Game.new(board, display, player1, player2)

      game.play_move

      expect(game.can_continue_playing?).to eq(true)
    end

    it 'returns false when 9 moves have been played' do
      allow($stdin).to receive(:gets).and_return('9')
      board = Board.new(['o', 'x', 'x', 'o', 'x', 'o', 'x', 'o', 9])
      game = Game.new(board, display, player1, player2)

      game.play_move

      expect(game.can_continue_playing?).to eq(false)
    end

    it 'returns true when both players do not have a winning combination' do
      allow($stdin).to receive(:gets).and_return('9')
      board = Board.new([1, 'x', 'x', 'o', 5, 6, 'o', 8, 9])
      game = Game.new(board, display, player1, player2)

      game.play_move

      expect(game.can_continue_playing?).to eq(true)
    end

    it 'returns false when one player has a winning combination' do
      allow($stdin).to receive(:gets).and_return('9')
      board = Board.new(['x', 'x', 'x', 'o', 5, 6, 'o', 8, 9])
      game = Game.new(board, display, player1, player2)

      game.play_move

      expect(game.can_continue_playing?).to eq(false)
    end
  end

  context "Validates a user's move:" do
    display = Display.new
    player1 = Player.new('x')
    player2 = Player.new('o')
    board = Board.new([1, 2, 3, 'x', 5, 6, 7, 8, 9])
    game = Game.new(board, display, player1, player2)

    it 'returns false if a user enters a move that is not a single integer' do
      expect(game.move_valid?(22)).to eq(false)
    end

    it 'returns false if a user enters a move not between 1-9' do
      expect(game.move_valid?(10)).to eq(false)
    end

    it 'returns false if a user enters a move that is already taken' do
      expect(game.move_valid?(4)).to eq(false)
    end

    it 'returns false a if user enters a move that is not an integer' do
      expect(game.move_valid?('k')).to eq(false)
    end

    it 'returns true if a user enters move that is a single integer and is not taken' do
      expect(game.move_valid?(2)).to eq(true)
    end
  end

  context "Manages the outcome of the game:" do
    display = Display.new
    player1 = Player.new('x')
    player2 = Player.new('o')

    it 'displays "The game is a tie!" when there are no winning players' do
      board = Board.new(['x', 'x', 3, 'o', 'o', 6, 7, 8, 9])
      game = Game.new(board, display, player1, player2)

      expect { game.tie_or_won }
        .to output("""
     x | x | 3
    -----------
     o | o | 6
    -----------
     7 | 8 | 9\nThe game is a tie!\n").to_stdout
    end

    it 'displays "x is the winner" when x has a winning combination' do
      board = Board.new(['x', 'x', 'x', 'o', 'o', 6, 7, 8, 9])
      game = Game.new(board, display, player1, player2)

      expect { game.tie_or_won }
        .to output("""
     x | x | x
    -----------
     o | o | 6
    -----------
     7 | 8 | 9\nx is the winner!\n").to_stdout
    end

    it 'displays "o is the winner" when o has a winning combination' do
      board = Board.new(['x', 2, 'x', 'o', 'o', 'o', 7, 'x', 9])
      game = Game.new(board, display, player1, player2)

      expect { game.tie_or_won }
      .to output("""
     x | 2 | x
    -----------
     o | o | o
    -----------
     7 | x | 9\no is the winner!\n").to_stdout
    end
  end
end
