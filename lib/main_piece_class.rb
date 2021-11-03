class Piece
  attr_reader :symbol

  def initialize(colour, symbol)
    @colour = colour
    @symbol = symbol
  end

  def legal_moves
    # TODO
  end
end