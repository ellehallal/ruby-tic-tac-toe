class Minimax
  def toggle_current_player(current_mark, player1_mark, player2_mark)
    if current_mark == player1_mark
      player2_mark
    else
      player1_mark
    end
  end

  def score(board, depth, computer_mark, opponent_mark)
    if board.winning_line?(computer_mark)
      10 - depth
    elsif board.winning_line?(opponent_mark)
      depth - 10
    elsif board.available_squares.empty?
      0
    end
  end

  def max_best_move(scores)
    scores.max_by { |_key, value| value }[0]
  end

  def max_best_score(scores)
    scores.max_by { |_key, value| value }[1]
  end

  def min_best_move(scores)
    scores.min_by { |_key, value| value }[0]
  end

  def min_best_score(scores)
    scores.min_by { |_key, value| value }[1]
  end

  def move_or_score(depth, best_move, best_score)
    if depth.zero?
      best_move
    elsif depth > 0
      best_score
    end
  end

  def move_or_score(depth, best_move, best_score)
    if depth.zero?
      best_move
    elsif depth > 0
      best_score
    end
  end
end
