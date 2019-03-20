require 'game'

RSpec.describe Game do
  before :each do
    @game = Game.new
  end

  it 'prompts the user for their move and returns the move as an integer' do
    allow($stdin).to receive(:gets).and_return('1')
    move = @game.prompt_make_move
    expect(move).to eq(1)
  end
end
