class Board
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
    default_array[0] = nil # RKBQKBKR
    default_array[1] = nil # PPPPPPPP
    
    # Set default positions for black pieces
    default_array[6] = nil # rkbqkbkr
    default_array[7] = nil # pppppppp

    default_array
  end
end
