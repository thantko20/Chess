require_relative "./modules/pieces_classes"
require_relative "./modules/pieces_symbols"
require_relative "move_generator"

class Board
  include Pieces
  include PiecesSymbols

  attr_reader :position_grid

  def initialize
    @position_grid = set_default_postion
    assign_positions_to_each_piece
  end

  def update_board
    # Update the board
    # Will get the piece and destroy its current postion,
    # and update its new position
    assign_positions_to_each_piece
  end

  def generate_moves(position)
    x = position[0].to_i
    y = position[1].to_i
    MoveGenerator.generate_legal_moves(@position_grid[y][x], @position_grid)
  end

  def set_default_postion
    # Set all the pieces to starting positions
    # 8x8 grid
    default_array = Array.new(8) { Array.new(8) { nil } }
    
    # Set default positions for white pieces
    default_array[0] = [Rook.new('w', white_rook), Knight.new('w', white_knight), Bishop.new('w', white_bishop), Queen.new('w', white_queen),
                        King.new('w', white_king), Bishop.new('w', white_bishop), Knight.new('w', white_knight), Rook.new('w', white_rook)] # RKBQKBKR
    default_array[1] = Array.new(8) { Pawn.new('w', white_pawn) } # PPPPPPPP
    default_array[1][3] = nil
    
    # Set default positions for black pieces
    default_array[7] = [Rook.new('b', black_rook), Knight.new('b', black_knight), Bishop.new('b', black_bishop), Queen.new('b', black_queen),
                        King.new('b', black_king), Bishop.new('b', black_bishop), Knight.new('b', black_knight), Rook.new('b', black_rook)] # rkbqkbkr
    default_array[6] = Array.new(8) { Pawn.new('b', black_pawn) } # pppppppp

    default_array
  end

  def assign_positions_to_each_piece
    8.times do |row|
      8.times do |column|
        @position_grid[row][column].current_position = [row, column]  if !@position_grid[row][column].nil?
      end
    end
  end

  def find_king(colour)
    8.times do |row|
      8.times do |column|
        current_square = @position_grid[row][column]
        return current_square if !current_square.nil? && current_square.instance_of?(King) && current_square.colour == colour
      end
    end
  end
end

board = Board.new
p board.find_king('b')
p board.generate_moves('03')