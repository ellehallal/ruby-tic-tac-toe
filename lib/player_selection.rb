class PlayerSelection
  def initialize(display, player_maker)
    @display = display
    @player_maker = player_maker
  end

  def player1_type
    @display.ask_for_player1
    type = validate_player_selection
    @player_maker.create(type, 'x', @display)
  end

  def player2_type
    @display.ask_for_player2
    type = validate_player_selection
    @player_maker.create(type, 'o', @display)
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
