require 'game_factory'

RSpec.describe GameFactory do
  describe 'Creating players:' do
    it 'creates a human vs human game' do
      allow($stdin).to receive(:gets).and_return('H', 'H')
      squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      player_validator = PlayerValidator.new(Display.new, PlayerFactory)
      game_factory = GameFactory.new(player_validator)

      game = game_factory.create_game(squares)

      expect(game.current_player).to be_an_instance_of(HumanPlayer)
      game.toggle_current_player
      expect(game.current_player).to be_an_instance_of(HumanPlayer)
    end

    it 'creates a computer vs computer game' do
      allow($stdin).to receive(:gets).and_return('C', 'C')
      squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      player_validator = PlayerValidator.new(Display.new, PlayerFactory)
      game_factory = GameFactory.new(player_validator)

      game = game_factory.create_game(squares)

      expect(game.current_player).to be_an_instance_of(ComputerPlayer)
      game.toggle_current_player
      expect(game.current_player).to be_an_instance_of(ComputerPlayer)
    end

    it 'creates a computer vs human game' do
      allow($stdin).to receive(:gets).and_return('C', 'H')
      squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      player_validator = PlayerValidator.new(Display.new, PlayerFactory)
      game_factory = GameFactory.new(player_validator)

      game = game_factory.create_game(squares)

      expect(game.current_player).to be_an_instance_of(ComputerPlayer)
      game.toggle_current_player
      expect(game.current_player).to be_an_instance_of(HumanPlayer)
    end
  end
end
