require_relative './human_player.rb'
require_relative './computer_player.rb'
require_relative './game.rb'
require_relative './board.rb'

class GameFactory
  PLAYER_TYPES = {
    'h' => HumanPlayer,
    'c' => ComputerPlayer
  }.freeze

  def self.create_players(player_type1, player_type2)
    {
      player1: (PLAYER_TYPES[player_type1]).new('x'),
      player2: (PLAYER_TYPES[player_type2]).new('o')
    }
  end

  def self.build(squares, player_type1, player_type2)
    players = create_players(player_type1, player_type2)
    Game.new(Board.new(squares), players[:player1], players[:player2])
  end
end
