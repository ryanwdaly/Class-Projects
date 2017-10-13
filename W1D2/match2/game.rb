require_relative 'board.rb'
require_relative 'card.rb'

class Game
  attr_reader :correctly_guessed
  def initialize
    @correctly_guessed = []
    @board = Board.new(self)
  end

  def play
    puts "Hello! This code has been a nightmare!"
    @board.populate
    until false

      @board.render
      coordinates = prompt


      if correct_guess?(coordinates)
        guess1 = coordinates[0]
        guess2 = coordinates[1]

        @correctly_guessed << guess1
        @correctly_guessed << guess2
      else
        card = @board[guess1]
        print "your guessed: #{card}"
        puts ""
        puts "incorrect guess, please try again"

      end
    end
  end

  def is_won?
    @board.grid.each do |row|
      row.each do |card|
        return false if card.reveal == false
      end
    end
    true
  end

  def prompt
    x1 = -1
    y1 = -1
    x2 = -1
    y2 = -1

    # x1 = 0
    # y1 = 1
    # x2 = 2
    # y2 = 2

    until valid_input?(x1, y1)
      puts "Enter coordinate X for card#1"
      x1 = gets.chomp.to_i
      puts "Enter coordinate Y for card#1"
      y1 = gets.chomp.to_i

      unless valid_input?(x1, y1)
        puts "incorrect coordinate, please try again"
      end

    end

    until valid_input?(x2, y2)
      puts "Enter coordinate X for card#2"
      x2= gets.chomp.to_i
      puts "Enter coordinate Y for card#2"
      y2 = gets.chomp.to_i

      unless valid_input?(x2, y2)
        puts "incorrect coordinate, please try again"
      end

    end

    return [[x1,y1], [x2, y2]]
  end

  def valid_input?(x, y)
    unless x >= 0 && x <= 3
      return false
    end
    unless y >= 0 && y <= 3
      return false
    end
    true
  end

  def correct_guess?(coordinates)
    guess1 = coordinates[0]
    guess2 = coordinates[1]

    if @board[guess1].letter == @board[guess2].letter
      return true if guess1 != guess2
    end

    false
  end



end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
