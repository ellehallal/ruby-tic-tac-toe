class Minimax

  def find_best_move(board, depth=0, best_score={}, current_player, player1, player2)
    return score_move(board) if board.stop_playing?(player1, player2)

    available_squares = board.available_squares

    available_squares.each do |square|
      copy_of_board = board.copy_board
      board.player_make_move(current_player, square)
      opponent = toggle_player(current_player, player1, player2)

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

  def score_move(board)
    board.complete? ? 0 : -1
  end

  def toggle_player(current_player, player1, player2)
    current_player == player1 ? player2 : player1
  end
end
