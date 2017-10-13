require_relative 'display'
require_relative 'piece'
require 'byebug'
class Board
  attr_accessor :grid

  def initialize
    self.make_starting_grid
  end
  def dup
  end

  def move_piece(color, from_pos, to_pos)
  end

  def move_piece!(from_pos, to_pos)

  end

  def check_mate?
  end

  def [](pos)
    x, y  = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end




  # protected

  def make_starting_grid
    @grid = Array.new(8){Array.new(8)}
  #whites
    #rook
    # @grid[7, 7] = Rook.new([7,7])
    # @grid[] = Rook.new([0,7])
    #bishops
      #
      (0...2).each do |y|
        (0..7).each do |x|
          # debugger
            self[[x, y]] = Piece.new([x,y])
        end
      end
      #blanks
      (2..5).each do |y|
        (0..7).each do |x|
          # debugger
            self[[x, y]] = Piece.new([x,y])
        end
      end

      (6..7).each do |y|
        (0..7).each do |x|
            self[[x, y]] = Piece.new([x,y])
        end
      end
  end

  def find_king(color)



  end
end
