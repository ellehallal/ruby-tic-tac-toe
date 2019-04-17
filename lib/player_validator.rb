class PlayerValidator
  def initialize(display)
    @display = display
  end

  def validate_player(player_number)
    @display.ask_for_player_selection(player_number)
    validate_player_selection
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
