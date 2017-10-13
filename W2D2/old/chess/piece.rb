require_relative 'board'

class Piece
  def initialize(pos)
    # @positions = Board.make_starting_grid
  end

  def to_s
    'p'
  end

  def empty?
  end

  def symbol
  end

  def valid_moves
  end

  private
  def move_into_check(to_pos)
  end
end

class Pawn < Piece
  def initialize(pos, color)

  end

  def symbol
  end

  def moves
  end

  private

  def at_start_row?
  end

  def forward_dir
  end

  def forward_step
  end

  def side_attacks
  end

end

class King < Piece
  def initialize(pos, color)
  end

end
class Knight < Piece
  def initialize(pos, color)
  end

end
class Bishop < Piece
  def initialize(pos, color)
  end

end
class Rook < Piece
  def initialize(pos, color)
    @grid[x][y] = :lw_roo
    @position = pos

  end

  def move_directions
    @move_directions
  end
end
class Queen < Piece
  def initialize(pos, color)
  end

end
class NullPiece< Piece
  def initialize(pos, color="grey")
  end

end
