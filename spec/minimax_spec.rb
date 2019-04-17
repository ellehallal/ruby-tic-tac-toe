require 'minimax'
require 'board'

def minimax_setup
  Minimax.new
end

def board_setup(squares = [1, 2, 3, 4, 5, 6, 7, 8, 9])
  Board.new(squares)
end

RSpec.describe Minimax do
  describe 'Opponent mark:' do
    it "returns the opponent's mark as x" do
      minimax = minimax_setup
      computer_mark = 'o'
      player1_mark = 'x'
      player2_mark = 'o'

      opponent_mark =
        minimax.opponent_mark(computer_mark, player1_mark, player2_mark)

      expect(opponent_mark).to eq('x')
    end

    it "returns the opponent's mark as o" do
      minimax = minimax_setup
      computer_mark = 'x'
      player1_mark = 'x'
      player2_mark = 'o'

      opponent_mark =
        minimax.opponent_mark(computer_mark, player1_mark, player2_mark)

      expect(opponent_mark).to eq('o')
    end
  end

  describe 'Returns score:' do
    it 'returns {score: 0} if neither player has a winning line' do
      minimax = minimax_setup
      board = board_setup(%w[x x o x x o o o x])
      depth = 10
      computer_mark = 'x'
      opponent_mark = 'o'

      score =
        minimax.terminal_score(board, depth, computer_mark, opponent_mark)

      expect(score).to eq(score: 0)
    end

    it 'returns {score: 5} when computer player has a winning line at depth 5' do
      minimax = minimax_setup
      board = board_setup(['x', 'x', 'x', 'o', 'o', 6, 7, 8, 9])
      depth = 5
      computer_mark = 'x'
      opponent_mark = 'o'

      score =
        minimax.terminal_score(board, depth, computer_mark, opponent_mark)

      expect(score).to eq(score: 5)
    end

    it 'returns {score: -4} when opponent has a winning line at depth 6' do
      minimax = minimax_setup
      board = board_setup(['x', 'x', 3, 'o', 'o', 'o', 'x', 8, 9])
      depth = 6
      computer_mark = 'x'
      opponent_mark = 'o'

      score =
        minimax.terminal_score(board, depth, computer_mark, opponent_mark)

      expect(score).to eq(score: -4)
    end
  end

  describe 'Best move: ' do
    minimax = minimax_setup
    results = [{ move: 9, score: 0 }, { move: 7, score: -5 }, { move: 8, score: 4 }]

    it 'Returns the move with the highest score ' do
      move = minimax.best_move(results)

      expect(move).to eq(8)
    end
  end

  describe 'Best score: ' do
    minimax = minimax_setup
    results = [{ move: 9, score: 0 }, { move: 7, score: -5 }, { move: 8, score: 4 }]

    it 'Returns the highest score ' do
      move = minimax.highest_score(results)

      expect(move).to eq(4)
    end
  end
end
