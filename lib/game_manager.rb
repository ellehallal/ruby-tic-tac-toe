class GameManager
  def initialize(controller, display)
    @controller = controller
    @display = display
  end

  def play
    @display.show_welcome_message
    game_loop
    @display.show_exit_message
  end

  def play_again?
    @display.ask_play_again
    choice = $stdin.gets.chomp.upcase
    choice == 'Y'
  end

  private

  def game_loop
    play_game = true
    while play_game
      @controller.main_game
      play_game = play_again?
    end
  end
end
