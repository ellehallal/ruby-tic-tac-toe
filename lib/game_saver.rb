require 'yaml'

class GameSaver
  def save(filename, name, object)
    game_storage = get_file_contents(filename)
    game_storage[name] = object
    File.open(filename, 'w') { |file| file.write game_storage.to_yaml }
  end

  private

  def get_file_contents(filename)
    file = YAML.load_file(filename)
    file == false || file.nil? ? {} : file
  end
end
