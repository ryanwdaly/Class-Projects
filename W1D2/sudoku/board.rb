class Board

  def Board.from_file
    # solved = File.open("sudoku1-solved.txt")
    # partial = File.open("sudoku1.txt")
    #
    # solved = solved.each_line {|line| }

    @solved = File.readlines('sudoku1-solved.txt').map do |line|
      line.split("").map(&:to_i)
    end
    @partial = File.readlines('sudoku1.txt').map do |line|
      line.split("").map(&:to_i)
    end


  end



  # def initialize(partial)
  #   @partial = partial
  #   @grid = []
  # end

  def render
    dimensions = 9
    puts "---------------------"
    (0...dimensions).each do |i|
      (0...dimensions).each do |j|
        # pos = [i, j]
        print "|#{@partial[i][j]}|"
      end
      puts ""
      puts "---------------------"
    end


  end

  def update_value(pos)

  end

  # def [](pos)
  #   row, col = pos
  #   @partial[row][col]
  # end

  def []=(pos, num)
    row, col = pos
    @partial[row][col] = num
  end


end
