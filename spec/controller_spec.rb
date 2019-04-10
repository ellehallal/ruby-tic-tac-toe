require 'controller'
require 'board'
require 'display'
require 'game'
require 'human_player'

def controller_setup
  display = Display.new
  controller = Controller.new(display)
  controller
end

RSpec.describe Controller do
  describe 'Game selection: ' do
    it "returns user's selection of players as an array in lowercase" do
      allow($stdin).to receive(:gets).and_return('C', 'H')
      controller = controller_setup

      selection = controller.player_selection

      expect(selection).to eq(%w[c h])
    end

    it 'prompts user for input again if input is not h or c' do
      allow($stdin).to receive(:gets).and_return('X', 'C', 'H')
      $stdout = StringIO.new
      controller = controller_setup

      controller.player_selection
      output = $stdout.string.split("\n")

      expect(output[0])
        .to eq('Please select player 1 (h = human, c = computer):')
      expect(output[1])
        .to eq('Invalid option selected. Please try again:')
      expect(output[2])
        .to eq('Please select player 1 (h = human, c = computer):')
      expect(output[3])
        .to eq('Please select player 2 (h = human, c = computer):')
    end
  end

  describe 'Creating a Game: ' do
    it 'sets @game to a new instance of Game' do
      controller = controller_setup

      controller.create_game('h', 'c')

      expect(controller.game).to be_an_instance_of(Game)
    end
  end

  describe 'Playing the game: ' do
    it 'plays a game that ends with a tie' do
      $stdout = StringIO.new
      controller = controller_setup
      controller.create_game('h', 'c', %w[x o x o o x x x o])

      controller.play_game
      output = $stdout.string.split("\n")

      expect(output.last).to eq('The game is a tie!')
    end

    it 'plays a game that ends with a winning player' do
      allow($stdin).to receive(:gets).and_return('8', '4', '1')
      $stdout = StringIO.new
      controller = controller_setup
      controller.create_game('h', 'h', [1, 'x', 'x', 4, 'o', 'x', 'x', 8, 'o'])

      controller.play_game
      output = $stdout.string.split("\n")

      expect(output.last).to eq('x is the winner!')
    end
  end
end
