class Minimax

  def choose_move(board, current_player, opponent)
    copy_board = board.copy_board
    find_best_move(copy_board, current_player, opponent)
  end

  private

  def find_best_move(board, depth=0, current_player, opponent)
    best_score = {}
    available_squares = board.available_squares

    return score_move(board, depth, current_player, opponent) if 
      board.stop_playing?(current_player, opponent)

    available_squares.each do |square|
      board.player_make_move(current_player, square)

      best_score[square] =
        -1 * find_best_move(board, depth + 1, opponent, current_player)
      board.reset_square(square)
    end

    evaluate_move(depth, best_score)
  end

  def max_best_move(scores)
    scores.max_by { |key, value| value }[0]
  end

  def max_best_score(scores)
    scores.max_by { |key, value| value }[1]
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
end
