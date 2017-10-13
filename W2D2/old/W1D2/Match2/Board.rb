require_relative "Card.rb"

class Board
  VALUES = [:diamond, :heart, :spade, :club, :triangle]
  attr_accessor :grid

  def initialize
    @grid = Array.new(2) { Array.new(5) }
  end

  def populate
    i = 0
    j = 0
    while i < 10
      @grid[i] = Card.new(VALUES[j])
      i += 1
      @grid[i] = Card.new(VALUES[j])
      j+= 1
      i += 1
      if j > 4
        break
      end
    end

    @grid = @grid.shuffle
  end

  def render
    @grid.each do |card|
      if card.state == :down
        print "[ ] "
      else
        print "[#{card.value}] "
      end
    end
    print "\n"
  end

  def won?
    @grid.all? { |card| card.state == :up }
  end

  def reveals(pos)
    @grid[pos].reveal
  end

  def [] (pos)
    board.grid[pos[0]][pos[1]]
  end

  def []=(pos, c)
    board.grid[pos[0]][pos[1]] = c
  end

end
