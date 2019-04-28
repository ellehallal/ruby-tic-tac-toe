class GameLoader
  def load(filename, name)
    file = retrieve_file_contents(filename)
    file[name]
  end

  private

  def retrieve_file_contents(filename)
    file = YAML.load_file(filename)
    file == false || file.nil? ? {} : file
  end
end
