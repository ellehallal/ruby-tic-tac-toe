require 'game_factory'
require 'display'
require 'player_maker'
require 'player_selector'

RSpec.describe GameFactory do
  describe '' do
    it 'creates a human vs human game' do
      allow($stdin).to receive(:gets).and_return('H', 'H')
      squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      player_selector = PlayerSelector.new(Display.new, PlayerMaker)
      game_factory = GameFactory.new(player_selector)

      game = game_factory.create_game(squares)

      expect(game.current_player).to be_an_instance_of(HumanPlayer)
      game.toggle_current_player
      expect(game.current_player).to be_an_instance_of(HumanPlayer)
    end
  end
end
