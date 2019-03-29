require 'controller'
require 'board'
require 'display'
require 'game'
require 'player'

def controller_setup(squares)
  board = Board.new(squares)
  display = Display.new
  player1 = Player.new('x')
  player2 = Player.new('o')
  game = Game.new(board, player1, player2)
  controller = Controller.new(game, display)
  controller
end

RSpec.describe Controller do
  describe 'Playing the game: ' do

    it 'breaks the loop when the game is a tie' do
      controller = controller_setup(['x', 'o', 'x', 'o', 'o', 'x', 'x', 'x', 'o'])

      expect(controller).not_to receive(:play_move)
      expect(controller).to receive(:end_of_game).once
      controller.main_game
    end

    it 'should have a better name' do
      game = object_double(Game.new(nil, nil, nil), :over? => true, :tie_or_won => 'x' )
      display = object_double(Display.new, :display_board => "hi", :show_game_outcome => 'tie', :show_current_player => 'x')
      controller = Controller.new(game, display)

      controller.main_game

      expect(display).to have_received(:show_game_outcome)
      expect(display).not_to have_received(:show_current_player)
      expect(game).to have_received(:tie_or_won)
    end
  end
end
