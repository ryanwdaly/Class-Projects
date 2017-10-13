require_relative "Tile.rb"
require "colorize"
class Board
  attr_accessor :grid

  def self.from_file (file)
    arr = Array.new(9) {Array.new}
    i = 0
    File.foreach(file) do |line|
      line.each_char do |num|
        if num.to_i != 0
          given = true
        else
          given = false
        end

        t = Tile.new(given, num.to_i)
        arr[i] << t
      end
      i += 1
      if i > arr.length
        break
      end
    end
    #print arr
    puts "This is green".colorize(:green)
    arr
  end

  def initialize (grid)
    @grid = grid
  end

  def update (pos)

  end

  def render
    puts ColorizedString["This is blue"].colorize(:blue)
  end

end

if __FILE__ == $PROGRAM_NAME
  b = Board.new(Board.from_file("sudoku1.txt"))

end
