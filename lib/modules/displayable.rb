require "pry-byebug"

module Displayable
  class DisplayText
    def self.instructions
      # TODO
    end
  end

  class DisplayBoard
    def self.display_board_interface(grid)
      8.times do |y|
        y = 7 - y
        8.times do |x|
          (x + y).even? ? print("\e[40m#{single_square_blueprint(grid[y][x])}\e[0m") : print("\e[105m#{single_square_blueprint(grid[y][x])}\e[0m")
        end
        puts
      end
    end

    def self.single_square_blueprint(square)
      square.nil? ? '  ' : "#{square.symbol} "
    end
  end
end