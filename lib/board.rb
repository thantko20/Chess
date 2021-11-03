require_relative "./modules/pieces_classes"
require_relative "./modules/pieces_symbols"

class Board
  include Pieces
  include PiecesSymbols

  attr_reader :position_grid

  def initialize
    @position_grid = set_default_postion
  end

  def update_board
    # Update the board
    # Will get the piece and destroy its current postion,
    # and update its new position
  end

  private

  def set_default_postion
    # Set all the pieces to starting positions
    # 8x8 grid
    default_array = Array.new(8) { Array.new(8) { nil } }
    
    # Set default positions for white pieces
    default_array[0] = [Rook.new('w', white_rook), Knight.new('w', white_knight), Bishop.new('w', white_bishop), Queen.new('w', white_queen),
                        King.new('w', white_king), Bishop.new('w', white_bishop), Knight.new('w', white_knight), Rook.new('w', white_rook)] # RKBQKBKR
    default_array[1] = Array.new(8) { Pawn.new('w', white_pawn) } # PPPPPPPP
    
    # Set default positions for black pieces
    default_array[7] = [Rook.new('b', black_rook), Knight.new('b', black_knight), Bishop.new('b', black_bishop), Queen.new('b', black_queen),
                        King.new('b', black_king), Bishop.new('b', black_bishop), Knight.new('b', black_knight), Rook.new('b', black_rook)] # rkbqkbkr
    default_array[6] = Array.new(8) { Pawn.new('b', black_pawn) } # pppppppp

    default_array
  end
end
