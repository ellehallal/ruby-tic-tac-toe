require_relative '../../lib/display_colour.rb'

class DisplayColourDouble < DisplayColour
  def greet_colour(output)
    output
  end

  def input_prompt_colour(output)
    output
  end

  def warning_colour(output)
    output
  end

  def board_colour(output)
    output
  end

  def player_colour(_mark, output)
    output
  end

  def tie_outcome_colour(output)
    output
  end
end
