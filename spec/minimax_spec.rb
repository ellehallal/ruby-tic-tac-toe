require 'minimax'
require 'board'

def board_setup(squares = [1, 2, 3, 4, 5, 6, 7, 8, 9])
  Board.new(squares)
end

RSpec.describe Minimax do
  describe 'Finding the best score ' do
    it 'Returns 3 as the best score for o to win and block x from winning' do
      minimax = Minimax.new
      board = board_setup(['x', 'o', 3, 4, 'x', 'o', 'x', 8, 'o'])

      move = minimax.find_best_move(board, 'o', 'x', 'o')
      expect(move).to eq(3)
    end

    it 'Returns 3 as the best score to block x from winning' do
      minimax = Minimax.new
      board = board_setup([1, 'x', 3, 4, 5, 'x', 'o', 'o', 'x'])

      move = minimax.find_best_move(board, 'o', 'x', 'o')
      expect(move).to eq(3)
    end

    it 'Returns 9 as the best score for current player x to win' do
      minimax = Minimax.new
      board = board_setup([1, 2, 3, 'o', 'o', 6, 'x', 'x', 9])

      move = minimax.find_best_move(board, 'x', 'x', 'o')
      expect(move).to eq(9)
    end

    it 'Returns 3 or 7 as the best move to start creating a winning line' do
      minimax = Minimax.new
      board = board_setup(['o', 2, 3, 4, 'x', 'o', 7, 8, 'x'])

      move = minimax.find_best_move(board, 'x', 'x', 'o')

      expect(move).to eq(3).or(eq(7))
    end

    it 'Returns 4 or 5 as the best move to start creating a winning line' do
      minimax = Minimax.new
      board = board_setup(['x', 'o', 3, 4, 5, 6, 7, 8, 9])

      move = minimax.find_best_move(board, 'x', 'x', 'o')

      expect(move).to be_between(4, 5)
    end

    it 'Plays a blocking move (9) to prevent opponent from winning' do
      minimax = Minimax.new
      board = board_setup(['x', 'o', 3, 'o', 'o', 'x', 'x', 'x', 9])

      move = minimax.find_best_move(board, 'o', 'x', 'o')

      expect(move).to eq(9)
    end
  end
end
