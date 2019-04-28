require_relative './test_doubles/display_colour_double'
require 'game'
require 'board'
require 'display'
require 'human_player'

def game_setup(squares = [1, 2, 3, 4, 5, 6, 7, 8, 9])
  display_colour = DisplayColourDouble.new
  display = Display.new(display_colour)
  board = Board.new(squares)
  player1 = HumanPlayer.new('x', 'Human', display)
  player2 = HumanPlayer.new('o', 'Human', display)
  game = Game.new(board, player1, player2)
  game
end

RSpec.describe Game do
  context 'Checks if a user can continue playing:' do
    it 'returns false when less than 9 moves have been played' do
      game = game_setup([1, 'x', 'x', 'o', 5, 6, 'o', 8, 9])

      expect(game.over?).to be false
    end

    it 'returns true when 9 moves have been played' do
      game = game_setup(%w[o x x o x o x o x])

      expect(game.over?).to be true
    end

    it 'returns false when both players do not have a winning combination' do
      game = game_setup([1, 'x', 'x', 'o', 5, 6, 'o', 8, 9])

      expect(game.over?).to be false
    end

    it 'returns true when one player has a winning combination' do
      game = game_setup(['x', 'x', 'x', 'o', 5, 6, 'o', 8, 9])

      expect(game.over?).to be true
    end
  end

  context "Manages the game's outcome:" do
    it 'returns "tie" when there are no winning players' do
      game = game_setup(['x', 'x', 3, 'o', 'o', 6, 7, 8, 9])

      expect(game.tie_or_won).to eq('tie')
    end

    it "returns winning player's mark (x) when there is a winning player" do
      game = game_setup(['x', 'x', 'x', 'o', 'o', 6, 7, 8, 9])

      expect(game.tie_or_won).to eq('x')
    end

    it "returns winning player's mark (o) when there is a winning player" do
      game = game_setup(['x', 'x', 3, 'o', 'o', 'o', 'x', 8, 9])

      expect(game.tie_or_won).to eq('o')
    end
  end

  context 'Toggles the current player' do
    game = game_setup([1, 2, 3, 4, 5, 6, 7, 8, 9])

    it 'updates current player from x to o' do
      allow($stdin).to receive(:gets).and_return('1')

      game.play_move

      expect(game.current_player.mark).to eq('o')
      expect(game.current_player.name).to eq('Human')
    end

    it 'updates current player from o to x' do
      allow($stdin).to receive(:gets).and_return('3')

      game.play_move

      expect(game.current_player.mark).to eq('x')
      expect(game.current_player.name).to eq('Human')
    end
  end

  context 'Updates value of @save_game' do
    it 'changes value of @save_game to true if input is "save"' do
      game = game_setup([1, 2, 3, 4, 5, 6, 7, 8, 9])
      allow($stdin).to receive(:gets).and_return('save')

      game.play_move

      expect(game.save_game).to eq(true)
    end

    it 'value of @save_game is false if input is not "save"' do
      game = game_setup([1, 2, 3, 4, 5, 6, 7, 8, 9])
      allow($stdin).to receive(:gets).and_return('1')

      game.play_move

      expect(game.save_game).to eq(false)
    end

    it 'changes value of @save_game to false' do
      game = game_setup([1, 2, 3, 4, 5, 6, 7, 8, 9])
      allow($stdin).to receive(:gets).and_return('save')

      game.play_move
      game.reset_save_game

      expect(game.save_game).to eq(false)
    end
  end

  context 'Updates value of @exit_game' do
    it 'changes value of @exit_game to true if input is "exit"' do
      game = game_setup([1, 2, 3, 4, 5, 6, 7, 8, 9])
      allow($stdin).to receive(:gets).and_return('exit')

      game.play_move

      expect(game.exit_game).to eq(true)
    end

    it 'value of @exit_game is false if input is not "save"' do
      game = game_setup([1, 2, 3, 4, 5, 6, 7, 8, 9])
      allow($stdin).to receive(:gets).and_return('1')

      game.play_move

      expect(game.exit_game).to eq(false)
    end

    it 'changes value of @exit_game to false' do
      game = game_setup([1, 2, 3, 4, 5, 6, 7, 8, 9])
      allow($stdin).to receive(:gets).and_return('exit')

      game.play_move
      game.reset_exit_game

      expect(game.exit_game).to eq(false)
    end
  end
end
