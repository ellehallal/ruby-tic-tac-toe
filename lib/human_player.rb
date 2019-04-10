require_relative './player.rb'

class HumanPlayer < Player
  attr_reader :name

  def initialize(mark)
    super(mark)
    @name = 'Human'
  end

  def choose_move(*)
    $stdin.gets.chomp.to_i
  end
end
