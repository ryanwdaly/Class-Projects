require_relative 'card.rb'
require_relative 'game.rb'
require 'byebug'
class Board
  attr_reader :grid
  def initialize(game)
    @game = game
    @grid = Array.new(4) {Array.new(4) {nil}}
  end

  # def populate
  #   letters = ("a".."h").to_a
  #   dup_letters = ("a".."h").to_a
  #
  #   letters += dup_letters
  #   letters = letters.shuffle
  #
  #   (0...4).each do |i|
  #     (0...4).each do |j|
  #       pos = [i, j]
  #       self[pos] = letters.pop
  #     end
  #
  #   end
  #   @grid
  # end

  def populate
    letters = ("a".."h").to_a
    dup_letters = ("a".."h").to_a

    letters += dup_letters
    letters = letters.shuffle

    (0...4).each do |i|
      (0...4).each do |j|
        pos = [i, j]
        new_card = Card.new(letters[-1])
        self[pos] = new_card
        letters.pop

      end

    end
    

  end


  def render

    (0...4).each do |i|
      (0...4).each do |j|

        pos = [i, j]
          if @game.correctly_guessed.include?(pos)
            card_name = self[pos].to_s

            print "| #{card_name} |"
          else
            print "| X |"
          end


      end
      puts ""
    end
  end

  def empty?(pos)

    return false if self[pos] == nil
    true
  end

  def random_pos
    [rand(size), rand(size)]
  end

  def size
    @grid.length
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, letter)
    row, col = pos
    @grid[row][col] = letter
  end


  def won?

  end

  def reveal

  end

end
