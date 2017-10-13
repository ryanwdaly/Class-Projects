require_relative 'board'
require_relative 'display'
require_relative 'player'



class Game
  attr_accessor :input
  attr_accessor :display

  def initialize
    @board = Board.new

    @display = Display.new(@board, @cursor)

    @from = nil
    @to = nil
  end

  def play
    while true

    puts "please pick a from coordinate"



    # @from = gets.chomp
    # puts "please pick a to coordinate"
    #
    # @to = gets.chomp
    # @from = normalize_input(@from)
    # @to = normalize_input(@to)
    # @board.move_piece(@from, @to)
    # @board.move_piece!(@from , @to)
    @display.render
  end

  end
  def normalize_input(string)
    digits = %w(0 1 2 3 4 5 6 7 8 9)
    arr = []
    string.each_char do |el|
      arr << Integer(el) if digits.include?(el)
    end
    arr
  end
  private

  def notify_players
  end

  def swap_turn
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Game.new
  b.play
end
