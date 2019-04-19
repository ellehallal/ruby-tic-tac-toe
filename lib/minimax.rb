class Minimax

  def find_best_move(board, depth=0, best_score={}, current_player, player1, player2)
    opponent = set_opponent(current_player, player1, player2)
    available_squares = board.available_squares

    return score_move(board, depth, current_player, opponent) if 
      board.stop_playing?(player1, player2)

    available_squares.each do |square|
      copy_of_board = board.copy_board
      board.player_make_move(current_player, square)

      best_score[square] =
         -1 * find_best_move(copy_of_board, depth + 1, opponent, player1, player2)
      board.reset_square(square)
    end

    evaluate_move(depth, best_score)
  end

  private

  def max_best_move(scores)
    scores.max_by { |_key, value| value }[0]
  end

  def max_best_score(scores)
    scores.max_by { |_key, value| value }[1]
  end

  def evaluate_move(depth, scores)
    depth.zero? ? max_best_move(scores) : max_best_score(scores)
  end

  def score_move(board, depth, current_player, opponent)
    if board.winning_line?(current_player)
      10 - depth
    elsif board.winning_line?(opponent)
      depth - 10
    else
      0
    end
  end

  def set_opponent(current_player, player1, player2)
    current_player == player1 ? player2 : player1
  end
end
