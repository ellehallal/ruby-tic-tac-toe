class GameLoader

  def load(filename, name)
    file = YAML.load_file(filename)
    file[name]
  end
end
