require_relative './human_player.rb'
require_relative './computer_player.rb'

class PlayerMaker
  PLAYER_TYPES = {
    'h' => HumanPlayer,
    'c' => ComputerPlayer
  }.freeze

  def self.create(player_type, mark, display)
    (PLAYER_TYPES[player_type]).new(mark, display)
  end
end
