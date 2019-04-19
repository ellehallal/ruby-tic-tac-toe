class Minimax
  attr_reader :self_player, :opponent_player, :player1, :player2

  def initialize(self_player, player1, player2)
    @self_player = self_player
    @opponent_player = set_opponent_mark
    @player1 = player1
    @player2 = player2
  end

  def find_best_move(board, depth=0, best_score={}, current_player_mark)
    return score_move(board) if board.stop_playing?(player1, player2)

    available_squares = board.available_squares

    available_squares.each do |square|
      copy_of_board = board.copy_board
      board.player_make_move(current_player_mark, square)

      opponent_mark = toggle_player(current_player_mark)
      best_score[square] =
         -1 * find_best_move(copy_of_board, depth + 1, {}, opponent_mark)

      board.reset_square(square)
    end

    p best_score
    p evaluate_move(depth, best_score)
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
    p "depth #{depth}"
    if depth.zero?
      max_best_move(scores)
    elsif depth > 0
      max_best_score(scores)
    end
  end

  def score_move(board)
    if board.complete?
      0
    elsif board.winning_player_exists?(player1, player2)
      -1
    end
  end

  def toggle_player(mark)
    if mark == player1
      player2
    else
      player1
    end
  end

  def set_opponent_mark
    if self_player == player1
      opponent_mark = player2
    else
      opponent_mark = player1
    end
  end
end