class GameLoader

  def load(filename, name)
    file = retrieve_file_contents(filename)
    file[name]
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
