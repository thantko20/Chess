require_relative "./modules/pieces_classes"
require "pry-byebug"

class MoveGenerator

  include Pieces

  def self.generate_legal_moves(piece, grid)
    # TODO
    # Use current piece type and its position
    # to generate legal moves
    return generate_king_moves(piece, grid) if piece.is_a?(King)
    return generate_queen_moves(piece, grid) if piece.is_a?(Queen)
  end

  def self.generate_king_moves(piece, grid)
    current_position_y = piece.current_position[0]
    current_position_x = piece.current_position[1]
    moves_patterns = [[-1, 0], [1, 0], [0, -1], [0, 1],
                      [1, 1], [-1, -1], [1, -1], [1, 0]]

    moves_array = []
    moves_patterns.each do |move|
      y = move[0] + current_position_y
      x = move[1] + current_position_x
      if !on_the_board?(x, y)
        next
      elsif empty_square?(grid[y][x])
        moves_array << [y, x]
      elsif opponent_piece?(piece, grid[y][x])
        moves_array << [y, x]
      end
    end
    moves_array
  end

  def self.generate_queen_moves(piece, grid)
    horizontal_moves(piece, grid) + vertical_moves(piece, grid) + diagonal_moves(piece, grid)
  end

  def self.generate_sliding_moves(piece, grid, pattern)
    y = piece.current_position[0]
    x = piece.current_position[1]
    moves_array = []
    loop do
      y += pattern[0]
      x += pattern[1]
      return moves_array if !on_the_board?(x, y) 

      curr_square = grid[y][x]
      if empty_square?(curr_square)
        legal_moves_array << [y, x]
      elsif opponent_piece?(piece, curr_square)
        moves_array << [y, x]
        return moves_array
      end
    end
  end

  def self.horizontal_moves(piece, grid)
    generate_sliding_moves(piece, grid, [0, 1]) + generate_sliding_moves(piece, grid, [0, -1])
  end

  def self.vertical_moves(piece, grid)
    generate_sliding_moves(piece, grid, [1, 0]) + generate_sliding_moves(piece, grid, [-1, 0])
  end

  def self.diagonal_moves(piece, grid)
    right_diagonal_moves(piece, grid) + left_diagonal_moves(piece, grid)
  end

  def self.right_diagonal_moves(piece, grid)
    generate_sliding_moves(piece, grid, [-1, 1]) + generate_sliding_moves(piece, grid, [1, -1])
  end

  def self.left_diagonal_moves(piece, grid)
    generate_sliding_moves(piece, grid, [-1, -1]) + generate_sliding_moves(piece, grid, [1, 1])
  end

  def self.opponent_piece?(selected_piece, desired_position)
    selected_piece.colour != desired_position.colour
  end

  def self.empty_square?(desired_position)
    desired_position.nil?
  end

  def self.ally_piece?(selected_piece, desired_position)
    selected_piece.colour == desired_position.colour
  end

  def self.on_the_board?(y, x)
    y.between?(0, 7) && x.between?(0, 7)
  end
end
