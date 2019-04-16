require 'paint'

class DisplayColour
  def greet_colour(output)
    Paint[output, :bold, '#FF8C00']
  end

  def input_prompt_colour(output)
    Paint[output, :bright, '#40F99B']
  end

  def warning_colour(output)
    Paint[output, :inverse, :bold, '#DE3C4B']
  end

  def board_colour(output)
    Paint[output, :bright, '#00FFDD']
  end

  def player_colour(mark, output)
    if mark == 'x'
      Paint[output, :inverse, :bright, '#FFDC00']
    else
      Paint[output, :inverse, :bright, '#FF6D99']
    end
  end

  def tie_outcome_colour(output)
    Paint[output, :inverse, :bright, '#E2E3FF']
  end
end
