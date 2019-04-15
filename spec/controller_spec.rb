require 'controller'
require 'board'
require 'display'
require 'game'
require 'player_selector'
require 'player_maker'

def controller_setup
  player_maker = PlayerMaker
  display = Display.new
  player_selector = PlayerSelector.new(display, player_maker)
  game_factory = GameFactory.new(player_selector)
  controller = Controller.new(display, game_factory)
  controller
end

RSpec.describe Controller do
  describe 'Playing the game: ' do
    it 'plays a game that ends with a tie' do
      allow($stdin).to receive(:gets).and_return('h', 'h')
      $stdout = StringIO.new
      controller = controller_setup

      controller.main_game(%w[x o x o o x x x o])
      output = $stdout.string.split("\n")

      expect(output.last).to eq('The game is a tie!')
    end

    it 'plays a game that ends with a winning player' do
      allow($stdin).to receive(:gets).and_return('h', 'h', '8', '4', '1')
      $stdout = StringIO.new
      controller = controller_setup

      controller.main_game([1, 'x', 'x', 4, 'o', 'x', 'x', 8, 'o'])
      output = $stdout.string.split("\n")

      expect(output.last).to eq('x is the winner!')
    end
  end
end
