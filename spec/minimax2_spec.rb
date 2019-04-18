require 'minimax'
require 'board'

def minimax_setup(self_mark, player1_mark, player2_mark)
  minimax = Minimax.new(self_mark, player1_mark, player2_mark)
  minimax
end

def board_setup(squares = [1, 2, 3, 4, 5, 6, 7, 8, 9])
  Board.new(squares)
end

RSpec.describe Minimax do
  describe 'Toggle player:' do
    it "returns the current player's mark as x" do
      minimax = minimax_setup('o', 'x', 'o')

      current_player =
        minimax.toggle_current_player('o')

      expect(current_player).to eq('x')
    end

    it "returns the current player's mark as o" do
      minimax = minimax_setup('x', 'x', 'o')

      current_player =
        minimax.toggle_current_player('x')

      expect(current_player).to eq('o')
    end
  end

  describe 'Returns score:' do
    it 'returns 0 if neither player has a winning line' do
      minimax = minimax_setup('x', 'x', 'o')
      board = board_setup(%w[o x o x x o x o x])
      depth = 9

      score = minimax.score(board, depth)

      expect(score).to eq(0)
    end

    it 'returns 5 when computer player has a winning line at depth 5' do
      minimax = minimax_setup('x', 'x', 'o')
      board = board_setup(['x', 'x', 'x', 'o', 'o', 6, 7, 8, 9])
      depth = 5

      score = minimax.score(board, depth)

      expect(score).to eq(5)
    end

    it 'returns -4 when opponent has a winning line at depth 6' do
      minimax = minimax_setup('x', 'x', 'o')
      board = board_setup(['x', 'x', 3, 'o', 'o', 'o', 'x', 8, 9])
      depth = 6

      score = minimax.score(board, depth)

      expect(score).to eq(-4)
    end
  end

  describe 'Best move: ' do
    minimax = minimax_setup('o', 'x', 'o')
    scores = { 7 => 0, 8 => 4, 9 => -3 }

    it 'Returns the move for the highest score (max)' do
      move = minimax.max_best_move(scores)

      expect(move).to eq(8)
    end

    it 'Returns the move for the lowest score (min)' do
      move = minimax.min_best_move(scores)

      expect(move).to eq(9)
    end
  end

  describe 'Best score: ' do
    minimax = minimax_setup('o', 'x', 'o')
    scores = { 7 => 0, 8 => 4, 9 => -3 }

    it 'Returns the highest score (max)' do
      move = minimax.max_best_score(scores)

      expect(move).to eq(4)
    end

    it 'Returns the lowest score (min)' do
      move = minimax.min_best_score(scores)

      expect(move).to eq(-3)
    end
  end

  describe 'Best move or highest score: ' do
    minimax = minimax_setup('o', 'x', 'o')
    best_move = 7
    best_score = 3

    it 'Returns the best move when depth = 0 ' do
      depth = 0
      move_or_score = minimax.move_or_score(depth, best_move, best_score)

      expect(move_or_score).to eq(7)
    end

    it 'Returns the best score when depth is more than 0 ' do
      depth = 2
      move_or_score = minimax.move_or_score(depth, best_move, best_score)

      expect(move_or_score).to eq(3)
    end
  end

  describe 'Best move or highest score: ' do
    minimax = minimax_setup('o', 'x', 'o')
    best_move = 7
    best_score = 3

    it 'Returns the best move when depth = 0 ' do
      depth = 0
      move_or_score = minimax.move_or_score(depth, best_move, best_score)

      expect(move_or_score).to eq(7)
    end

    it 'Returns the best score when depth is more than 0 ' do
      depth = 2
      move_or_score = minimax.move_or_score(depth, best_move, best_score)

      expect(move_or_score).to eq(3)
    end
  end

  describe 'Finding the best score ' do

    it 'Returns 9 as the best score' do
      minimax = minimax_setup('x', 'x', 'o')
      board = board_setup([1, 2, 3, 'o', 'o', 6, 'x', 'x', 9])

      move = minimax.find_best_move(board, 0, 'x')
      expect(move).to eq(9)
    end

    it 'Returns 3 as the best score' do
      minimax = minimax_setup('o', 'x', 'o')
      board = board_setup(['x', 'o', 3, 4, 'x', 'o', 'x', 8, 'o'])

      move = minimax.find_best_move(board, 0, 'o')
      expect(move).to eq(3)
    end

    it '*******Returns 7 as the best score' do
      minimax = minimax_setup('o', 'x', 'o')
      board = board_setup([1, 'x', 3, 4, 5, 'x', 'o', 'o', 'x'])

      move = minimax.find_best_move(board, 0, 'o')
      expect(move).to eq(3)
    end

  end
end
