require_relative './human_player.rb'
require_relative './computer_player.rb'

class PlayerMaker
  PLAYER_TYPES = {
    'h' => [HumanPlayer, 'Human'],
    'c' => [ComputerPlayer, 'Computer']
  }.freeze

  def self.create(player_type, mark, display)
    player_class = PLAYER_TYPES[player_type][0]
    player_name = PLAYER_TYPES[player_type][1]

    player_class.new(mark, player_name, display)
  end
end
