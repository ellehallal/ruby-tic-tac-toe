class PlayerValidator
  def initialize(display, player_factory)
    @display = display
    @player_factory = player_factory
  end

  def create_player(player_number, mark)
    @display.ask_for_player_selection(player_number)
    type = validate_player_selection
    @player_factory.create(type, mark, @display)
  end

  private

  def validate_player_selection
    selection = $stdin.gets.chomp.downcase

    until %w[h c].include?(selection)
      @display.show_invalid_option_message
      selection = $stdin.gets.chomp.downcase
    end
    selection
  end
end
