require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class PlayerFactory
  PLAYER_TYPES = {
    'h' => [HumanPlayer, 'Human'],
    'c' => [ComputerPlayer, 'Computer']
  }.freeze

  def initialize(player_validator, display)
    @player_validator = player_validator
    @display = display
  end

  def create_player(mark, player_number)
    player_type = @player_validator.validate_player(player_number)

    player_class = PLAYER_TYPES[player_type][0]
    player_name = PLAYER_TYPES[player_type][1]

    player_class.new(mark, player_name, @display)
  end
end
