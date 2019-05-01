class GameLoader
  def load(filename, name)
    file = get_file_contents(filename)
    file[name]
  end

  def existing_game_names(filename)
    file = get_file_contents(filename)
    file.keys
  end

  def get_file_contents(filename)
    file = YAML.load_file(filename)
    file == false || file.nil? ? {} : file
  end
end
