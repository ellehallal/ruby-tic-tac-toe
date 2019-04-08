class Player
  attr_reader :mark
  def initialize(mark)
    @mark = mark
  end

  def choose_move
    $stdin.gets.chomp.to_i
  end
end
