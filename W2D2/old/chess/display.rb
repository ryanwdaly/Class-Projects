require_relative 'board'
require_relative 'piece'
require "byebug"

class Display
  attr_accessor :grid
  def initialize
    # @grid = Board.new.grid
  end

  def move(new_pos)
  end

  def render
    system "clear"
    debugger
    print "  0 1 2 3 4 5 6 7"
    puts ""
    8.times do |y|
      print "#{y} "
      8.times do |x|
        # p @grid[x][y]
      end
      puts ""
    end
  end
end
