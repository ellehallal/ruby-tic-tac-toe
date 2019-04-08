require 'controller'
require 'board'
require 'display'
require 'game'
require 'human_player'

def controller_setup(squares)
  board = Board.new(squares)
  display = Display.new
  player1 = HumanPlayer.new('x')
  player2 = HumanPlayer.new('o')
  game = Game.new(board, player1, player2)
  controller = Controller.new(game, display)
  controller
end

RSpec.describe Controller do
  describe 'Playing the game: ' do
    it 'plays a game that ends with a tie' do
      controller = controller_setup(%w[x o x o o x x x o])
      $stdout = StringIO.new

      controller.main_game
      outputs = $stdout.string.split("\n")

      expect(outputs.last).to eq('The game is a tie!')
    end

    it 'plays a game that ends with a winning player' do
      controller = controller_setup([1, 'x', 'x', 4, 'o', 'x', 'x', 8, 'o'])
      allow($stdin).to receive(:gets).and_return('8', '4', '1')
      $stdout = StringIO.new

      controller.main_game
      outputs = $stdout.string.split("\n")

      expect(outputs.last).to eq('x is the winner!')
    end
  end
end
