class Game
  attr_reader :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def prompt_make_move
    move = $stdin.gets.chomp
    move.to_i
  end

  def toggle_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
end
