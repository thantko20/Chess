class Piece
  attr_reader :symbol, :colour
  attr_accessor :current_position

  def initialize(colour, symbol)
    @colour = colour
    @symbol = symbol
  end

  def legal_moves
    # TODO
  end
end