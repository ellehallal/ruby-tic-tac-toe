class Player
  attr_reader :mark, :name
  def initialize(mark, name, display)
    @mark = mark
    @display = display
    @name = name
  end
end
