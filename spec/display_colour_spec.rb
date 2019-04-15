require 'display_colour'

RSpec.describe DisplayColour do
  display_colour = DisplayColour.new

  describe 'Greet colour:' do
    it 'displays greeting in ansi colour \e[1;38;2;255;140;0m' do
      output = display_colour.greet_colour('Hello! Goodbye')

      expect(output).to include("\e[1;38;2;255;140;0m")
    end
  end

  describe 'Input prompt colour:' do
    it 'displays input prompt in ansi colour \e[1;38;2;64;249;155m' do
      output = display_colour.input_prompt_colour('Prompt')

      expect(output).to include("\e[1;38;2;64;249;155m")
    end
  end

  describe 'Warning colour:' do
    it 'displays warning message in ansi colour \e[7;1;38;2;222;60;75m' do
      output = display_colour.warning_colour('Warning')

      expect(output).to include("\e[7;1;38;2;222;60;75m")
    end
  end

  describe 'Board colour:' do
    it 'displays board in ansi colour \e[7;1;38;2;222;60;75m' do
      output = display_colour.board_colour('Board')

      expect(output).to include("\e[1;38;2;0;255;221m")
    end
  end

  describe 'Player colour:' do
    it 'displays player x in ansi colour \e[7;1;38;2;255;220;0m' do
      output = display_colour.player_colour('x', 'Player x prompt')

      expect(output).to include("\e[7;1;38;2;255;220;0m")
    end

    it 'displays player o in ansi colour \e[7;1;38;2;255;109;153m' do
      output = display_colour.player_colour('o', 'Player o prompt')

      expect(output).to include("\e[7;1;38;2;255;109;153m")
    end

    it 'displays tie message in ansi colour \e[7;1;38;2;226;227;255m' do
      output = display_colour.tie_outcome_colour('Tie')

      expect(output).to include("\e[7;1;38;2;226;227;255m")
    end
  end
end
