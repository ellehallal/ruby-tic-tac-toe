require 'yaml'

class GameSaver

  def save(filename, name, object)
    game_storage = retrieve_file_contents(filename)
    game_storage[name] = object
    File.open(filename, "w") { |file| file.write game_storage.to_yaml }
  end

  private

  def retrieve_file_contents(filename)
    file_content = YAML.load_file(filename)
    file_content == false ? {} : file_content
  end
end