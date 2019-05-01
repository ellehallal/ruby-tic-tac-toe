require_relative './display.rb'
require_relative './display_colour.rb'
require_relative './board.rb'
require_relative './player_validator.rb'
require_relative './player_factory.rb'
require_relative './game_factory.rb'
require_relative './game.rb'
require_relative './game_validator.rb'
require_relative './game_loader.rb'
require_relative './game_saver.rb'
require_relative './controller.rb'
require_relative './game_manager.rb'

display = Display.new(DisplayColour.new)
player_validator = PlayerValidator.new(display)
player_factory = PlayerFactory.new(player_validator, display)
game_loader = GameLoader.new
game_saver = GameSaver.new
game_validator = GameValidator.new(display, game_loader)
filename = './data/demo_game_storage.yml'
game_factory = GameFactory.new(player_factory, game_validator, game_loader, filename)
controller = Controller.new(display, game_factory, game_saver, game_validator, filename)
game_manager = GameManager.new(controller, display)

game_manager.play
