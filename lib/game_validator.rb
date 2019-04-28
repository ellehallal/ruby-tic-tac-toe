require 'yaml'

class GameValidator
  def initialize(display)
    @display = display
  end

  def validate_game_type_input
    @display.game_type_prompt
    selection = $stdin.gets.chomp.downcase

    until %w[new existing].include?(selection)
      @display.invalid_game_type_message
      selection = $stdin.gets.chomp.downcase
    end
    selection
  end

  def new_game_name(filename)
    game_name = prompt_for_name
    until game_name_not_exists?(filename, game_name)
      game_name = prompt_for_new_name
    end
    game_name
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

  def game_name_not_exists?(filename, name)
    file = retrieve_file_contents(filename)
    file[name].nil?
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

  def prompt_for_new_name
    @display.game_name_exists_message
    $stdin.gets.chomp.downcase
  end
end
