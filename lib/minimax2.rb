class Minimax

  attr_reader :self_mark, :opponent_mark, :player1_mark, :player2_mark

  def initialize(self_mark, player1_mark, player2_mark)
    @self_mark = self_mark
    @player1_mark = player1_mark
    @player2_mark = player2_mark
    @opponent_mark = set_opponent_mark
  end

  def find_best_move(board, depth=0, best_score={}, current_player)
    return score(board, depth) if board.complete?

    # scores = []
    # moves = []

    available_moves = board.available_squares

    p "available moves #{available_moves}"

    available_moves.each do |move|
      copy_of_board = board.copy_board
      p "board copy #{copy_of_board.squares}"
      copy_of_board.player_make_move(current_player, move)
      opponent = toggle_current_player(current_player)
      best_score[move] = find_best_move(copy_of_board, depth + 1, {}, opponent)
      # moves.push move
    end

    # p "scores #{scores}"
    # p "moves #{moves}"

    best_move = best_score.max_by { |key, value| value }[0]
    highest_minimax_score = best_score.max_by { |key, value| value }[1]
    p "best_scores #{best_score}"

    p "best move #{best_move}"
    p "highest_score #{highest_minimax_score}"
    if depth == 0
      return best_move
    elsif depth > 0
      return highest_minimax_score
    end

    # if current_player == @self_mark
    #   max_score_index = scores.each_with_index.max[1]

    #   return scores[max_score_index]
    # else
    #   min_score_index = scores.each_with_index.min[1]

    #   return scores[min_score_index]
    # end
  end

  def toggle_current_player(current_mark)
    if current_mark == player1_mark
      player2_mark
    else
      player1_mark
    end
  end

  def score(board, depth)
    if board.winning_line?(self_mark)
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

  private

  def set_opponent_mark
    if self_mark == player1_mark
      opponent_mark = player2_mark
    else
      opponent_mark = player1_mark
    end
  end
end
