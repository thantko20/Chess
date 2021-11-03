require "pry-byebug"

module Displayable
  class DisplayText
    def instructions
      # TODO
    end
  end

  class DisplayBoard
    def self.display_board_interface(grid)
      # Implementation Here
      8.times do |y|
        8.times do |x|
          (y + x) % 2 == 0 ? print("\e[41m#{single_square_blueprint(grid[y][x])}\e[0m") : print("\e[47m#{single_square_blueprint(grid[y][x])}\e[0m")
        end
        puts
      end
    end

    def self.single_square_blueprint(square)
      square == nil ? '  ' : "#{square.symbol} "
    end
  end
end