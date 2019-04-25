require 'yaml'

class GameSaver

  def save(filename, name, object)
    game_storage = retrieve_file_contents(filename)
    game_storage[name] = object
    File.open(filename, "w") { |file| file.write game_storage.to_yaml }
  end

  def exists?(filename, name)
    file = retrieve_file_contents(filename)
    file.key?(name)
  end

  private

  def retrieve_file_contents(filename)
    file = YAML.load_file(filename)
    file == false ? {} : file
  end
end
