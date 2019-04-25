require 'yaml'

class GameValidator

  def validate_selection(filename)
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
    print "Please enter the game name to load: "
    $stdin.gets.chomp
  end

  def prompt_for_correct_name
    print "Invalid game name entered. Please try again:"
    print "Please enter the game name to load: "
    $stdin.gets.chomp
  end
end