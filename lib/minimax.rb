class Minimax
  def opponent_mark(computer_mark, player1_mark, player2_mark)
    if computer_mark == player1_mark
      player2_mark
    else
      player1_mark
    end
  end

  def terminal_score(board, depth, computer_mark, opponent_mark)
    if board.winning_line?(computer_mark)
      { score: 10 - depth }
    elsif board.winning_line?(opponent_mark)
      { score: -(10 - depth) }
    elsif board.available_squares.empty?
      { score: 0 }
    end
  end

  def best_move(results)
    results.max_by { |result| result[:score] }[:move]
  end

  def highest_score(results)
    results.max_by { |result| result[:score] }[:score]
  end

  def move_or_score(depth, best_move, best_score)
    if depth.zero?
      best_move
    elsif depth > 0
      best_score
    end
  end
end
