require 'yaml'

class GameValidator
  def initialize(display)
    @display = display
  end

  def validate_game_type_input
    print "Please enter 'new' to start a new game, or 'existing' to load an existing game:\n"
    selection = $stdin.gets.chomp.downcase

    until %w[new existing].include?(selection)
      print "Invalid game type. Please enter 'new' or 'existing': "
      selection = $stdin.gets.chomp.downcase
    end
    selection
  end

  def existing_game_selection(filename)
    game_name = prompt_for_name
    until game_name_exists?(filename, game_name)
      game_name = prompt_for_correct_name
    end
    game_name
  end

  private

  def game_name_exists?(filename, name)
    file = retrieve_file_contents(filename)
    file.key?(name)
  end

  def retrieve_file_contents(filename)
    file = YAML.load_file(filename)
    file == false ? {} : file
  end

  def prompt_for_name
    @display.game_name_prompt
    $stdin.gets.chomp.downcase
  end

  def prompt_for_correct_name
    @display.invalid_game_message
    $stdin.gets.chomp.downcase
  end
end
