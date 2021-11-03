require_relative "./modules/displayable"
require_relative "board"

class Game
  include Displayable

  def initialize
    @player1 = nil
    @player2 = nil
    @board = Board.new
    @curr_player = nil
  end

  def play
    # Intro implementation
    # Game Loop Implementation
  end

  def game_loop
    # Program Logic
    # Keep track of current player
    # Select the piece implementation
    # Move the piece implementation
    # Check and Checkmate Implementaion
    DisplayBoard.display_board_interface(@board.position_grid)
  end

  def select_piece
    # Loop program
    # Based on current player's colour and piece's position,
    # run the method selecting the piece and
    # returning the position
  end

  def move_piece
    # Ask the player where to move on the board
    # Allow only legit moves and set the new postion on the board
  end
end

game = Game.new
game.game_loop