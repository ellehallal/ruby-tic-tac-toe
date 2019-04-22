require_relative './test_doubles/display_colour_double'
require 'human_player'
require 'display'
require 'board'

def human_player_setup
  display_colour = DisplayColourDouble.new
  display = Display.new(display_colour)
  HumanPlayer.new('x', 'Human', display)
end

RSpec.describe HumanPlayer do
  describe 'Selecting a move' do
    it 'prompts the player for a move and returns it' do
      allow($stdin).to receive(:gets).and_return('1')
      human_player = human_player_setup
      board = Board.new([1, 'x', 3])

      move = human_player.choose_move(board)

      expect(move).to eq(1)
    end

    it 'informs the player if they have selected an unavailable move' do
      allow($stdin).to receive(:gets).and_return('2', '3')
      $stdout = StringIO.new
      human_player = human_player_setup
      board = Board.new([1, 'x', 3])

      human_player.choose_move(board)
      print $stdout
      output = $stdout.string

      expect(output)
        .to include('You have entered an invalid move. Please try again:')
    end
  end
end
