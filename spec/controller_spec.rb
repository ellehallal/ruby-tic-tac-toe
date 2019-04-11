require 'controller'
require 'board'
require 'display'
require 'board'
require 'game'
require 'human_player'

def controller_setup(squares)
  display = Display.new
  board = Board.new(squares)
  player1 = HumanPlayer.new('x', display)
  player2 = HumanPlayer.new('o', display)
  game = Game.new(board, player1, player2)
  controller = Controller.new(game, display)
  controller
end

RSpec.describe Controller do
  describe 'Playing the game: ' do
    it 'plays a game that ends with a tie' do
      $stdout = StringIO.new
      controller = controller_setup(%w[x o x o o x x x o])

      controller.main_game
      output = $stdout.string.split("\n")

      expect(output.last).to eq('The game is a tie!')
    end

    it 'plays a game that ends with a winning player' do
      allow($stdin).to receive(:gets).and_return('8', '4', '1')
      $stdout = StringIO.new
      controller = controller_setup([1, 'x', 'x', 4, 'o', 'x', 'x', 8, 'o'])

      controller.main_game
      output = $stdout.string.split("\n")

      expect(output.last).to eq('x is the winner!')
    end
  end
end
