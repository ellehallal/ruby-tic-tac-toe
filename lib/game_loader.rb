class GameLoader

  def load(filename, name)
    file = load_file(filename)
    file[name]
  end

  def exists?(filename, name)
    file = load_file(filename)
    file.key?(name)
  end

  private

  def load_file(filename)
    file = YAML.load_file(filename)
    file == false ? {} : file
  end
end
