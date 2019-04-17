require 'minimax'
require 'board'

def minimax_setup
  Minimax.new
end

def board_setup(squares = [1, 2, 3, 4, 5, 6, 7, 8, 9])
  Board.new(squares)
end

RSpec.describe Minimax do
  describe 'Toggle player:' do
    it "returns the current player's mark as x" do
      minimax = minimax_setup
      current_mark = 'o'
      player1_mark = 'x'
      player2_mark = 'o'

      current_player =
        minimax.toggle_current_player(current_mark, player1_mark, player2_mark)

      expect(current_player).to eq('x')
    end

    it "returns the current player's mark as o" do
      minimax = minimax_setup
      current_mark = 'x'
      player1_mark = 'x'
      player2_mark = 'o'

      current_player =
        minimax.toggle_current_player(current_mark, player1_mark, player2_mark)

      expect(current_player).to eq('o')
    end
  end

  describe 'Returns score:' do
    it 'returns {score: 0} if neither player has a winning line' do
      minimax = minimax_setup
      board = board_setup(%w[o x o x x o x o x])
      depth = 9
      computer_mark = 'x'
      opponent_mark = 'o'

      score =
        minimax.score(board, depth, computer_mark, opponent_mark)

      expect(score).to eq(0)
    end

    it 'returns {score: 5} when computer player has a winning line at depth 5' do
      minimax = minimax_setup
      board = board_setup(['x', 'x', 'x', 'o', 'o', 6, 7, 8, 9])
      depth = 5
      computer_mark = 'x'
      opponent_mark = 'o'

      score =
        minimax.score(board, depth, computer_mark, opponent_mark)

      expect(score).to eq(5)
    end

    it 'returns {score: -4} when opponent has a winning line at depth 6' do
      minimax = minimax_setup
      board = board_setup(['x', 'x', 3, 'o', 'o', 'o', 'x', 8, 9])
      depth = 6
      computer_mark = 'x'
      opponent_mark = 'o'

      score =
        minimax.score(board, depth, computer_mark, opponent_mark)

      expect(score).to eq(-4)
    end
  end

  describe 'Best move: ' do
    minimax = minimax_setup
    scores = { 7 => 0, 8 => 4, 9 => -3 }

    it 'Returns the move with the highest score ' do
      move = minimax.best_move(scores)

      expect(move).to eq(8)
    end
  end

  describe 'Best score: ' do
    minimax = minimax_setup
    scores = { 7 => 0, 8 => 4, 9 => -3 }

    it 'Returns the highest score ' do
      move = minimax.highest_score(scores)

      expect(move).to eq(4)
    end
  end

  describe 'Best move or highest score: ' do
    minimax = minimax_setup
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
end
