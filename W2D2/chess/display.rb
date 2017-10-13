require_relative 'board'
require_relative 'piece'
require_relative 'cursor'
require "byebug"
require "colorize"

class Display
  attr_accessor :grid, :board
  def initialize(board, cursor)
    @board = board
    @cursor = Cursor.new([0,0], @board)
    render
  end

  def move(new_pos)
  end

  def render
    system "clear"


    print "  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7"
    puts ""
    8.times do |y|
      print "#{y} |"
      8.times do |x|
        if x.odd?
          print " #{@board.grid[x][y]} |".colorize(:black).colorize(background: :white)
        else
          print " #{@board.grid[x][y]} |"
        end
      end
      puts ""
    end
    @cursor.get_input
    pos = @cursor.cursor_pos
    @board.grid[pos.first][pos.last].to_s.colorize(background: :green)
  end
end
